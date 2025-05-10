import 'package:bmi_plus_app/colors/colors.dart';
import 'package:bmi_plus_app/pages/result.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  final bool isMale;
  const ControlPage({super.key, required this.isMale});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int height = 120;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    Color mainColor = widget.isMale ? blue : red;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,

                child: Container(
                  decoration: BoxDecoration(color: white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: mainColor,
                              ),
                            ),
                            Text(
                              "BMI",
                              style: TextStyle(
                                fontSize: 28,
                                color: mainColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.isMale ? "Male" : "Female",
                              style: TextStyle(
                                color: black,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              widget.isMale ? Icons.male : Icons.female,
                              size: 100,
                              color: mainColor,
                            ),
                            Text(
                              "Weight (KG)",
                              style: TextStyle(
                                color: black,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemCount: 40,
                          itemBuilder: (context, index) {
                            int i = (index + 5) * 5;
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight = i;
                                  });
                                },
                                child: Center(
                                  child: (Text(
                                    "$i",
                                    style: TextStyle(
                                      color: weight == i ? mainColor : black,
                                      fontSize: weight == i ? 48 : 28,
                                    ),
                                  )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,

                child: Container(
                  decoration: BoxDecoration(color: mainColor),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 28),
                              Text(
                                "Height \n (CM)",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            int i = (index + 25) * 5;
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    height = i;
                                  });
                                },

                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: height == i ? white : mainColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: (Text(
                                      "$i",
                                      style: TextStyle(
                                        color: height == i ? mainColor : white,
                                        fontSize: 28,
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 5,
            right: 100,
            child: MaterialButton(
              color: yellow,

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        height: height,
                        weight: weight,
                        isMale: widget.isMale,
                      );
                    },
                  ),
                );
              },
              child: Row(children: [
                Text("CALC", style: TextStyle(color: white, fontSize: 24)),
                Icon(Icons.arrow_forward_ios , color:white , size:18) ,
              ],)
            ),
          ),
        ],
      ),
    );
  }
}
