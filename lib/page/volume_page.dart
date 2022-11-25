import 'package:flutter/material.dart';
import 'package:track1/Bloc/workout_bloc.dart';
import 'package:track1/Models/workout.dart';
import 'package:track1/src/widget/chart_workout_progress.dart';

import '../Bloc/exercise_bloc.dart';
import '../Bloc/max_bloc.dart';

class VolumePage extends StatefulWidget {
  VolumePage({Key? key}) : super(key: key);

  @override
  State<VolumePage> createState() => _VolumePageState();
}

double total = 0.0;
double max = 0.0;
final now = DateTime.now();
final prevMonth = DateTime(now.year, now.month - 1, now.day);
List<double> totalweights = [];
List<int> totaldate = [];

class _VolumePageState extends State<VolumePage> {
  @override
  Widget build(BuildContext context) {
    getWorkoutsWithinDates(prevMonth, now).then((work) {
      for (int i = 0; i < work.length; i++) {
        Workout tempwork = work[i];
        totalweights.add(work[i].totalWeight);
        final day = work[i].date?.day ?? 0;
        totaldate.add(day);
        print('...........Start..........');
        print(work[i].totalWeight);
        print('...........End..........');
      }
    });
    return Column(children: [
      Text(max.toString()),
      LineChartSample2(
        totalweights: totalweights,
        totaldate: totaldate,
      ),
    ]);
  }
}
