class ApiResult<T extends Serializable> {
  bool? status;
  String? message;
  T? data;
  ApiResult({
    required this.status,
    required this.message, 
    required this.data,
  });

  factory ApiResult.fromJson(Map<String, dynamic>? json, Function(Map<String, dynamic>) create, {String? field}) {
    return ApiResult<T>(
      status: json?['status'] == "ok",
      message: json?['message'] != null ? json!['message'] : (json?['error'] ?? ''),
      data: field != null
        ? json![field] != null
          ? create(json[field] ?? {})
          : create({})
        : create(json?['data'] ?? {}),
    );
  }

  factory ApiResult.failure(String message, int statusCode) {
    return ApiResult<T>(
      status: false,
      message: message,
      data: null
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ApiResultList<T extends Serializable> {
  bool? status;
  String? message;
  List<T>? data;

  ApiResultList({this.status, this.message, this.data});

  factory ApiResultList.fromJson(Map<String, dynamic>? json, Function(List<dynamic>) build, {String? field}) {
    return ApiResultList<T>(
      status: json?['status'] == "ok",
      message: json?['message'] ?? (json?['error'] ?? ""),
      data: field != null
        ? build(json?[field])
        : json?['data'] != null
          ? build(json?['data'])
          : build([]),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    "message": message,
    "data": data?.toList(),
  };
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}