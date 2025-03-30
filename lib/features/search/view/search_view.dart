import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';
import 'package:news_app/features/home/model/models/ResponseModel.dart';
import 'package:news_app/features/home/view/home_view.dart';
import 'package:news_app/features/search/model_view/cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  final List<ResponseModel> items;
  const SearchView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SearchCubit searchCubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextFormFieldWidget(
                    hintText: "Type title to search",
                    prefixIcon: Icons.search,
                    controller: searchController,
                    onChanged: (value) {
                      log(value);
                      searchCubit.searchForItems(items, value);
                    },
                  ),
                  state is! LodaingSearchForItems
                      ? Expanded(
                        child: ListView.builder(
                          itemCount: searchCubit.searchItems.length,

                          itemBuilder:
                              (context, index) => ListViewItem(
                                image:
                                    searchCubit.searchItems[index].urlToImage!,
                                title: searchCubit.searchItems[index].title!,
                                discription:
                                    searchCubit.searchItems[index].description!,
                                author: searchCubit.searchItems[index].author!,
                                publishedAt:
                                    searchCubit.searchItems[index].publishedAt!,
                              ),
                        ),
                      )
                      : const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
