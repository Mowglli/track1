import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:track1/UI/exercise/totals_widget.dart';

import 'sets.dart';

class Exercise {
  String name;
  List sets;
  String? id;
  int totalReps;
  double totalWeight;
  int totalSets;
  ExerciseTotalsWidget totalWidget = new ExerciseTotalsWidget(
      totals: new TotalsData(0, 0, 0.0, 0.0), index: 0);

  Exercise(
      this.name, this.sets, this.totalSets, this.totalReps, this.totalWeight);

  void setExerciseTotals() {
    totalReps = 0;
    totalSets = 0;
    totalWeight = 0.0;
    for (ExerciseSet set in sets) {
      totalSets += 1;
      final weightInt = set.weight == null ? 0 : double.tryParse(set.weight!);
      final repsInt = set.reps == null ? 0 : int.tryParse(set.reps!);

      totalReps += repsInt!;
      totalWeight += (repsInt * weightInt!);
    }
    totalWidget.totals.totalReps = totalReps;
    totalWidget.totals.totalSets = totalSets;
    totalWidget.totals.totalWeight = totalWeight;
    totalWidget.totals.avg_weight = totalWeight / totalReps;
  }

  Map<String, dynamic> toJson() {
    List the_sets = [];
    for (ExerciseSet set in sets) {
      the_sets.add(set.toJson());
    }
    return {
      "name": name,
      "sets": the_sets,
      "total_reps": totalReps,
      "total_weight": totalWeight,
      "total_sets": totalSets,
      "created": FieldValue.serverTimestamp()
    };
  }

  Exercise.fromJson(Map<String, Object?> exercise)
      : this.name = exercise['name']! as String,
        this.sets = exercise['sets']! as List,
        this.totalReps = exercise['total_reps']! as int,
        this.totalWeight = exercise['total_weight']! as double,
        this.totalSets = exercise['total_sets']! as int;
}
