import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/home.dart';
import 'package:realestate/sellpage.dart';

import 'getrealestate.dart';

class Buy_Page extends StatefulWidget {
  const Buy_Page({super.key});

  @override
  State<Buy_Page> createState() => _Buy_PageState();
}

class _Buy_PageState extends State<Buy_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: f,
      floatingActionButton: FloatingActionButton(
        splashColor: const Color.fromARGB(255, 255, 255, 255),
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const Sell_Page());
        },
      ),
    );
  }
}