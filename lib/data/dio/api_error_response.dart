// class ApiErrorResponse<T> {
//   final String? message;
//   final T? errors;

//   ApiErrorResponse(
//       {
//        this.message,
//        this.errors});

//   factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
//     return ApiErrorResponse(
//       message: json["message"],
//       errors: json["data"],
//     );
//   }
// }