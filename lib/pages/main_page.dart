import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/pages/bmi_page.dart';
import 'package:ibmi/pages/history_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _mainPageState();
  }
}

class _mainPageState extends State<MainPage> {
  List<Widget> tabs = [BmiPage(), HistoryPage()];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.blueGrey,
      navigationBar: CupertinoNavigationBar(middle: Text("IBMI")),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "BMI",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "History",
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return tabs[index];
        },
      ),
    );
  }
}
