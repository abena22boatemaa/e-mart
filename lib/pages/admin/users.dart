import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/usermodel.dart';
import 'package:flutter_app/pages/admin/usersProvider.dart';

class AdminUsers extends StatefulWidget {
  AdminUsers({Key key}) : super(key: key);

  @override
  _AdminUsersState createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Center(child: Text('${snapshot.error.toString()}'));
            if (!snapshot.hasData) return Center(child: Text('Something went wrong'));
            var output = snapshot.data.docs.map((doc) => doc.data()).toList();

            AdminUser.adminUsersList = (output as List).map((item) => UserModel.fromMap(item)).toList();

            return ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      child: AdminUser.adminUsersList[index].profileImage == null
                          ? Image.asset("images/backgroundAvatar.png")
                          : Image.network(AdminUser.adminUsersList[index].profileImage),
                    ),
                    title: Text("${AdminUser.adminUsersList[index].email}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username : ${AdminUser.adminUsersList[index].name}"),
                        Text("Phone Number : ${AdminUser.adminUsersList[index].phoneNumber}"),
                        Text("Address : ${AdminUser.adminUsersList[index].address}"),
                        Text("No of Orders : ${AdminUser.adminUsersList[index].noOfOrders ?? 0}"),
                        Text("User type : ${AdminUser.adminUsersList[index].userType}")
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: AdminUser.adminUsersList.length);
          }),
    );
  }
}
