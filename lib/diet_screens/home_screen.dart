import 'package:flutter_app/consttants.dart';
import 'package:flutter_app/diet_screens/details_screen.dart';
import 'package:flutter_app/diet_screens/details2.dart';
import 'package:flutter_app/diet_screens/details3.dart';
import 'package:flutter_app/diet_screens/details9.dart';
import 'package:flutter_app/diet_screens/details4.dart';
import 'package:flutter_app/diet_screens/details5.dart';
import 'package:flutter_app/diet_screens/details6.dart';
import 'package:flutter_app/diet_screens/details7.dart';
import 'package:flutter_app/diet_screens/details10.dart';
import 'package:flutter_app/diet_screens/details8.dart';
import 'package:flutter_app/widgets/reading_card_list.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/read/main_page_bg.png"),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: size.height * .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(text: "What are you \neating "),
                          TextSpan(
                              text: "today?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ReadingListCard(
                          image: "images/read/3.png",
                          title: "Getting rid of",
                          auth: "headache/migraine",
                          //rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreen();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/9.png",
                          title: "Relieving yourself of ",
                          auth: "constipation",
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details3();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/4.png",
                          title: "Best fruits for a ",
                          auth: "diabetic patient",
                          //rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details2();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/10.png",
                          title: "Lowering your ",
                          auth: "blood sugar",
                          // rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details4();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/8.png",
                          title: "Burning belly fat",
                          auth: "with fruits and veggies",
                          //rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details6();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/5.png",
                          title: "Best foods for",
                          auth: "lung health",
                          //rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details5();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/1.png",
                          title: "Foods that beat ",
                          auth: "fatigue",
                          // rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details7();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/7.png",
                          title: "What to eat during ",
                          auth: "menstrual period",
                          //rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details8();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/2.png",
                          title: "Alleviating seasonal allergy",
                          auth: "symptoms",
                          //rating: 4.8,
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details9();
                                },
                              ),
                            );
                          },
                        ),
                        ReadingListCard(
                          image: "images/read/8.png",
                          title: "Fruits to eat during",
                          auth: "and after cancer treatment",
                          pressRead: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Details10();
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline4,
                            children: [
                              TextSpan(text: "live a healthy "),
                              TextSpan(
                                text: "life",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        //add image here
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.headline4,
                            children: [
                              TextSpan(text: "Fruits safety "),
                              TextSpan(
                                text: "Tips",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(38.5),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 33,
                                color: Color(0xFFD3D3D3).withOpacity(.84),
                              ),
                            ],
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(38.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                                    child: Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            " If possible, purchase organic fruit that"
                                            " hasn’t been treated with synthetic pesticides and fertilizers."
                                            "But keep in mind that eating nonorganic fruit is much better than eating no fruit at all."
                                            "To lessen your risk of consuming pesticide residue or bacteria, follow these tips:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          ListTile(
                                              title: Text(
                                            "•	Wash fruit thoroughly, even if it’s prewashed",
                                            style: TextStyle(
                                              color: kLightBlackColor,
                                            ),
                                          )),
                                          ListTile(
                                              title: Text(
                                            "•	Remove any bruised areas where bacteria may lurk.",
                                            style: TextStyle(
                                              color: kLightBlackColor,
                                            ),
                                          )),
                                          ListTile(
                                              title: Text(
                                            "•	Drink only pasteurized or boiled fruit juice.",
                                            style: TextStyle(
                                              color: kLightBlackColor,
                                            ),
                                          )),
                                          //ListTile(
                                             // title: Text(
                                           // "•	Avoid eating precut melons, or eat them immediately after cutting.",
                                            //style: TextStyle(
                                             // color: kLightBlackColor,
                                            //),
                                          //)),
                                          ListTile(
                                              title: Text(
                                            "•	Store fresh fruit in the refrigerator, away from raw meat.",
                                            style: TextStyle(
                                              color: kLightBlackColor,
                                            ),
                                          )),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 9,
                                    width: size.width * .65,
                                    decoration: BoxDecoration(
                                      color: kProgressIndicator,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 43),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
