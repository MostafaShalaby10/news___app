import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/core/widgets/custom_text_widget.dart';
import 'package:news_app/features/home/model/repos/home_repo_imp.dart';
import 'package:news_app/features/home/model_view/cubit/home_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepoImp>())..getNews(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          log(state.toString());
        },
        builder: (context, state) {
          HomeCubit homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
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
                                    onTap: () => launchUrl(
                                        Uri.parse(homeCubit.news[index].url!)),
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

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.discription,
    required this.author,
    required this.publishedAt,
  });
  final String image;
  final String title;
  final String discription;
  final String author;
  final String publishedAt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(image),
          ),

          CustomTextWidget(
            text: title,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          CustomTextWidget(
            text: discription,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                text: author,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              Expanded(
                child: CustomTextWidget(
                  textAlign: TextAlign.end,
                  text: publishedAt,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
