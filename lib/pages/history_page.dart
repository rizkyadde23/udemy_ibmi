import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryPage extends StatelessWidget {
  double? deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(child: Center(child: dataCard()));
  }

  Widget dataCard() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (BuildContext _context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data as SharedPreferences;
          final date = prefs.getString("bmi_date");
          final data = prefs.getStringList("bmi_data");
          return InfoCard(
            height: deviceHeight! * 0.2,
            width: deviceWidth! * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                statusText(data![1]),
                dateText(date!),
                bmiText(data[0]),
              ],
            ),
          );
        } else {
          return CupertinoActivityIndicator(color: Colors.blue);
        }
      },
    );
  }

  Widget statusText(String status) {
    return Text(
      status,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
    );
  }

  Widget dateText(String date) {
    DateTime parseDate = DateTime.parse(date);
    return Text(
      "${parseDate.day} / ${parseDate.month} / ${parseDate.year}",
      style: TextStyle(fontSize: 20),
    );
  }

  Widget bmiText(String bmi) {
    String parsedBmi = double.parse(bmi).toStringAsFixed(2);
    return Text(
      parsedBmi,
      style: TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
    );
  }
}
