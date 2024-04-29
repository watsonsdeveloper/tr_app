import 'dart:io';

class ServiceResult<T> {
  final int? statusCode;
  final bool? isSuccess;
  final String? errorMessage;
  final T? data;

  ServiceResult(
      {this.statusCode, this.isSuccess, this.errorMessage, required this.data});

  // from json
  factory ServiceResult.fromJson(Map<String, dynamic> json) {
    return ServiceResult<T>(
      statusCode: HttpStatus.ok,
      isSuccess: json['isSuccess'],
      errorMessage: json['errorMessage'],
      data: json['data'],
    );
  }

  ServiceResult<T> copyWith({
    int? status,
    bool? isSuccess,
    String? errorMessage,
    T? data,
  }) {
    return ServiceResult<T>(
      statusCode: status ?? this.statusCode,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
}
