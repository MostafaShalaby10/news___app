import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/home/model/models/ResponseModel.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  List<ResponseModel> searchItems = [];
  void searchForItems(List<ResponseModel> items, String title) {
    searchItems = [];
    emit(LodaingSearchForItems());
    for (var item in items) {
      if (item.title!.toLowerCase().contains(title)) {
        log(item.title!);
        searchItems.add(item);
      }
    }
    emit(SuccessfullySearchForItems());
  }
}
