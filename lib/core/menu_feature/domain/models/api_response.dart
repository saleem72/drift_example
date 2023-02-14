// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'dart:convert';

class ApiResponse<T> {
  final T? data;
  final bool status;
  final String? message;
  final int code;

  ApiResponse({
    this.data,
    required this.status,
    this.message,
    required this.code,
  });

  factory ApiResponse.fromMap(
      Map<String, dynamic> json, Function fromJsonModel) {
    return ApiResponse(
      data: json["data"] != null ? fromJsonModel(json["data"]) : null,
      status: json["status"],
      code: json["code"] != null ? json["code"] as int : 200,
      message: json["message"],
    );
  }

  factory ApiResponse.fromJson(String response, Function fromJsonModel) {
    return ApiResponse.fromMap(json.decode(response), fromJsonModel);
  }
}
