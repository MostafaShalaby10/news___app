import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/core/dio_helper/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  Future<Response> get() async {
    // https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ff942302e838446ba58edb4b05aa1b99
    log("In api service");
    var response = await _dio.get("${apiURL}sources=$dataType&apiKey=$apiKey");
    return response;
  }
}
