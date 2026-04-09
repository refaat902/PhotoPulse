

import 'package:photopulse/core/constant/error_messages.dart';

class FailedResponseModelData {
  List<String?>? userName;
  List<String?>? clientName;
  List<String?>? phone;
  List<String?>? email;
  List<String?>? address;
  List<String?>? password;
  List<String?>? companyCode;
  List<String?>? otp;
  List<String?>? oldPassword;
  List<String?>? newPassword;
  List<String?>? confirmPassword;

  FailedResponseModelData({
    this.userName,
    this.clientName,
    this.phone,
    this.email,
    this.address,
    this.password,
    this.companyCode,
    this.otp,
    this.oldPassword,
    this.newPassword,
    this.confirmPassword,
  });
  FailedResponseModelData.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      final v = json['name'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['mobile'] != null) {
      final v = json['mobile'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      phone = arr0;
    }
    if (json['email'] != null) {
      final v = json['email'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      email = arr0;
    }
    if (json['address'] != null) {
      final v = json['address'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      address = arr0;
    }
    if (json['user_name'] != null) {
      final v = json['user_name'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      userName = arr0;
    }
    if (json['password'] != null) {
      final v = json['password'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      password = arr0;
    }
    if (json['company_code'] != null) {
      final v = json['company_code'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      companyCode = arr0;
    }
    if (json['otp'] != null) {
      final v = json['otp'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      otp = arr0;
    }
    if (json['old_password'] != null) {
      final v = json['old_password'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      oldPassword = arr0;
    }
    if (json['new_password'] != null) {
      final v = json['new_password'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      newPassword = arr0;
    }
    if (json['password_confirmation'] != null) {
      final v = json['password_confirmation'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      confirmPassword = arr0;
    }
  }
}

class FailedResponseModel {
  bool? status;
  String? message;
  int? code;
  FailedResponseModelData? errors;

  FailedResponseModel({this.status, this.message, this.errors, this.code});

  FailedResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errors = json['error'] != null
        ? FailedResponseModelData.fromJson(json['error'])
        : null;
    code = json['code'];
    message = json['message'] ?? ErrorMessages.Un_Authorized_Error_En_Err;
  }
}
