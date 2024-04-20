import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:realestate/buypage.dart';
import 'package:realestate/home.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String API_URL = dotenv.get("API_URL");

class Sell_Page extends StatefulWidget {
  const Sell_Page({super.key});

  @override
  State<Sell_Page> createState() => _Sell_PageState();
}

class _Sell_PageState extends State<Sell_Page> {

  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final bathroomsController = TextEditingController();
  final balconyController = TextEditingController();
  final roomsController = TextEditingController();
  
  final _formkey = GlobalKey<FormState>();
  
  Future postData() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    final response = await http.post(
      Uri.parse("$API_URL/realestate/create"),
      body: json.encode({
      "realestate_Id": "string",
      "realestate_name": nameController.text,
      "realestate_location": locationController.text,
      "realestate_address": addressController.text,
      "realestate_area": areaController.text,
      "rooms": roomsController.text,
      "bathrooms": bathroomsController.text,
      "balconys": balconyController.text,
      "realestate_images_ids": [],
      }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
        },
    );

    
    
  }

  @override
  Widget build(BuildContext context) {
    
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.2,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Property Name',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Location',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: areaController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Area',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: roomsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Rooms',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: bathroomsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bathrooms',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextFormField(
                  controller: balconyController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Balcony',
                  ),
                ),
              ),
              
              
              ElevatedButton(
                onPressed: () {
                  
                  if (_formkey.currentState!.validate()) {
                    Future.wait([
                      postData()                  
                    ]);
                    Get.off(() => const MyHomePage());
                  }
                },
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.07,
                  child: const Center(
                    child: Text(
                      "Upload",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: screenHeight * 0.05,
              ),
            
            ],
          ),
        ),
      ),
      );
  }
}