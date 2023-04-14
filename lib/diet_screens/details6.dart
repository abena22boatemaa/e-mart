import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details6 extends StatelessWidget {
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
                child: Text("1.APPLE"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/app.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Fresh and crunchy apples are packed with healthy flavonoids and fibres"
                    " that may help burn belly fat. They are particularly rich in pectin fibre that "
                    "breaks down slowly. The fibres present in apple promote satiety. If you feel full,"
                    " you would naturally binge less. Apples are also very low in calories and sugar"
                    " content, "
                    "which makes it an ideal bet for weight loss. You can add it to your fruit salad"
                    "or eaten alone and enjoy the health benefit that comes with it. "),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.TOMATO"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/tomato.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("The tangy goodness of tomato may do wonders to cut your belly fat. "
                    "Tomatoes tend to stimulate the production of the amino acid called carnitine, "
                    "which is an organic molecule that is known to play a crucial role in regulation of "
                    "fatty acid and energy metabolism. Tomatoes are also enriched with compound known "
                    "as 9-oxo-ODA that helps decrease lipids in blood and ensure healthy weight loss. "
                    "Tomatoes also have high fibre content in them.Add tomato to your daily meal "
                    "or enjoy it blended. "),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.GUAVA"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/guava.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("The green crunchy fruit with white flesh is one of the most "
                    "loved winter fruits of all times. It is loaded with dietary fibres, "
                    "which helps keep you satiated and prevents bingeing. The glycaemic index or GI"
                    " value of guava is also very low, which enables slow release of sugar in the "
                    "bloodstream. "
                    "This promotes better insulin activity and weight management too. "),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.STRAWBERRY"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/strawberry.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Juicy and ever-so delightful strawberries are tremendously low in calories."
                      " A 100 grams serving of strawberries contain only 33 calories. You can tuck into "
                      "them raw,"
                      " blend them in smoothies or toss them up in salads as strawberries are immensely "
                      "versatile")
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("5.KIWI"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/kiwii.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("The tarty fruit is known to boost digestion naturally. Kiwi contains an "
                      "enzyme known as actinidain, which helps in digestion of proteins in the body. "
                      "A good digestion and sustainable weight loss goes hand in hand. Poor digestion "
                      "can hamper the breakdown of food particles, "
                      "which in turn could take a toll on metabolism and lead to weight gain."
                      "Include these foods in your diet and watch out for the impact on your waistline. "
                      "These nutritious"
                      " fruits are sure to help you reach your fitness goals and lose weight in a healthy way.  ")
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
                      "Best food to burn ",
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
                      "belly fat",
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
                              "Fruits are not only replete with vital antioxidants and minerals, "
                                  "but they could also help burn belly fat naturally and promote weight loss",
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