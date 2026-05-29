import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi/widgets/info_card.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _bmiPageState();
  }
}

class _bmiPageState extends State<BmiPage> {
  double? deviceHeight, deviceWidth;
  int age = 25, weight = 45, height = 150, gender = 0;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: deviceHeight! * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [ageTrackingWidget(), weightTrackingWidget()],
              ),
              heightTrackingWidget(),
              genderSelectContainer(),
              calculateButton(),
            ],
          ),
        ),
      ),
    );
  }

  InfoCard ageTrackingWidget() {
    return InfoCard(
      height: deviceHeight! * 0.2,
      width: deviceWidth! * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Age (year)",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          Text(
            age.toString(),
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    age--;
                  });
                },
              ),
              CupertinoButton(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    age++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  InfoCard weightTrackingWidget() {
    return InfoCard(
      height: deviceHeight! * 0.2,
      width: deviceWidth! * 0.45,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Weight (kg)",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          Text(
            weight.toString(),
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    weight--;
                  });
                },
              ),
              CupertinoButton(
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    weight++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  InfoCard heightTrackingWidget() {
    return InfoCard(
      height: deviceHeight! * 0.15,
      width: deviceWidth! * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Height (cm)",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          Text(
            height.toString(),
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            width: deviceWidth! * 0.8,
            child: CupertinoSlider(
              min: 30,
              max: 230,
              divisions: 230,
              value: height.toDouble(),
              onChanged: (_value) {
                setState(() {
                  height = _value.toInt();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget genderSelectContainer() {
    return InfoCard(
      height: deviceHeight! * 0.15,
      width: deviceWidth! * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Gender",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: deviceWidth! * 0.5,
            child: CupertinoSlidingSegmentedControl(
              groupValue: gender,
              children: {0: Text("Male"), 1: Text("Female")},
              onValueChanged: (_value) {
                setState(() {
                  gender = _value as int;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget calculateButton() {
    return CupertinoButton(
      child: Container(
        width: deviceWidth! * 0.8,
        height: deviceWidth! * 0.2,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
        ),
        child: Center(
          child: Text(
            "Calculate BMI",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
