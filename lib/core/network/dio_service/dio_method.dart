import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photopulse/core/constant/error_messages.dart';
import '../exceptions/error_exception.dart';
import '../network_respone_code/nertwork_response_code.dart';

Future serverRequest({
  required Future<Response> Function() call,
}) async {
  try {
    final r = await call.call();

    if (r.data is Map<String, dynamic>) {
      if (r.data['status'] == false) {
        throw ErrorException.fromJson(r.data);
      }
    }

    return r.data;
  } on DioException catch (e) {
    debugPrint("Error_Message => ${e.message}");
    debugPrint("Error_Error => ${e.error.toString()}");
    debugPrint("response_Message => ${e.response.toString()}");

    if (e.type == DioExceptionType.connectionError) {
      throw ErrorException(
        message: ErrorMessages.Network_Connection_Ar_Error,
      );
    } else if (e.response!.statusCode == ResponseCodes.unAuthorized) {
      throw ErrorException(
        code: ResponseCodes.unAuthorized,
        message: ErrorMessages.Un_Authorized_Error_Ar_Err,
      );
    } else {
      throw ErrorException.fromJson(e.response!.data as Map<String, dynamic>);
    }
  } on ErrorException catch (e) {
    ErrorException exception = e;

    throw ErrorException(
      code: exception.code,
      status: exception.status,
      message: exception.message,
      detail: exception.detail,
      errors: exception.errors,
      error: exception.error,
    );
  } catch (e) {
    throw ErrorException(
      message: e.toString(),
    );
  }
}
