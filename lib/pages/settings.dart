import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/controller/localStorage.dart';
import 'package:hackathon/controller/userController.dart';
import 'package:hackathon/routes/routes.dart';

import '../controller/api.dart';
// import 'package:velocity_x/velocity_x.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  LocalStorage ls = LocalStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(UserController.student[0].id);
  }

  // const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            // heightFactor: 0.1,
            // color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Positioned(
                //   left: 60,
                //   child: CircleAvatar(
                //     radius: 80,
                //     child: Image.asset("assets/vector/profile.png"),
                //   ),
                // ),
                // CircleAvatar(
                //   radius: 80,
                //   child: Image.asset("assets/vector/profile.png"),
                // ),
                Positioned(
                  right: 30,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.2,
                    height: MediaQuery.sizeOf(context).width / 5.2,
                    // color: Colors.red,
                    child: CircleAvatar(
                      // foregroundColor: Colors.amber,
                      backgroundColor: Color(0xfffae5e1),
                      child: Icon(
                        Icons.camera_enhance,
                      ),
                      // radius: 60,
                    ),
                  ),
                ), //Container
                Positioned(
                  child: Container(
                    // child: CircleAvatar(),
                    width: MediaQuery.sizeOf(context).width * 1,
                    height: MediaQuery.sizeOf(context).width / 5,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              image(UserController.student[0].image)),
                        )),
                  ),
                ), //Container
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.people_alt_outlined,
            ),
            title: Text("User Name"),
            subtitle: Text("${UserController.student[0].name}"),
          ),
          ListTile(
            // dense: true,
            leading: Icon(
              Icons.email_outlined,
              // color: Theme.of(context).primaryColor,
            ),
            title: Text("Email Address"),
            subtitle: Text("${UserController.student[0].email}"),
          ),
          const ListTile(
              // dense: true,
              leading: Icon(
                Icons.people_alt_outlined,
                // color: Theme.of(context).primaryColor,
              ),
              title: Text("Edit Profile"),
              subtitle: Text("The basics of profile and general information"),
              trailing: Icon(CupertinoIcons.arrowshape_turn_up_right)),
          const ListTile(
              // dense: true,
              leading: Icon(
                Icons.lock,
                // color: Theme.of(context).primaryColor,
              ),
              title: Text("Reset Password"),
              subtitle: Text("Change your password here :)"),
              trailing: Icon(CupertinoIcons.arrowshape_turn_up_right)),
          ElevatedButton(
              onPressed: () {
                ls.deleteAll();
                Navigator.pushNamed(context, MyRoutes.loginPage);
              },
              child: Text("Log Out"))
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: e,
                ))
            .toList(),
      ),
    ));
  }
}
