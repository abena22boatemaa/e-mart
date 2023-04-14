import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details10 extends StatelessWidget {
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
                child: Text("1.BANANA"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/banana.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Bananas can be a great dietary addition for those recovering "
                    "from cancer.They’re not only easy to tolerate for those with "
                    "swallowing difficulties but also a good source of many important "
                    "nutrients, including vitamin B6, manganese, and vitamin C "
                    "Additionally, bananas contain a type of fiber called pectin, which "
                    "can be especially beneficial for those experiencing diarrhea caused"
                    " by cancer treatments Because bananas are rich in potassium, they can"
                    " also help replenish electrolytes lost through diarrhea or vomiting.Furthermore, "
                    "test-tube studies have observed that pectin may help protect against the growth "
                    "and development of colon cancer cells "),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.ORANGE"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/orange.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Oranges are a common type of citrus fruit, favored for their"
                    " sweet taste, vibrant color, and stellar nutrient profile.Just one "
                    "medium orange can meet and exceed your daily needs for vitamin C,"
                    " all while supplying other important nutrients like thiamine, folate,"
                    " and potassium. Vitamin C plays a key role in immunity and can help "
                    "strengthen your immune system during and after cancer treatment"
                    "Research suggests that vitamin C may reduce the growth and spread of"
                    " cancer cells and act as a therapeutic against certain types of "
                    "cancer.Vitamin C from oranges can also boost the absorption of iron "
                    "from foods. This helps protect against anemia, a common side "
                    "effect of chemotherapy"),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.APPLE"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/napple.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Apples are not only one of the most popular fruits but also"
                    " one of the most nutritious.Each serving is rich in fiber, potassium, "
                    "and vitamin C — all of which can benefit cancer recovery"
                    "The fiber found in apples can promote regularity and keep things"
                    " moving through your digestive tract.Potassium affects your fluid"
                    " balance and can help prevent fluid retention, a common side effect"
                    " of some types of chemotherapy. Lastly, vitamin C acts as an "
                    "antioxidant to support immune function and fight cancer cell growth"
                    "Apples are high in fiber, potassium, and vitamin C. Hence, they can"
                    " help promote regularity, reduce fluid retention, and support immune"
                    " health."),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.LEMON"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/lemon.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Known for their sour taste and signature citrus scent, lemons"
                    " deliver a burst of vitamins, minerals, and antioxidants in every "
                    "serving.They’re especially high in vitamin C, but also contain some"
                    " potassium, iron, and vitamin B6. Test-tube studies have found that"
                    " lemon extract may help prevent the growth of several types of "
                    "cancer cells.Some studies also show that certain compounds in"
                    " lemons, including limonene, could boost your mood and fight stress"
                    " to combat depression and anxiety. Therefore,enjoying lemons in your favorite"
                    " drinks and desserts as part of a healthy diet could be beneficial."),
              ),),

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
                      "Foods that help",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: 27
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: this.size.height * .005),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "with cancer",
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
                              "It’s no secret that your diet can affect your risk of "
                                  "developing cancer.Similarly, filling up on healthy foods"
                                  " is important if you are being treated for or recovering"
                                  " from cancer.",
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
                  "images/read/8.png",
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