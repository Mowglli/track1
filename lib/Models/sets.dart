class ExerciseSet {
  final String? rest;
  final String? weight;
  final String? reps;

  ExerciseSet(this.rest, this.weight, this.reps);

  Map<dynamic, dynamic> toJson() {
    return {
      "rest": rest,
      "weight": weight,
      "reps": reps,
    };
  }

  static ExerciseSet fromString(Map set) {
    return ExerciseSet(set['rest'], set['weight'], set['reps']);
  }
}
