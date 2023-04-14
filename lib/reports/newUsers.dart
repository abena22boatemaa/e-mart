import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/usermodel.dart';

class UserNumber {
  int date;
  int number;
  UserNumber({@required this.date, @required this.number});
}

class NewUsers extends StatefulWidget {
  final DateTimeRange dateTimeRange;
  final String formatString;
  NewUsers({Key key, @required this.dateTimeRange, @required this.formatString}) : super(key: key);

  @override
  _NewUsersState createState() => _NewUsersState();
}

class _NewUsersState extends State<NewUsers> {
  List<UserModel> newUsers = [];
  List usersNumbers = [];

  var collection = FirebaseFirestore.instance.collection('users');
  getUsersDataFromFirebase() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await collection
        .where('dateSignedUp', isGreaterThanOrEqualTo: widget.dateTimeRange.start)
        .where("dateSignedUp", isLessThanOrEqualTo: widget.dateTimeRange.end)
        .get();
    List<QueryDocumentSnapshot> docs = snapshot.docs;
    var output = docs.map((e) => e.data()).toList();
    newUsers = (output as List).map((e) => UserModel.fromMap(e)).toList();

    Map usersDates = Map<int, List<UserModel>>.fromIterable(newUsers,
        key: (e) => e.dateSignedUp.toUtc().millisecondsSinceEpoch,
        value: (e) => newUsers.where((element) => element.dateSignedUp == e.dateSignedUp).toList());
    print(usersDates);
    usersNumbers.clear();
    usersDates.forEach((key, value) {
      usersNumbers.add(UserNumber(date: key, number: value.length));
    });
    return usersNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: FutureBuilder(
            future: getUsersDataFromFirebase(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("New Users : ${usersNumbers.length}",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                  '${DateFormat('${widget.formatString}').format(DateTime.fromMillisecondsSinceEpoch(usersNumbers[index].date))}',
                                  style: TextStyle(color: Colors.white)),
                              trailing: Text('${usersNumbers[index].number}', style: TextStyle(color: Colors.white)),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: usersNumbers.length)
                    ],
                  ),
                );
              }
              return Center(
                  child: Text("No new users", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)));
            }));
  }
}
