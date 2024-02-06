class ServiceResponse<T> {
  final bool? isSuccess;
  final String? errorMessage;
  final T data;

  ServiceResponse({this.isSuccess, this.errorMessage, required this.data});

  // from json
  factory ServiceResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ServiceResponse<T>(
      isSuccess: json['isSuccess'],
      errorMessage: json['errorMessage'],
      data: json['data'],
    );
  }

  ServiceResponse<T> copyWith({
    bool? isSuccess,
    String? errorMessage,
    T? data,
  }) {
    return ServiceResponse<T>(
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
}
