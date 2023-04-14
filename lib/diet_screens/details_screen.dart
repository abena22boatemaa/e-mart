import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
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
                child: Text("1.WATERMELON"),
              ),
            ),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30,0,30,0),
                child: Image(
                image: AssetImage("images/read/watermelon.png"),
            ),
              ),
           ],
              )
            ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Interesting fact: Watermelon is actually considered a "
                "vegetable because of the way it’s grown, although some people "
                "would argue it belongs firmly in the fruit category because of its "
                "sweet flavor and higher sugar content."
                "Watermelon also has a lot of water in it."
                 "It’s actually 92 percent water, according to the National"
                "Watermelon Promotion Board."),
          ),
        ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.BANANA"),
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
                child: Text("Looking for something quick and easy that could"
                    " help stave off a migraine attack or an episode of hypoglycemia,"
                    " which could lead to a headache? Reach for a banana rather than "
                    "highly processed foods like granola bars or candy."
                "Bananas are a great food for quick energy recovery, and they’re "
                   "high in magnesium, which can be helpful when people have headaches"),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.MUSHROOM"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/mushroom.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Sometimes people develop headaches because they have either "
                    "absorption issues in their lower intestine or leaky gut, also known as increased "
                    "intestinal permeability "
                    'Adding foods that are high in riboflavin (also known as B2) such'
                 ' as mushrooms and eggs help with that'
                    'There is research to suggest that riboflavin may help in preventing migraines. '
              ),
            ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.Broccoli"),
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
                child: Text("Changes in hormone levels can lead to headaches, especially "
                    "for women with menstrual migraine or headaches. "
                    "Falling levels of estrogen, which occur just before menstruation begins, can trigger an attack, "
                    "according to the Migraine Research Foundation."
                    'Women who have this type of migraine would benefit from increasing'
                    'their intake of cruciferous vegetables, because of their effects on '
                    'estrogen.'
            ),
            ),
            ),],
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
                    "Getting rid of",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      fontSize: 28
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: this.size.height * .005),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    "Migraine",
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
                            "Eating a variety of healthy foods and staying hydrated"
                                " can go a long way toward preventing or relieving migraine."
                                "Being open to change in your diet is a good start",
                            maxLines: 8,
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
                "images/read/3.png",
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