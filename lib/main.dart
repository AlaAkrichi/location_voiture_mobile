// ignore_for_file: prefer_const_constructors

//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:location_voiture/screens/cars/addCard.dart';
import 'package:location_voiture/screens/cars/carDetails.dart';
import 'package:location_voiture/screens/cars/carList.dart';
import 'package:location_voiture/screens/home.dart';
import 'package:location_voiture/screens/locateur/locateurList.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/":(context) => Home(),
      "/cars":(context) => CarList(),
      "/addcar":(context) => AddCar(),
      "/carDetails":(context)=>CarDetails(),
      "/locateurs":(context) => LocationList()
    }
  ));
}


