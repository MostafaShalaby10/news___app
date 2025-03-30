
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/custom_text_widget.dart';

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
