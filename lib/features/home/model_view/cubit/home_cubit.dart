import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/core/Utils/shared_prefrences.dart';
import 'package:news_app/core/dio_helper/api_service.dart';
import 'package:news_app/features/home/model/models/ResponseModel.dart';
import 'package:news_app/features/home/model/repos/home_repo_interface.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoInterface homeRepoInterface;
  HomeCubit(this.homeRepoInterface) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<ResponseModel> news = [];
  Future getNews() async {
    news = [];
    emit(LoadingGetNews());
    homeRepoInterface
        .getNews(apiService: getIt<ApiService>())
        .then((value) {
          for (var element in value) {
            news.add(ResponseModel.fromJson(element));
          }
          emit(SuccessfullyGetNews());
        })
        .catchError((error) {
          print(error);
          emit(ErrorGetNews(error.toString()));
        });
  }

  Future logout() async {
    emit(LoadingLogOut());
    homeRepoInterface
        .logout()
        .then((value) {
          SharedPrefs.removeData(key: "user");
          emit(SuccessfullyLogout());
        })
        .catchError((error) {
          emit(ErrorLogout(error.toString()));
        });
  }
}
