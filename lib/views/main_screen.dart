
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


import 'fake_news.dart';
import 'homepage.dart';
import 'profilepage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({ this.pageIndex});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  int pageIndex;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Widget> _pages = [
    HomePage(),
    FakeNews(),
    ProfilePage(),
  ];
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          _pages.elementAt(widget.pageIndex),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: BottomNavigationBar(
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: true,
                  backgroundColor: Colors.black,
                  currentIndex: widget.pageIndex,
                  elevation: 10,
                  onTap: ((int index) {
                    setState(() {
                      widget.pageIndex = index;
                    });
                  }),
                  unselectedLabelStyle: TextStyle(
                      fontFamily:
                          GoogleFonts.nunito(fontSize: 10.sp).fontFamily),
                  selectedLabelStyle: TextStyle(
                      fontFamily:
                          GoogleFonts.nunito(fontSize: 10.sp).fontFamily),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.houseSignal,
                          size: 20.h,
                        ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.newspaper,
                          size: 20.h,
                        ),
                        label: "Fake News"),
                    BottomNavigationBarItem(
                        icon: Icon(
                          FontAwesomeIcons.personMilitaryRifle,
                          size: 20.h,
                        ),
                        label: "Profile")
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
