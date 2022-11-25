import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:track1/Bloc/exercise_bloc.dart';
import 'package:track1/Bloc/max_bloc.dart';
import 'package:track1/Bloc/user_bloc.dart';
import 'package:track1/Bloc/workout_bloc.dart';
import 'package:track1/Models/exercise.dart';
import 'package:track1/Models/maxes.dart';
import 'package:track1/Models/sets.dart';
import 'package:track1/Models/workout.dart';
import 'package:track1/Models/user.dart';
import 'package:track1/page/exercise_page.dart';
import 'package:track1/page/maxes_page.dart';
import 'package:track1/page/volume_page.dart';
import 'package:track1/src/widget/chart_workout_progress.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

/*
final userID = "5";
//final db = FirebaseFirestore.instance;
final user1 = UserClass(
    'Jesper', 175, 75, 28, 'jepper1994@me.com', 'Jesper', 'Nielsen', '2', '2');
final sets1 = Sets(3, 75, 10);
final sets2 = Sets(3, 80, 10);
//final exercise = Exercise("Bench", [sets1, sets2], ["Chest"], 0, 0, 0);
final sets11 = Sets(3, 75, 10);
final sets22 = Sets(3, 80, 10);
//final exercise1 = Exercise("Back", [sets11, sets22], ["Chest"], 0, 0, 0);
//final testmax = Max(0, 0, 0, "exercise1");
*/

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;
  final screens = [
    VolumePage(),
    ExercisePage(),
    MaxesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: screens[_selectedIndex],
      // ignore: prefer_const_constructors
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.black,
              tabBackgroundColor: Colors.grey.shade300,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(icon: Icons.work, text: "Workout"),
                GButton(icon: Icons.chat_rounded, text: "Maxes"),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    ));
  }
}
