import 'package:flutter_app/consttants.dart';
import 'package:flutter/material.dart';

class Details5 extends StatelessWidget {
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
                child: Text("1.BEETROOT"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/beet.png"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("The vibrantly colored root and greens of the beetroot plant "
                    "contain compounds that optimize lung function.Beetroot and beet greens"
                    " are rich in nitrates, which have been shown to benefit lung function. "
                    "Nitrates help relax blood vessels, reduce blood pressure, and optimize"
                    " oxygen uptake (3Trusted Source).Beetroot supplements have been shown "
                    "to improve physical performance and lung function in people with lung"
                    " conditions, including COPD and pulmonary hypertension, a disease that"
                    " causes high blood pressure in the lungs.Additionally, beet greens are"
                    " packed with magnesium, potassium, vitamin C, and carotenoid "
                    "antioxidants — all of which are essential to lung health "),
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("2.PEPPER"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/pepper.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Peppers are amongst the richest sources of vitamin C, a water-"
                    "soluble nutrient that acts as a powerful antioxidant in your body. "
                    "Getting enough vitamin C is especially important for those who smoke.In"
                    " fact, due to the damaging effects of cigarette smoke on your body’s "
                    "antioxidant stores, it’s recommended that people who smoke consume an "
                    "extra 35 mg of vitamin C per day (7Trusted Source).However, many studies"
                    " show that smokers may benefit from higher doses of vitamin C and that"
                    " smokers with high vitamin C intake have better lung function than "
                    "those with lower vitamin C intake (8Trusted Source)."),
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
                child: Text("Tomatoes and tomato products are among the richest dietary "
                    "sources of lycopene, a carotenoid antioxidant that has been associated "
                    "with improved lung health.Consuming tomato products has been shown to"
                    " reduce airway inflammation in people with asthma and improve lung "
                    "function in people with COPD.A 2019 study in 105 people with asthma "
                    "demonstrated that a diet rich in tomatoes was associated with a lower"
                    " prevalence of poorly controlled asthma. Plus, tomato intake is also "
                    "associated with a slower decline in lung function in ex-smokers"),
              ),),

            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("4.COCOA"),
              ),
            ),
            Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,0),
                      child: Image(
                        image: AssetImage("images/read/cocoa.jpg"),
                      ),
                    ),
                  ],
                )
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Cocoa and cacao products like dark chocolate are high in "
                      "flavonoid antioxidants and contain a compound called theobromine, "
                      "which helps relax the airways in the lungs (56Trusted Source).Cocoa"
                      " intake has been associated with a lower risk of allergic respiratory"
                      " symptoms and may help protect against lung cancer.Additionally, "
                      "a study that included 55,000 people found that those with higher"
                      " flavonoid consumption from foods, including chocolate products, "
                      "had better lung function than people who had diets low in flavonoids."
                      )
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
                      "Best foods for ",
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
                      "lung health",
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
                              "Keeping your lungs healthy is essential to feeling your best. Yet, common factors,"
                                  " including exposure to cigarette"
                                  " can take a toll on this pair of important organs.",
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
                  "images/read/5.png",
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