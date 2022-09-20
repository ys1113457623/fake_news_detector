import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/news.dart';
import '../helper/widgets.dart';
import '../models/categorie_model.dart';
import 'categorie_news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading;
  var newslist;

  List<CategorieModel> categories = List<CategorieModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
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
                                aspectRatio: 2.0,
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
                                aspectRatio: 2.0,
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
