import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/article_view.dart';
import '../views/main_screen.dart';

Widget MyAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: GestureDetector(
      onTap: () {
        Get.to(
            () => MyHomePage(
                  pageIndex: 1,
                ),
            preventDuplicates: false,
            transition: Transition.circularReveal);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30.h,
            width: 250.w,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffF0F1FA)),
                borderRadius: BorderRadius.circular(16.sp)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.h),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.h),
                  child: Row(
                    children: [
                      Text(
                        "Search Fake News",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff818181).withOpacity(0.6),
                            fontFamily: GoogleFonts.nunito().fontFamily),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.search,
                        color: const Color(0xff818181).withOpacity(0.6),
                      )
                    ],
                  )),
            ),
          ),
          const Spacer(),
          Container(
            height: 28.h,
            width: 28.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xffFF3A44), Color(0xffFF8086)]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 20.h,
            ),
          )
        ],
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, author;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl,
      this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ArticleView(postUrl: posturl));
      },
      child: Card(
        elevation: 5,
        shadowColor: Theme.of(context).disabledColor,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Container(
                height: 100000.h,
                child: Image.network(
                  imgUrl as String,
                  fit: BoxFit.cover,
                )),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 50.0.sp, right: 20.sp, left: 20.sp, bottom: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "by $author",
                    style: GoogleFonts.nunito().copyWith(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        title as String,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: GoogleFonts.nunito().copyWith(
                            fontSize: 19.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        content as String,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.nunito().copyWith(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
