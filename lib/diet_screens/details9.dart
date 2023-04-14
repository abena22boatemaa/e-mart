import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details9 extends StatelessWidget {
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
                child: Text("1.GINGER"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/ginger.jpeg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Many of the unpleasant allergy symptoms come from inflammatory"
                    " issues, like swelling and irritation in the nasal passages, eyes, and"
                    " throat. Ginger can help reduce these symptoms naturally.For thousands "
                    "of years, ginger has been used as a natural remedy for a number of "
                    "health problems, like nausea and joint pain. It’s also been proven to"
                    " contain antioxidative, anti-inflammatory phytochemical compounds. "
                    "Now, experts are exploring how these compounds may be useful for"
                    " combating seasonal allergies. In a 2016 animal study, ginger suppressed "
                    "the production of pro-inflammatory proteins in the blood of mice, which "
                    "led to reduced allergy symptoms.There doesn’t appear to be a difference "
                    "in the anti-inflammatory capacity of fresh ginger versus dried."
                    " Add either variety to stir fries, curries, baked goods, or try making"
                    " ginger tea."),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.CITRUS FRUITS"),
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
                child: Text("While it’s an old wives’ tale that vitamin C prevents the "
                    "common cold, it may help shorten the duration of a cold as well as "
                    "offer benefits for allergy sufferers. Eating foods high in vitamin C"
                    " has been shown to decrease allergic rhinitis, the irritation of the "
                    "upper respiratory tract caused by pollen from blooming plants.So "
                    "during allergy season, feel free to load up on high-vitamin C citrus "
                    "fruits like oranges, grapefruit, lemons, limes, sweet peppers, and"
                    " berries."),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("3.TOMATO"),
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
                child: Text("Though citrus tends to get all the glory when it comes to"
                    " vitamin C, tomatoes are another excellent source of this essential "
                    "nutrient. One medium-size tomato contains about 26 percent of your"
                    " recommended daily value of vitamin C.Additionally, tomatoes contain "
                    "lycopene, another antioxidant compound that helps quell systemic "
                    "inflammation. Lycopene is more easily absorbed in the body when it’s "
                    "cooked, so choose canned or cooked tomatoes for an extra boost."
                ),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.ONION"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/onion.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Onions are an excellent natural source of quercetin, a "
                    "bioflavonoid you may have seen sold on its own as a dietary "
                    "supplement.Some research suggests that quercetin acts as a natural "
                    "antihistamine, reducing the symptoms of seasonal allergies. Since"
                    " onions also contain a number of other anti-inflammatory and "
                    "antioxidant compounds, you can’t go wrong including them in your "
                    "diet during allergy season. (You just might want to freshen your "
                    "breath afterward.)Raw red onions have the highest concentration of"
                    " quercetin, followed by white onions and scallions. Cooking reduces"
                    " the quercetin content of onions, so for maximum impact, eat onions"
                    " raw. You might try them in salads or as"
                    " sandwich toppings. Onions are also prebiotic-rich foods which "
                    "nourish healthy gut bacteria and further support immunity and health"
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
                      "Alleviating seasonal",
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
                      "allergy",
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
                              "Seasonal allergies, also called hay fever or allergic rhinitis, "
                                  "only occur during certain parts of the year. Symptoms  include"
                                  " congestion, sneezing, and itching. ",
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
                  "images/read/2.png",
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