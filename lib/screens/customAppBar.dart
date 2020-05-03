import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];
  final bottomNavigationBarItemStyle = TextStyle(fontStyle: FontStyle.normal, color: Colors.black);
  CustomAppBar() {
    bottomBarItems.add(
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF78AA39),),
            title: Text("Home", style: bottomNavigationBarItemStyle,)
        )
    );
    bottomBarItems.add(
        BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Color(0xFF78AA39),),
            title: Text("Categories", style: bottomNavigationBarItemStyle,)
        )
    );
    bottomBarItems.add(
        BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Color(0xFF78AA39),),
            title: Text("Favorites", style: bottomNavigationBarItemStyle,)
        )
    );
    bottomBarItems.add(
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF78AA39),),
            title: Text("Profile", style: bottomNavigationBarItemStyle,)
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
        items: bottomBarItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}