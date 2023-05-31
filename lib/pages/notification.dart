import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Notifications'),
          ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Notifications",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  Icon(Icons.notifications_active_outlined)
                ],
              )),
          Divider(thickness: 3),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(FontAwesomeIcons.speakap),
                    title: Text("Pradip Bhandari"),
                    subtitle: Text("Subject: Public Holiday"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 73),
                    child: Container(
                      child: Text(
                          "Today we have a public holiday on the ocassion of nothing. Stay happy, safe and enjoy this nothing with your family. Happy nothing!"),
                    ),
                  ),
                  Divider(thickness: 3),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
