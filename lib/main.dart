import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liquid_navbar/indexProvider.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => IndexProvider()),
        ],
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      builder: DevicePreview.appBuilder,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     centerTitle: true,
      //     shadowColor: Colors.black38,
      //     title: Text("Coding_.Gyan"),
      //   ),
      body: Consumer(
        builder: (BuildContext context, IndexProvider provider, Widget child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: w,
                height: h,
                child: Column(
                  children: [
                    Container(
                      width: w,
                      height: h - 82 - 18,
                      child: IndexedStack(
                        children: [
                          Center(
                              child: Image.asset("images/1.jpg",
                                  filterQuality: FilterQuality.high,
                                  height: h - 100,
                                  fit: BoxFit.fitHeight)),
                          Center(
                              child: Image.asset(
                            "images/2.jpg",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight,
                            height: h - 100,
                          )),
                          Center(
                              child: Image.asset(
                            "images/5.gif",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitWidth,
                            width: w,
                            height: h - 100,
                          )),
                          Center(
                              child: Image.asset("images/3.jpg",
                                  filterQuality: FilterQuality.high,
                                  height: h - 100,
                                  fit: BoxFit.fitHeight)),
                          Center(
                              child: Image.asset(
                            "images/4.jpg",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight,
                            height: h - 100,
                          )),
                        ],
                        index: provider.pos,
                      ),
                    ),
                    NavBar(w: w),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  final double w;

  const NavBar({Key key, this.w}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Nav4ItemClass> items4 = List<Nav4ItemClass>();

  @override
  void initState() {
    super.initState();

    items4.add(Nav4ItemClass(
        true,
        Icon(
          Icons.supervised_user_circle,
          color: Colors.greenAccent,
        ),
        Icon(
          Icons.supervised_user_circle,
          color: Colors.white,
        ),
        'Profile',
        0));
    items4.add(Nav4ItemClass(
        false,
        Icon(
          Icons.lightbulb_outline,
          color: Colors.greenAccent,
        ),
        Icon(
          Icons.lightbulb_outline,
          color: Colors.white,
        ),
        'Mode',
        1));
    items4.add(Nav4ItemClass(
        false,
        Icon(
          Icons.explore,
          color: Colors.greenAccent,
        ),
        Icon(Icons.explore, color: Colors.white),
        'Explore',
        2));
    items4.add(Nav4ItemClass(
        false,
        Icon(
          Icons.whatshot,
          color: Colors.greenAccent,
        ),
        Icon(Icons.whatshot, color: Colors.white),
        'Like',
        3));
    items4.add(Nav4ItemClass(
        false,
        Icon(
          Icons.laptop_chromebook,
          color: Colors.greenAccent,
        ),
        Icon(Icons.laptop_chromebook, color: Colors.white),
        'View',
        4));
  }

  @override
  Widget build(BuildContext context) {
    int pos = Provider.of<IndexProvider>(context, listen: false).pos;
    return Container(
      width: widget.w,
      height: 80,
      //   padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0.0, 8.0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOutCubic,
            top: 5,
            bottom: 5,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 900),
            curve: Curves.easeInOutSine,
            top: 25,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOutCirc,
            top: -40,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.easeInOutCubic,
            top: 5,
            bottom: 20,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.easeInOutCubic,
            top: 20,
            bottom: 5,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.linearToEaseOut,
            top: 10,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1200),
            curve: Curves.linearToEaseOut,
            top: -10,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w - 40) / 5),
              height: ((widget.w - 40) / 5),
              child: Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceOut,
            top: 0,
            left: ((widget.w - 20) / 5) * pos,
            child: Container(
              width: ((widget.w) / 5),
              height: ((widget.w) / 5),
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: ((widget.w - 40) / 5),
                  height: ((widget.w - 40) / 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff13E147),
                        Color(0xff2C86E0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(72),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: items4.map((i) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    items4.forEach((item) => item.isOpen = false);
                    i.isOpen = !i.isOpen;
                    Provider.of<IndexProvider>(context, listen: false)
                        .setPostion(i.pos);
                  });
                },
                child: Nav4Item(
                  w: widget.w,
                  item: i,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Nav4ItemClass {
  bool isOpen;
  Icon icon;
  Icon iconWithColor;
  String title;
  int pos;

  Nav4ItemClass(
      this.isOpen, this.icon, this.iconWithColor, this.title, this.pos);
}

class Nav4Item extends StatelessWidget {
  final double w;
  final Nav4ItemClass item;

  const Nav4Item({Key key, this.w, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (w - 20) / 5,
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: item.isOpen ? 35 : 24,
              height: item.isOpen ? 30 : 24,
              child: item.isOpen ? item.iconWithColor : item.icon),
          item.isOpen
              ? Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    //height: 1.8,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
