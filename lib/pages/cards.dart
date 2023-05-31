import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/controller/userController.dart';
import 'package:hackathon/model/user.dart';
import 'package:hackathon/pages/post.dart';
import 'package:http/http.dart' as http;
import 'package:hackathon/controller/localStorage.dart';
import 'package:hackathon/routes/routes.dart';

import '../controller/api.dart';
import '../widgets/sessionExpiredBox.dart';
// import 'package:hackathon/routes/routes.dart';
// import 'package:velocity_x/velocity_x.dart';

class Forums extends StatefulWidget {
  const Forums({super.key});

  @override
  State<Forums> createState() => _ForumsState();
}

class _ForumsState extends State<Forums> {
  LocalStorage ls = LocalStorage();
  String? token = "";
  String? email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readToken();
  }

  void readToken() async {
    Future<String?> tokenRead = ls.readFromStorage('token');
    tokenRead.then((value) {
      token = value;
      // print(value);
      // setState(() {});
    });
    Future<String?> emailRead = ls.readFromStorage('email');
    emailRead.then((value) {
      email = value;
      getUserDetails(value);
      setState(() {});
    });
  }

  void getUserDetails(String? value) async {
    try {
      final response = await http.get(
        Uri.parse('http://${getIp()}/api/users/$value'),
        headers: {
          'Authorization':
              'Barear ${await ls.readFromStorage('token') as String}'
        },
      );
      // print(response.body);
      var json = jsonDecode(response.body);
      var student = json["message"];
      // print(json);
      if (student.toString() == "Invalid Token") {
        displaySessionExpiry(context: context);
      }
      // var studentData = student.toString();
      // var stData = ["message"][0];
      // Student st = Student.fromJson(student);
      // ls.writeToStorage("studentObject", studentData)
      // ;
      // CatalogModel.product1 =
      //     List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
      UserController.student = List.from(student)
          .map<Student>((item) => Student.fromMap(item))
          .toList();
      setState(() {});
      // print(UserController.student[0]);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          constraints: const BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // VxDarkModeButton(),
              //  VxDarkModeMutation(isDarkMode),
              // Text("$email"),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest on IIC",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PostPage(st: UserController.student[0]),
                                ));
                          },
                          child: Icon(Icons.post_add))
                    ],
                  )),
              Divider(thickness: 3),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        color: Theme.of(context).cardColor,
                        // width: MediaQuery.of(context).size.width / 1.1,
                        // height: MediaQuery.of(context).size.width / 11,
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone link for IOS now available for Windows 11",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 22),
                              ),
                              Text(
                                "Created on March 13, 2023 by Aaryan Jha",
                                style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 35),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "I am recently facing error I am recently facing error I am recently facing error on this some help I am recently facing error on this some help I am recently facing error on this some help I am recently facing error on this some help I am recently facing error on this some help",
                                style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 35),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [Text("21.5K"), Text("likes")],
                                  ),
                                  Column(
                                    children: [Text("21.5K"), Text("likes")],
                                  ),
                                  Column(
                                    children: [Text("9"), Text("Comments")],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
              // ElevatedButton(
              //     onPressed: () {
              //       ls.deleteAll();
              //       Navigator.pushReplacementNamed(context, MyRoutes.loginPage);
              //     },
              //     child: Text("Log Out"))
            ],
          ),
        ),
      ),
    );
  }
}
