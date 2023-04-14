import 'package:flutter/material.dart';
import 'package:flutter_app/reports/inventory.dart';
import 'package:flutter_app/reports/newUsers.dart';
import 'package:flutter_app/reports/profitMade.dart';

class ReportDuration {
  String title;
  DateTimeRange dateTimeRange;
  String formatString;
  ReportDuration({@required this.title, @required this.dateTimeRange, @required this.formatString});
}

class Reports extends StatefulWidget {
  Reports({Key key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<ReportDuration> reportDurations = [
    ReportDuration(
        title: "Last 24 hours",
        dateTimeRange: DateTimeRange(start: DateTime.now().subtract(Duration(hours: 24)), end: DateTime.now()),
        formatString: 'Hms'),
    ReportDuration(
        title: "Last 48 hours",
        dateTimeRange: DateTimeRange(start: DateTime.now().subtract(Duration(hours: 48)), end: DateTime.now()),
        formatString: 'MMMd'),
    ReportDuration(
        title: "Last 30 days",
        dateTimeRange: DateTimeRange(start: DateTime.now().subtract(Duration(days: 30)), end: DateTime.now()),
        formatString: 'MMMMd'),
    ReportDuration(
        title: "Last 365 days",
        dateTimeRange: DateTimeRange(start: DateTime.now().subtract(Duration(days: 365)), end: DateTime.now()),
        formatString: 'yMMMMd'),
  ];
  ReportDuration initialDuration;
  @override
  void initState() {
    initialDuration = reportDurations[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Reports'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: DropdownButtonFormField<ReportDuration>(
                    value: initialDuration,
                    onChanged: (newvalue) {
                      setState(() {
                        initialDuration = newvalue;
                      });
                    },
                    items: reportDurations.map((ReportDuration reportDuration) {
                      return DropdownMenuItem<ReportDuration>(
                        child: Text(reportDuration.title),
                        value: reportDuration,
                      );
                    }).toList(),
                    validator: (value) {
                      if (initialDuration != value) {
                        return '--Select range--';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    NewUsers(
                      dateTimeRange: initialDuration.dateTimeRange,
                      formatString: initialDuration.formatString,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProfitMade(
                      dateTimeRange: initialDuration.dateTimeRange,
                    )
                  ],
                ),
                SizedBox(height: 20),
                Inventory()
              ],
            ),
          )),
    );
  }
}
