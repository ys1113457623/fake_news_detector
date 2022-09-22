import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_news_detector/helper/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/news.dart';
import '../helper/widgets.dart';
import '../models/categorie_model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;
  var newslist;
  var fakenewlist;

  List<CategorieModel> categories = List<CategorieModel>();

  void getNews() async {
    News news = News();
    Utils fakenew = Utils();
    await news.getTopNews();
    fakenewlist = fakenew.getFakeNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      /// Categories
                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 16),
                      //   height: 70,
                      //   child: ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemCount: categories.length,
                      //       itemBuilder: (context, index) {
                      //         return CategoryCard(
                      //           imageAssetUrl: categories[index].imageAssetUrl,
                      //           categoryName: categories[index].categorieName,
                      //         );
                      //       }),
                      // ),

                      /// News Article
                      ///
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Latest news",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontFamily: GoogleFonts.nunito().fontFamily),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: CarouselSlider.builder(
                            options: CarouselOptions(
                                viewportFraction: 0.8,
                                initialPage: 1,
                                aspectRatio: 1.5,
                                disableCenter: true,
                                enlargeCenterPage: false,
                                enableInfiniteScroll: false),
                            itemCount: newslist.length,
                            itemBuilder: (context, index, realIndex) {
                              return NewsTile(
                                author: newslist[index].author ?? " ",
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                              );
                            }),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Top Fake News",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontFamily: GoogleFonts.nunito().fontFamily),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: CarouselSlider.builder(
                            options: CarouselOptions(
                                viewportFraction: 0.8,
                                initialPage: 1,
                                aspectRatio: 1.5,
                                disableCenter: true,
                                enlargeCenterPage: false,
                                enableInfiniteScroll: false),
                            itemCount: fakenewlist.length,
                            itemBuilder: (context, index, realIndex) {
                              return NewsTile(
                                author: fakenewlist[index].author ?? " ",
                                imgUrl: fakenewlist[index].urlToImage ?? "",
                                title: fakenewlist[index].title ?? "",
                                desc: fakenewlist[index].description ?? "",
                                content: fakenewlist[index].content ?? "",
                                posturl: fakenewlist[index].articleUrl ?? "",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
