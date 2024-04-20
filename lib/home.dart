import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/buypage.dart';
import 'package:realestate/sellpage.dart';
import 'package:realestate/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'placeStruct.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   Future<Places>? futurePlace;

  Future<Places> getPlace() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    http.Response response = await http.get(
      Uri.parse("$API_URL/realestate/fetch"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return Places.fromJson(json.decode(response.body));
    } else {
      throw Exception('');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePlace = getPlace();
  }

   Future logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString("user_status", "loggedOut");
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7BD3EA),
        shadowColor: Colors.black,
        elevation: 5,
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Click on Logout to confirm'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Cancel');
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          logout().whenComplete(
                              () => Get.off(() => const Spalsh_Screen()));
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
              },
              icon: Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(
                  Icons.logout_rounded,
                ),
              ))
        ],
      ),
      body: FutureBuilder<Places>(
                  future: futurePlace,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                          itemCount: snapshot.data!.count!.toInt(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                               
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF7BD3EA)
                                          .withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 5),
                                  child: Text(
                                    snapshot.data!.result![index].realestateName
                                        .toString(),
                                    style: const TextStyle(fontSize: 20, color: Colors.black , fontWeight:FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return const Center(child: CircularProgressIndicator());
                  })),
      drawer:Drawer(backgroundColor: Colors.red,child: Text("sdsd")),
    );
  }
}