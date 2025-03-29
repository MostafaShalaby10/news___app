import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/core/dio_helper/api_service.dart';
import 'package:news_app/features/home/model/models/ResponseModel.dart';
import 'package:news_app/features/home/model/repos/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  @override
  Future<dynamic> getNews({required ApiService apiService}) async {
    var response = await apiService.get();
    return response.data["articles"];
  }

  @override
  Future logout() async{
  return await  getIt<FirebaseAuth>().signOut();
  }
}
