import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details3 extends StatelessWidget {
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
                        image: AssetImage("images/read/apple.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Apples are rich in fiber. In fact, one medium apple with the "
                    "skin on (about 200 grams) contains 4.8 grams of fiber, which is 19% of "
                    "the RDI.Although most of that fiber is insoluble, apples also contain "
                    "soluble fiber, which is mostly in the form of a dietary fiber called "
                    "pectin.In the gut, pectin is rapidly fermented by"
                    " bacteria to form short-chainfatty acids, which can pull water into the"
                    " colon, softening the stool and decreasing gut transit time."
                    ),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.PEAR"),
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
                child: Text("Pears are another fruit rich in fiber, with about 5.5 grams of "
                    "fiber in a medium-sized fruit (about 178 grams). That’s 22% of the RDI "
                    "for fiber (14Trusted Source).Alongside the fiber benefits, pears are "
                    "particularly high in fructose and sorbitol compared with other fruits "
                    "Fructose is a type of sugar that some people absorb poorly. This means"
                    " that some of it ends up in the colon, where it pulls in water by"
                    " osmosis, stimulating a bowel movement")
        ,
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.KIWI"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/kiwi2.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("One kiwi (about 75 grams) contains about 2.3 grams of fiber, "
                    "which is 9% of the RDI.In one study, 19 healthy adults consumed a "
                    "kiwi-derived supplement for 28 days. Researchers found doing so led to "
                    "significant increases in the number of daily bowel movements, compared "
                    "with a control group (18Trusted Source).Another study found that eating"
                    " two kiwis daily for 2 weeks was associated with more bowel movements and looser stools in 11 healthy adults (19Trusted Source)"
                   'Furthermore, a 2010 study gave 54 people with irritable bowel syndrome '
                    'two kiwis per day for 4 weeks. At the end of the study, participants'
                    'reported increased frequencies of bowel movements and faster colonic '
                    'transit times'
                ),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.CITRUS FRUITS"),
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
                child: Text("Citrus fruits like oranges, grapefruits, and mandarins are a "
                    "refreshing snack and good source of fiber.For example, one orange"
                    " (about 154 grams) contains 3.7 grams of fiber, which is 15% of the "
                    "RDI. Meanwhile, one grapefruit (about 308 grams) contains almost 5 "
                    "grams of fiber, meeting 20% of your daily needs.Citrus fruits are also "
                    "rich in the soluble fiber pectin, especially their peels. Pectin can"
                    " accelerate colonic transit time and reduce constipation In addition,"
                    'citrus fruits contain a flavanol called naringenin, which may contribute'
                    'to their positive effects on constipation. Animalstudies have shown that'
                    'naringenin increases fluid secretion into the colon, causing a laxative'
                    'effect.'
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
                      "Relieving yourself of  ",
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
                      "constipation",
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
                              "Symptoms include passing stools less than three times per week, straining, "
                                  "hard stools, a sensation of incomplete evacuation,or being unable to pass a stool.",
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
                  "images/read/9.png",
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