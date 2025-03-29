import 'package:dio/dio.dart';

import '../../../../core/dio_helper/api_service.dart';

abstract class HomeRepoInterface {
  Future<dynamic> getNews({required ApiService apiService});
}
