import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FakeNews extends StatefulWidget {
  const FakeNews({Key key}) : super(key: key);

  @override
  State<FakeNews> createState() => _FakeNewsState();
}

class _FakeNewsState extends State<FakeNews> {
  List<String> items = [
    "Political",
    "Media",
    "Other",
  ];
  File pickedImage;
  var data;
  var output;
  String sumbittext;
  int current = 0;
  bool show = false;
  var url;
  fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Colors.white,
          height: 170.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Pic Image From",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("CAMERA"),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    pickImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text("GALLERY"),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      useRootNavigator: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Fake",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "News",
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Selection",
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            labelStyle: Theme.of(context).textTheme.headline5,
            tabs: const [
              Tab(
                text: 'Text',
              ),
              Tab(
                text: 'Image',
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: Center(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      sumbittext = items[index];
                                      print(sumbittext);
                                      current = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.all(5),
                                    width: 80.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: current == index
                                          ? Colors.white70
                                          : Colors.white54,
                                      borderRadius: current == index
                                          ? BorderRadius.circular(15)
                                          : BorderRadius.circular(10),
                                      border: current == index
                                          ? Border.all(
                                              color: Colors.deepPurpleAccent,
                                              width: 2)
                                          : null,
                                    ),
                                    child: Center(
                                      child: Text(
                                        items[index],
                                        style: GoogleFonts.nunito(
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: TextFormField(
                    minLines: 20,
                    maxLines: 10000000,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      url = 'http://10.12.32.84:8000/$value';
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter Your Fake News Here",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        show = true;
                      });
                      data = await fetchdata(url);

                      print(data);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              color: const Color(0xff757575),
                              child: Container(
                                padding: const EdgeInsets.all(20.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(child: SizedBox()),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              icon: Icon(Icons.close,
                                                  color: Colors.blue, size: 28),
                                              onPressed: () {
                                                setState(() {
                                                  show = false;
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 60),
                                      Text("Accuracy Of The Predicit Result"),
                                      Container(
                                          child:
                                              SfRadialGauge(axes: <RadialAxis>[
                                        RadialAxis(
                                            minimum: 0,
                                            maximum: 100,
                                            pointers: <GaugePointer>[
                                              NeedlePointer(
                                                  value: double.tryParse(data))
                                            ])
                                      ]))
                                      // Text(data,
                                      //     style: TextStyle(
                                      //         color: Colors.blue,
                                      //         fontSize: 100,
                                      //         fontWeight: FontWeight.bold)),
                                      // SizedBox(height: 100),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: const Center(child: Text("Submit")),
                    )),
                show
                    ? CircularProgressIndicator(color: Colors.black)
                    : Text(""),
                Container(
                  height: 100.h,
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 60.h,
                  child: Center(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sumbittext = items[index];
                                    print(sumbittext);
                                    current = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.all(5),
                                  width: 80.w,
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                    color: current == index
                                        ? Colors.white70
                                        : Colors.white54,
                                    borderRadius: current == index
                                        ? BorderRadius.circular(15)
                                        : BorderRadius.circular(10),
                                    border: current == index
                                        ? Border.all(
                                            color: Colors.deepPurpleAccent,
                                            width: 2)
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      items[index],
                                      style: GoogleFonts.nunito(
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
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: () {
                      imagePickerOption();
                    },
                    icon: const Icon(Icons.add_a_photo_sharp),
                    label: const Text('UPLOAD IMAGE')),
              )
            ],
          )
        ]),
      ),
    );
  }
}
