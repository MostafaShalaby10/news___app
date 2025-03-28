import 'package:dio/dio.dart';
import 'package:news_app/core/dio_helper/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response> get() async {
    var response = await _dio.get("${apiURL}sources=$dataType&apiKey=$apiURL" ,);
    return response;
  }
}
