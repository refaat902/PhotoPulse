



import 'faild_response_model.dart';

class ErrorException implements Exception {
  bool? status;
  int? code;
  String? message;
  String? detail;
  String? errors;
  FailedResponseModelData? error;

  ErrorException({this.status, this.code, this.message , this.error,this.detail,this.errors});

  ErrorException.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    detail = json['detail'] ;
    errors = json['errors'] ;
    error = json['error'] != null ? FailedResponseModelData.fromJson(json['error']): null;
  }
}
