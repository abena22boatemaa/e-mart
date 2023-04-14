import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Elements/singleProduct.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/models/usermodel.dart';
import 'package:flutter_app/pages/account.dart';
import 'package:flutter_app/pages/admin/adminLandingPage.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/dashboard.dart';
import 'package:flutter_app/pages/about.dart';
import 'package:flutter_app/pages/product_details.dart';
import 'package:flutter_app/diet_screens/home_screen.dart';
import 'package:flutter_app/providers/productProvider.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/pages/authentication/login.dart';
import 'package:flutter_app/utils/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool admin = false;
  final AuthService _auth = AuthService();
  String userUid;
  UserModel user;

  void getUserUid() {
    User myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser.uid;
    GlobalData.userUid = userUid;
    print(userUid);
  }

  List<String> carouselImages = [
    'images/carousel/CS1.jpg',
    'images/carousel/CS2.png',
    'images/carousel/CS3.png',
    'images/carousel/CS4.jpg',
    'images/carousel/CS5.jpg',
    'images/carousel/CS6.jpg',
    'images/carousel/CS7.jpg',
    'images/carousel/CS8.jpg',
    'images/carousel/CS9.jpg',
    'images/carousel/CS10.jpg',
    'images/carousel/CS11.jpg',
    'images/carousel/CS12.jpg',
    'images/carousel/CS13.jpg',
    'images/carousel/CS14.jpg'
  ];
  @override
  void initState() {
    getUserUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff5663ff),
        title: Text('E-Market'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartPage()));
              })
        ],
      ),

// Drawer_Header
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(userUid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var output = snapshot.data.data();
                    print(output);
                    user = UserModel.fromMap(output);
                    if (user.userType == "admin") {
                      admin = true;
                    }
                    GlobalData.userData = user;

                    GlobalData.noOfOrders = user.noOfOrders;
                    print(user);
                    return UserAccountsDrawerHeader(
                        accountName: Text(
                          user.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        accountEmail: Text(
                          user.email,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        currentAccountPicture: GestureDetector(
                            child: // user.profileImage == null
                                CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        )),
                        decoration: new BoxDecoration(
                          color: Color(0xff5663ff),
                        ));
                  }
                  return CircularProgressIndicator();
                }),

            // Drawer_Body
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: ListTile(
                title: Text(
                  'Home Page',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountScreen()));
              },
              child: ListTile(
                title: Text(
                  'My Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartPage()));
              },
              child: ListTile(
                title: Text(
                  'Shopping cart',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                leading: Icon(
                  Icons.add_shopping_cart,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new About()));
              },
              child: ListTile(
                title: Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                leading: Icon(Icons.help),
              ),
            ),

            InkWell(
              onTap: () async {
                //pop box yes or no

                await _auth.signOut();
                GlobalData.admin = false;
                GlobalData.noOfOrders = 0;
                GlobalData.userData = null;
                GlobalData.userUid = '';
                print('logout successful');
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                leading: Icon(Icons.logout),
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              title: Text(
                'Know your diet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              leading: Icon(
                Icons.auto_awesome_motion,
              ),
            ),
            Visibility(
              visible: GlobalData.admin ?? admin,
              child: ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminLanding()));
                },
                title: Text(
                  'Admin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
                leading: Icon(
                  Icons.important_devices,
                ),
              ),
            ),
          ],
        ),
      ),

      body: Column(children: [
        Container(
            child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true),
                items: imageSlider(carouselImages))),

        // padding widget for the categories
        new Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            alignment: Alignment.center,
            child: new Text(
              'Recent products',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black54),
            ),
          ),
        ),

        //grid view for recent products
        Flexible(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(GlobalData.userUid)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text("Error: ${snapshot.error}");
                if (snapshot.hasData) {
                  var output = snapshot.data.data();
                  if (output != null) {
                    var output = snapshot.data.data();
                    user = UserModel.fromMap(output);
                    GlobalData.userData = user;
                    GlobalData.userUid = userUid;
                    GlobalData.noOfOrders = user.noOfOrders;
                    print(user);
                    var value = output['recentProducts'];
                    if (value != null) {
                      List<Product> recentProducts = (value as List)
                          .map((item) => Product.fromJson(item))
                          .toList();
                      return GridView.builder(
                          itemCount: recentProducts.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      orientation == Orientation.portrait
                                          ? 2
                                          : 3,
                                  childAspectRatio:
                                      orientation == Orientation.portrait
                                          ? 0.8
                                          : 0.9),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          // passing the values of the product to product details page
                                          builder: (context) => ProductDetails(
                                              product: recentProducts[index])));
                                },
                                child: SingleProduct(
                                  prodName: recentProducts[index].name,
                                  prodPicture: recentProducts[index].picture,
                                ),
                              ),
                            );
                          });
                    } else {
                      List<Product> recentProducts =
                          Products.productList.getRange(0, 4).toList();
                      return GridView.builder(
                          itemCount: recentProducts.length,
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      orientation == Orientation.portrait
                                          ? 2
                                          : 3,
                                  childAspectRatio:
                                      orientation == Orientation.portrait
                                          ? 0.8
                                          : 0.9),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          // passing the values of the product to product details page
                                          builder: (context) => ProductDetails(
                                              product: recentProducts[index])));
                                },
                                child: SingleProduct(
                                  prodName: recentProducts[index].name,
                                  prodPicture: recentProducts[index].picture,
                                ),
                              ),
                            );
                          });
                    }
                  } else {
                    return Container();
                  }
                }
                return CircularProgressIndicator();
              }),
        )
      ]),
    );
  }

  List<Widget> imageSlider(List<String> imgList) {
    return imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000)),
              ),
            ))
        .toList();
  }
}
