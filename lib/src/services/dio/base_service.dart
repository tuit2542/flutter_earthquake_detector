import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseService {
  late Dio dio;

  static String uri = dotenv.env['BASE_URL']!;

  BaseService() {
    dio = Dio(
      BaseOptions(
        baseUrl: uri, // 🔹 เปลี่ยนเป็น API ของคุณ
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // 📌 เพิ่ม Interceptor (สำหรับดักจับ Request/Response)
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('🔵 Request: ${options.method} ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('🟢 Response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print('🔴 Error: ${e.message}');
        return handler.next(e);
      },
    ));
  }

  // 📌 Method สำหรับ GET Request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      print('Error in BaseService: $e');
      rethrow;
    }
  }

  // 📌 Method สำหรับ POST Request
  // Future<Response> post(
  //   String endpoint, {
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     return await dio.post(endpoint, data: queryParameters);
  //   } catch (e) {
  //     throw Exception('POST Error: $e');
  //   }
  // }

  // 📌 Method สำหรับ PUT Request
  // Future<Response> put(
  //   String endpoint, {
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     return await dio.put(endpoint, data: queryParameters);
  //   } catch (e) {
  //     throw Exception('PUT Error: $e');
  //   }
  // }

  // 📌 Method สำหรับ DELETE Request
  // Future<Response> delete(String endpoint) async {
  //   try {
  //     return await dio.delete(endpoint);
  //   } catch (e) {
  //     throw Exception('DELETE Error: $e');
  //   }
  // }
}
