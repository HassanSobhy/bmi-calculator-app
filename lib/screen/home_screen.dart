import 'dart:math';

import 'package:bmi_calc_app/providers/bmi_provider.dart';
import 'package:bmi_calc_app/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'bmi_result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0F1D),
      appBar: buildAppBar(),
      body: Consumer<BmiProvider>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    builtGenderCard(
                        text: "Male",
                        imagePath: "assets/images/male.png",
                        isMale: value.isMale,
                        onTap: () {
                          value.isMale = true;
                        }),
                    SizedBox(width: 16),
                    builtGenderCard(
                        text: "Female",
                        imagePath: "assets/images/female.png",
                        isMale: !value.isMale,
                        onTap: () {
                          value.isMale = false;
                        }),
                  ],
                ),
              ),
            ),
            buildSliderRow(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF1A1B2C)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "${value.weight}",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                builtFloatingActionButton(
                                  onPressed: value.decrementWeight,
                                  heroTag: 'weight-',
                                  iconData: Icons.remove,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                builtFloatingActionButton(
                                  onPressed: value.incrementWeight,
                                  heroTag: 'weight+',
                                  iconData: Icons.add,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFF1A1B2C)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Text(
                              "${value.age}",
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                builtFloatingActionButton(
                                  onPressed: value.decrementAge,
                                  heroTag: "age-",
                                  iconData: Icons.remove,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                builtFloatingActionButton(
                                  onPressed: value.incrementAge,
                                  heroTag: "age+",
                                  iconData: Icons.add,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            buildCalculateButton()
          ],
        );
      }),
    );
  }

///////////HelperMethod//////////////
  double calcBmi() {
    double height = context.read<BmiProvider>().height;
    return (context.read<BmiProvider>().weight * 10000) / (height * height);
  }

  void navToBmiResultScreen() async {
    double res = calcBmi();

    bool isMale = context.read<BmiProvider>().isMale;
    int age = context.read<BmiProvider>().age;

    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            BmiResultScreen(isMale, res,age)));
  }

///////////HelperWidget//////////////
  Widget buildSliderRow() {
    return Consumer<BmiProvider>(builder: (context, value, child) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF1A1B2C)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${value.height.round()}",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Slider(
                  min: 80.0,
                  max: 220,
                  value: value.height,
                  onChanged: (val) {
                    value.height = val;
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildCalculateButton() {
    return Container(
      width: double.infinity,
      color: Colors.pink,
      child: MaterialButton(
        onPressed: () {
          navToBmiResultScreen();
        },
        child: Text(
          "CALCULATE",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF0A0F1D),
      title: Text(
        "BMI CALCULATOR",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }
}
