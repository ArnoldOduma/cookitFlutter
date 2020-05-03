import 'package:carousel_slider/carousel_slider.dart';
import 'package:cookit/screens/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_widget/carousel_widget.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

List<String> titles = List();
List<String> description = List();
List<String> imagenames = List();

void initializeData() {
  titles.add("Title of First Screen");
  description.add("Description of First Screen");
  imagenames.add("assets/images/chicken_liver.jpg");

  titles.add("Title of Second Screen");
  description.add("Description of Second Screen");
  imagenames.add("assets/images/chicken_liver.jpg");

  titles.add("Title of Third Screen");
  description.add("Description of Third Screen");
  imagenames.add("assets/images/chicken_liver.jpg");
}

class HomeState extends State {
  PageController controller = PageController();
  CarouselSlider carouselSlider;
  var currentPageValue = 0.0;
  int _current = 0;
  List imgList = [
    "assets/images/chicken_liver.jpg",
    "assets/images/chicken_liver.jpg",
    "assets/images/chicken_liver.jpg",
    "assets/images/chicken_liver.jpg"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    initializeData();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: new AppBar(
              title: new Text(
                "Cook It",
                style: TextStyle(color: Colors.green),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.green,
                  onPressed: () {
//                  showSearch(context: context, delegate: DataSearch(listWords));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  color: Colors.green,
                  onPressed: () {
//                  showSearch(context: context, delegate: DataSearch(listWords));
                  },
                )
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Stack(children: [
              Container(
                child: carouselSlider = CarouselSlider(
                  height: 400.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.green,
                            ),
                            child: new Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image.asset(
                                    imgUrl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              Align(
//                alignment: Alignme,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.green, // button color
                        child: InkWell(
                          splashColor: Colors.orange, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child:
                                  Icon(Icons.arrow_back, color: Colors.white)),
                          onTap: goToPrevious,
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.green, // button color
                        child: InkWell(
                          splashColor: Colors.orange, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(Icons.arrow_forward,
                                  color: Colors.white)),
                          onTap: goToNext,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            bottomNavigationBar: CustomAppBar(),
          )
        ],
      ),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
//body: PageView.builder(
//controller: controller,
//itemBuilder: (BuildContext context, int index) {
//if (index == currentPageValue.floor()) {
//return Transform(
//alignment: Alignment.center,
//transform:Matrix4.identity()..rotateY(currentPageValue)..rotateZ(currentPageValue),
//child: Container(
//color: index % 2 == 0 ? Colors.blue : Colors.pink,
//child: Center(
//child: Text(
//"Page 1",
//style: TextStyle(color: Colors.white, fontSize: 22.0),
//),
//),
//),
//);
//} else if (index == currentPageValue.floor() + 1) {
//return Transform(
//alignment: Alignment.center,
//transform:Matrix4.identity()..rotateY(currentPageValue)..rotateZ(currentPageValue ),
//child: Container(
//color: index % 2 == 0 ? Colors.blue : Colors.pink,
//child: Center(
//child: Text(
//"Page 2",
//style: TextStyle(color: Colors.white, fontSize: 22.0),
//),
//),
//),
//);
//} else {
//return Container(
//color: index % 2 == 0 ? Colors.blue : Colors.pink,
//child: Center(
//child: Text(
//"Page 3",
//style: TextStyle(color: Colors.white, fontSize: 22.0),
//),
//),
//);
//}
//},
//itemCount: 10,
//),
