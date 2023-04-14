import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details2 extends StatelessWidget {
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
                        image: AssetImage("images/read/apple.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("An apple a day really might keep the doctor away. Toss one in your purse or bag if you're on the go; a medium-size apple is a great "
                    "fruit choice, with just 95 calories and 25 g of carbohydrate, Apples are also loaded with fiber"
                    " (about 4 g per medium fruit, for 16 percent of your DV) "
                    "and offer some vitamin C, with one medium size apple providing 8.73 mg or about 9 percent of the DV. Don't peel your apples, though — the skins are nutritious, with extra"
                    " fiber and heart-protective antioxidants, according to the Harvard T.H. Chan School of Public Health."),
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
                child: Text("Eat one orange and you'll get 78 percent of the vitamin C you need in a day"
                    " (there are about 70 mg of Vitamin C in one medium fruit). This refreshing choice comes"
                    " in at only"
                    " 15 g of carbohydrates and 62 calories, per the USDA. One medium orange also contains "
                    "folate (40 mcg or 10 percent of the DV) "
                    "and potassium (237 mg or 5 percent of the DV), which may help normalize blood pressure."
                    " And while you're enjoying this juicy treat,"
                    " don't forget that other citrus fruits, like grapefruit, are also great choices."),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.PEAR"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/pear.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Because pears are an excellent source of fiber (one medium fruit has nearly 5.5 g or 20 percent of the DV, per the USDA), "
                    "they make a wise addition to your diabetes meal plan. Plus, unlike most fruit, they"
                    " actually improve in texture and flavor after they're picked. Store your pears at "
                    "room temperature until they're ripe and perfect for eating (they can then be stowed "
                    "in the refrigerator), Here's a tasty treat: Slice up a pear "
                    "and eat it with home cooked meal like yam and stew or with rice and enjoy plus all "
                    "its health benefits "
                ),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.KIWI"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/kiwi.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("If you've never tried a kiwi, you may not know that its fuzzy brown peel hides a zesty bright green fruit."
                    " According to the USDA, one delicious, powerhouse kiwi has 215 mg of potassium "
                    "(5 percent of the DV), 64 mg of vitamin C (71 percent of the DV) and 2 g of fiber "
                    "(8 percent of the DV). One kiwi also has about 42 calories and 10 g of carbohydrates"
                    "so it's a smart addition to your diabetes-friendly diet. Kiwis are available"
                    " year-round and will last in the refrigerator for up to seven days, so make kiwi a part"
                    "of diet"
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
                      "Best foods for  ",
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
                      "Diabetes",
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
                              "When you're looking for a diabetes treat that can help keep "
                                  "your blood sugar within a healthy range, look no further than the"
                                  " fruit basket on your kitchen table.",
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
                  "images/read/4.png",
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