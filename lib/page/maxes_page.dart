import 'package:flutter/material.dart';
import 'package:track1/Bloc/workout_bloc.dart';
import 'package:track1/Models/exercise.dart';
import 'package:track1/Models/sets.dart';
import 'package:track1/Models/workout.dart';
import 'package:track1/src/widget/chart_workout_progress.dart';

import '../Bloc/user_bloc.dart';

class MaxesPage extends StatefulWidget {
  MaxesPage({Key? key}) : super(key: key);

  @override
  State<MaxesPage> createState() => _MaxesPageState();
}

class _MaxesPageState extends State<MaxesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            final userID = "5";

            final set = ExerciseSet("1", "75", "10");
            final exercise = Exercise("Traos", [set], 0, 0, 0);
            exercise.setExerciseTotals();
            final workout = Workout([exercise], "Det gik fint", "10", 60,
                "type", "name", true, 0, 0, 0);
            //workout.setWorkoutTotals();
            saveWorkout(workout, userID);
          },
          child: const Text('pop')),
    ]);
  }
}
