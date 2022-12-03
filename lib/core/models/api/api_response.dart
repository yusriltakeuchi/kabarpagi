
import 'package:kabarpagi/core/models/api/api_result_model.dart';

class APIResponse extends Serializable {
  final bool? status;
  final String? message;
  final Map<String, dynamic>? data;

  APIResponse({
    this.status,
    this.message,
    required this.data,
  });

  factory APIResponse.fromJson(Map<String, dynamic> json, int statusCode) {
    return APIResponse(
      status: json['status'] == "ok",
      message: json['message'] ?? (json['error'] ?? ''),
      data: json['data'] ?? json,
    );
  }

  factory APIResponse.failure(String message, int statusCode) {
    return APIResponse(
      status: false,
      message: message,
      data: null
    );
  }
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }
}
