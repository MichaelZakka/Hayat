// // ignore_for_file: deprecated_member_use

// import 'package:dio/dio.dart';
// import 'package:hayat/data/constant/api_constant.dart';
// import 'package:hayat/data/dio/api_error_response.dart';
// import 'package:hayat/data/dio/api_response.dart';
// import 'package:hayat/data/dio/app_exception.dart';
// // import 'package:online_ticketing/controllers/app_storage.dart';
// import 'dio_interceptors.dart';

// class DioClient {
//   final dio = Dio()..interceptors.add(DioInterceptors());

//   Future<ApiResponse> getRequest(
//     String apiUrl, {
//     Map<String, dynamic>? queryParameters,
//     CancelToken? cancelToken,
//     Options? options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final Response response =
//           await dio.get(baseUrl + apiUrl, queryParameters: queryParameters);

//       return ApiResponse.fromJson(response.data);
//     } on DioError catch (e) {
//       print(e);
//       throw ServerException(message: e.response!.data['message']);
//     }
//   }

//   Future<ApiResponse?> postRequest(
//     String apiUrl, {
//     data,
//     CancelToken? cancelToken,
//     Options? options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final Response response = await dio.post(
//         baseUrl + apiUrl,
//         data: data,
//         options: options,
//       );

//       return ApiResponse.fromJson(response.data);
//     } on DioError catch (e) {
//       print('[----------');
//       print(e);
//       print('[----------');
//       return null;
//     }
//   }

//   Future<ApiResponse> putRequest(
//     String apiUrl, {
//     Object? data,
//     CancelToken? cancelToken,
//     Options? options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       Response response =
//           await dio.put(baseUrl + apiUrl, data: data, options: options);
//       return ApiResponse.fromJson(response.data);
//     } on DioError catch (e) {
//       return ApiResponse.fromJson(e.response?.data);
//     }
//   }

//   deleteRequest(
//     String apiUrl, {
//     data,
//     CancelToken? cancelToken,
//     options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     print('deleterequest');
//     Response response =
//         await dio.delete(baseUrl + apiUrl, data: data, options: options);
//     return ApiResponse.fromJson(response.data);
//   }

//   Future<ApiResponse> pinCodeRequest(
//     String apiUrl, {
//     data,
//     CancelToken? cancelToken,
//     Options? options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final Response response =
//           await dio.post(baseUrl + apiUrl, data: data, options: options);
//       final cookies = response.headers.map['set-cookie'];

//       String token = cookies![0].split(';')[0];
//       print('=====> cookies: $token');

//       print('=====> Response: \n ${response.data}');
//       return ApiResponse.fromJson(response.data);
//     } on DioError catch (e) {
//       print(e);
//       print(e.response!.data['message']);
//       print(e.response!.data['status']);
//       print(e.response!.data['data']);
//       // TopSnackBar.warning(e.response!.data['message']);
//       return ApiResponse.fromJson(e.response!.data);
//     }
//   }

//   postRequest1(
//     String apiUrl, {
//     data,
//     CancelToken? cancelToken,
//     Options? options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {

//     final Response response = await dio.post(
//       baseUrl + apiUrl,
//       data: data,
//       options: options,
//     );
//       print('error');
//     if (response.statusCode != 200) {
//       return ApiErrorResponse.fromJson(response.data);
//     }
//     return ApiResponse.fromJson(response.data);
//   }

//   Future putRequest1(
//     String apiUrl, {
//     data,
//     CancelToken? cancelToken,
//     options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       print('putrequest1');
//       Response response = await dio.put(
//         baseUrl + apiUrl,
//         data: data,
//         options: options,
//       );
//       if (response.statusCode == 200) {
//         print('insideif');

//         return ApiResponse.fromJson(response.data);
//       } else {
//         print('inside else');
//         return ApiErrorResponse.fromJson(response.data);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   deleteRequest1(
//     String apiUrl, {
//     data,
//     CancelToken? cancelToken,
//     options,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     Response response =
//         await dio.delete(baseUrl + apiUrl, data: data, options: options);
//     print('deleterequest');

//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       return ApiResponse.fromJson(response.data);
//     }
//       print(response.statusCode);

//     return ApiErrorResponse.fromJson(response.data);
//   }
// }
