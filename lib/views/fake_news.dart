import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FakeNews extends StatefulWidget {
  const FakeNews({Key key}) : super(key: key);

  @override
  State<FakeNews> createState() => _FakeNewsState();
}

class _FakeNewsState extends State<FakeNews> {
  List<String> items = [
    "Home",
    "Explore",
    "Search",
  ];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fake",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.share,
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Colors.white70
                                : Colors.white54,
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                            border: current == index
                                ? Border.all(
                                    color: Colors.deepPurpleAccent, width: 2)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: GoogleFonts.laila(
                                  fontWeight: FontWeight.w500,
                                  color: current == index
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.all(20.0.w),
            child: TextFormField(
              minLines: 20,
              maxLines: 10000000,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "Enter Your Fake News Here",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          ElevatedButton(
              onPressed: (() {}),
              child: Container(
                width: 100.w,
                height: 30.h,
                child: Center(child: Text("Submit")),
              ))
        ],
      ),
    );
  }
}
