import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/dashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_app/models/usermodel.dart';
import 'package:flutter_app/Elements/textFormField.dart';
import 'package:flutter_app/Elements/button.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserModel userModel;
  TextEditingController phoneNumber;
  TextEditingController address;
  TextEditingController userName;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);

  void validation() async {
    if (userName.text.isEmpty && phoneNumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("All Fields Are Empty"),
        ),
      );
    } else if (userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Name Is Empty "),
        ),
      );
    } else if (userName.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
        ),
      );
    } else if (phoneNumber.text.length < 10 || phoneNumber.text.length > 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 10 "),
        ),
      );
    } else {
      userDetailUpdate();
    }
  }

  File _pickedImage;

  XFile _image;
  Future<void> getImage({ImageSource source}) async {
    _image = await ImagePicker().pickImage(source: source);
    if (_image != null) {
      setState(() {
        _pickedImage = File(_image.path);
      });
    }
  }

  String userUid;

  Future<String> _uploadImage({File image}) async {
    String returnURL;
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('$userUid/profilePic/${path.basename(image.path)}');
    firebase_storage.UploadTask uploadTask = storageReference.putFile(image);

    await uploadTask.whenComplete(() async {
      print('File Uploaded');

      await storageReference.getDownloadURL().then((fileURL) async {
        returnURL = fileURL;
        return returnURL;
      });
    });

    return returnURL;
  }

  void getUserUid() {
    User myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser.uid;
    print(userUid);
  }

  bool centerCircle = false;
  var imageMap;
  void userDetailUpdate() async {
    setState(() {
      centerCircle = true;
    });
    _pickedImage != null
        ? imageMap = await _uploadImage(image: _pickedImage)
        : Container();
    FirebaseFirestore.instance.collection("users").doc(userUid).update({
      "name": userName.text,
      "phoneNumber": phoneNumber.text,
      "profileImage": imageMap,
      "address": address.text
    });
    setState(() {
      centerCircle = false;
    });
    setState(() {
      edit = false;
    });
  }

  Widget _buildSingleContainer(
      {Color color, String startText, String endText}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: edit == true ? color : Colors.white,
          borderRadius: edit == false
              ? BorderRadius.circular(30)
              : BorderRadius.circular(0),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              startText,
              style: TextStyle(fontSize: 17, color: Colors.black45),
            ),
            Text(
              endText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String userImage;
  bool edit = false;
  Widget _buildContainerPart() {
    address = TextEditingController(text: userModel.address);
    userName = TextEditingController(text: userModel.name);
    phoneNumber = TextEditingController(text: userModel.phoneNumber);

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSingleContainer(
            endText: userModel.name,
            startText: "Name",
          ),
          _buildSingleContainer(
            endText: userModel.email,
            startText: "Email",
          ),
          _buildSingleContainer(
            endText: userModel.phoneNumber,
            startText: "Phone Number",
          ),
          _buildSingleContainer(
            endText: userModel.address,
            startText: "Address",
          ),
        ],
      ),
    );
  }

  Future<void> myDialogBox(context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text("Take a picture"),
                    onTap: () {
                      getImage(source: ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text("Pick From Gallery"),
                    onTap: () {
                      getImage(source: ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTextFormFliedPart() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(
            name: "Username",
            controller: userName,
          ),
          _buildSingleContainer(
            color: Colors.grey[300],
            endText: userModel.email,
            startText: "Email",
          ),
          MyTextFormField(
            name: "Phone Number",
            controller: phoneNumber,
          ),
          MyTextFormField(
            name: "Address",
            controller: address,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getUserUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        leading: edit == true
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    edit = false;
                  });
                },
              )
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff5663ff),
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Dashboard(),
                      ),
                    );
                  });
                },
              ),
        actions: [
          edit == false
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.check,
                    size: 30,
                    color: Color(0xff5663ff),
                  ),
                  onPressed: () {
                    validation();
                  },
                ),
        ],
        backgroundColor: Colors.white,
      ),
      body: centerCircle == false
          ? ListView(
              children: [
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(userUid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: Text('Something went wrong'));
                      if (snapshot.hasData) {
                        var output = snapshot.data.data();
                        userModel = UserModel.fromMap(output);

                        print(userModel);
                        return Container(
                          height: 603,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _pickedImage == null
                                            ? CircleAvatar(
                                                maxRadius: 65,
                                                backgroundColor: Colors.white,
                                                child: userModel.profileImage ==
                                                        null
                                                    ? Image.asset(
                                                        "images/backgroundAvatar.png")
                                                    : Image.network(
                                                        userModel.profileImage))
                                            : CircleAvatar(
                                                backgroundImage:
                                                    FileImage(_pickedImage),
                                              )
                                      ],
                                    ),
                                  ),
                                  edit == true
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .viewPadding
                                                      .left +
                                                  220,
                                              top: MediaQuery.of(context)
                                                      .viewPadding
                                                      .left +
                                                  110),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                myDialogBox(context);
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Color(0xff746bc9),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                              Container(
                                height: 350,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: edit == true
                                            ? _buildTextFormFliedPart()
                                            : _buildContainerPart(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: edit == false
                                      ? MyButton(
                                          name: "Edit Profile",
                                          onPressed: () {
                                            setState(() {
                                              edit = true;
                                            });
                                          },
                                        )
                                      : Container(),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
