import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:track1/Models/sets.dart';
import 'package:track1/Models/exercise.dart';
import 'package:track1/Models/workout.dart';
import 'package:track1/src/widget/text_field.dart';

import '../Bloc/workout_bloc.dart';

late final List<String> setList;
late final List<String> kgList;
late final List<String> restList;

class ExercisePage extends StatefulWidget {
  ExercisePage({Key? key}) : super(key: key);

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExerciseList();
  }
}

class ExerciseList extends StatefulWidget {
  const ExerciseList({super.key});

  @override
  ExerciseListState createState() => ExerciseListState();
}

class ExerciseListState extends State<ExerciseList> {
  final List<ExerciseListView> exercises = [
    ExerciseListView(sets: [Set()])
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'Exercises',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SetsList(sets: exercises[index].sets),
            ),
          ),
        ),
        TextButton(
          onPressed: () => setState(
            () => exercises.add(
              ExerciseListView(sets: [Set()]),
            ),
          ),
          child: const Text('Add exercise'),
        ),
        TextButton(
          onPressed: () {
            final userID = "5";

            List<Exercise> ex = [];
            for (int i = 0; i < exercises.length; i++) {
              print(exercises[i].sets);
              for (int j = 0; j < exercises[i].sets.length; j++) {
                //se.forEach((widget) => kgList.add(widget._kgcontroller));
              }
              //ex.add(Exercise("tester", exercises[i].sets, 0, 0, 0));
              //ex[i].setExerciseTotals();
            }
            //final workout = Workout(
            //    ex, "Fra listview", "10", 60, "type", "name", true, 0, 0, 0);
            //saveWorkout(workout, userID);
          },
          child: const Text('Save Workout'),
        ),
      ],
    );
  }
}

class SetsList extends StatefulWidget {
  final List<Set>? sets;
  final void Function(List<Set> sets)? onSetsChanged;

  const SetsList({
    super.key,
    this.sets,
    this.onSetsChanged,
  });

  @override
  SetsListState createState() => SetsListState();
}

class SetsListState extends State<SetsList> {
  late final List<Set> sets;

  @override
  void initState() {
    super.initState();
    sets = widget.sets ?? [Set()];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Exercise',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            SizedBox(width: 10),
            Expanded(
              child: Text('Set'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text('Rest'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text('Kilos'),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text('Reps'),
            ),
            SizedBox(width: 10),
          ],
        ),
        ListView.builder(
          itemCount: sets.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemExtent: 50,
          itemBuilder: (context, index) => SetTile(
            index: index,
            onChange: (set) {
              setState(() => sets[index] = set);

              if (widget.onSetsChanged != null) {
                widget.onSetsChanged!(sets);
              }
            },
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() => sets.add(Set()));
            },
            child: const Text('+ Add set')),
      ],
    );
  }
}

class SetTile extends StatefulWidget {
  final int index;
  final void Function(Set set)? onChange;
  final void Function(int index)? onRemove;

  const SetTile({
    super.key,
    required this.index,
    this.onChange,
    this.onRemove,
  });

  @override
  SetTileState createState() => SetTileState();
}

class SetTileState extends State<SetTile> {
  late final TextEditingController _restController;
  late final TextEditingController _kgController;
  late final TextEditingController _repsController;

  @override
  void initState() {
    super.initState();

    _restController = TextEditingController();
    _kgController = TextEditingController();
    _repsController = TextEditingController();

    if (widget.onChange != null) {
      _restController.addListener(onChange);
      _kgController.addListener(onChange);
      _repsController.addListener(onChange);
    }
  }

  Set _getSet() => Set(
        rest: _restController.text,
        kg: _kgController.text,
        reps: _repsController.text,
      );

  void onChange() => widget.onChange!(_getSet());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity((widget.index * 5) / 100),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(child: Text('${widget.index + 1}')),
          const SizedBox(width: 10),
          TextInput(controller: _restController),
          //OutlinedTextField(textEditingController: _restController, validator: ,hinText: "0",leadingIcon: ,),
          const SizedBox(width: 10),
          TextInput(controller: _kgController),
          const SizedBox(width: 10),
          TextInput(controller: _repsController),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.onChange != null) {
      _restController.removeListener(onChange);
      _kgController.removeListener(onChange);
      _repsController.removeListener(onChange);
    }

    _restController.dispose();
    _kgController.dispose();
    _repsController.dispose();
    super.dispose();
  }
}

class TextInput extends StatelessWidget {
  final TextEditingController controller;

  const TextInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 30,
        width: 40,
        child: TextField(
          controller: controller,
          decoration: decoratedField,
        ),
      ),
    );
  }
}

class ExerciseListView {
  List<Set> sets;

  ExerciseListView({
    required this.sets,
  });
}

class Set {
  final String? rest;
  final String? kg;
  final String? reps;

  Set({
    this.rest,
    this.kg,
    this.reps,
  });

  Set copyWith({
    String? rest,
    String? kg,
    String? reps,
  }) {
    return Set(
      rest: rest ?? this.rest,
      kg: kg ?? this.kg,
      reps: reps ?? this.reps,
    );
  }
}

final decoratedField = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    contentPadding: EdgeInsets.all(8),
    filled: true,
    hintStyle: TextStyle(color: Colors.grey[800]),
    hintText: "0",
    fillColor: Colors.white70);
