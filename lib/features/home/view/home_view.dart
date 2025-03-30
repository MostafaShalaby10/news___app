import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/core/widgets/custom_text_widget.dart';
import 'package:news_app/features/home/model/repos/home_repo_imp.dart';
import 'package:news_app/features/home/model_view/cubit/home_cubit.dart';
import 'package:news_app/features/search/view/search_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/widgets/list_item.dart';
import '../../login/view/login_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepoImp>())..getNews(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SuccessfullyLogout) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) =>  SearchView(items: homeCubit.news,)),
                  );
                },
                icon: Icon(Icons.search),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    homeCubit.logout();
                  },
                  child: const CustomTextWidget(
                    text: "Logout",
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.red,
                  ),
                ),
              ],
              centerTitle: true,
              title: const CustomTextWidget(
                text: "News App",
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            body:
                state is! LoadingGetNews
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: homeCubit.news.length,
                              itemBuilder:
                                  (context, index) => InkWell(
                                    onTap:
                                        () => launchUrl(
                                          Uri.parse(homeCubit.news[index].url!),
                                        ),
                                    child: ListViewItem(
                                      image: homeCubit.news[index].urlToImage!,
                                      title: homeCubit.news[index].title!,
                                      discription:
                                          homeCubit.news[index].description!,
                                      author: homeCubit.news[index].author!,
                                      publishedAt:
                                          homeCubit.news[index].publishedAt!,
                                    ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
