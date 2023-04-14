import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: size.height * .12, left: size.width * .1, right: size.width * .02),
                      height: size.height * .48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/read/bg.png"),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: BookInfo(size: size,)
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("1.BROCCOLI"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/broccoli.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Sulforaphane is a type of isothiocyanate that has blood-sugar-"
                    "reducing properties.This plant chemical is produced when broccoli is "
                    "chopped or chewed due to a reaction between a glucosinolate compound "
                    "called glucoraphanin and the enzyme myrosinase, both of which are "
                    "concentrated in broccoli.Broccoli sprouts are concentrated sources of glucosinolates "
                    "like glucoraphanin,and they’ve been shown to help promote insulin sensitivity and "
                    "reduce blood sugar levels in people with type 2 diabetes when supplemented as a powder "
                    "or extract."),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.OKRO"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/okro.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Okra is a fruit that’s commonly utilized like a vegetable. It’s"
                    " a rich source of blood-sugar-lowering compounds like polysaccharides"
                    " and flavonoid antioxidants (23Trusted Source).In Turkey, okra seeds "
                    "have long been used as a natural remedy to treat diabetes due to their"
                    " potent blood-sugar-lowering properties (24Trusted Source).Rhamnogalacturonan, "
                    "the main polysaccharide in okra, has been identified as a powerful antidiabetic"
                    " compound. Plus, okra contains the flavonoids isoquercitrin and quercetin "
                    "3-O-gentiobioside, which help reduce blood sugar by inhibiting certain enzymes"),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.CITRUS FRUITS"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/citrus.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Although many citrus fruits are sweet, research shows that they"
                    " may help reduce blood sugar levels. Citrus fruits are considered low "
                    "glycemic fruits because they don’t affect blood sugar as much as other"
                    " types of fruits like watermelon and pineapple. Citrus fruits like "
                    "oranges and grapefruit are packed with fiber and contain plant compounds"
                    " like naringenin, a polyphenol that has powerful antidiabetic "
                    "properties (51Trusted Source).Eating whole citrus fruits may help"
                    " improve insulin sensitivity, reduce HbA1c, and protect against the "
                    "development of diabetes"
                ),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.APPLE"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/apple.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Apples contain soluble fiber and plant compounds, including "
                    "quercetin, chlorogenic acid, and gallic acid, all of which may help "
                    "reduce blood sugar and protect against diabetes (59Trusted Source).Although total "
                    "fruit consumption has been shown to decrease diabetes risk, eating specific fruits, "
                    "including apples, may be particularly beneficial for lowering blood sugar and reducing"
                    " the risk of developing diabetes (60Trusted Source).A study that included data from "
                    "over 187,000 people found that a higher intake of specific fruits, particularly"
                    " grapes, and apples, was associated with a significantly lower risk of type 2 diabetes"
                    "Furthermore, a study in 18 women found that eating apples 30 minutes"
                    " before a rice meal significantly reduced post-meal blood sugar, "
                    "compared with eating rice alone")
                ),
              ),
            ],
        ),
      ),

    );

  }
}

class BookInfo extends StatelessWidget {

  const BookInfo({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Lowering your  ",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 26
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: this.size.height * .005),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "blood sugar",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: this.size.width * .3,
                            padding: EdgeInsets.only(top: this.size.height * .02),
                            child: Text(
                                  "Although factors like body weight,activity, stress"
                                  ", and genetics also play a role in blood sugar maintenance"
                                  ", following a healthy diet is critical for blood sugar"
                                  " control",
                              maxLines: 9,
                              style: TextStyle(
                                fontSize: 10,
                                color: kLightBlackColor,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: this.size.height * .015),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Image.asset(
                  "images/read/10.png",
                  height: double.infinity,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              )),
        ],
      ),
    );
  }
}