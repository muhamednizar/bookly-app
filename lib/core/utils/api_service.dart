import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final baseurl = "https://www.googleapis.com/books/v1/";

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('$baseurl$endpoint');

    return response.data;
  }
}
