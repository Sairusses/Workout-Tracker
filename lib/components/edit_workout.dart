import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workout_tracker/components/custom_text_widgets.dart';
import 'package:workout_tracker/models/workout_model.dart';
import '../db_helper.dart';
import 'custom_text_form_field.dart';

class EditWorkout extends StatefulWidget {
  final Workout workout;
  const EditWorkout({super.key, required this.workout});

  @override
  State<EditWorkout> createState() => EditWorkoutState();
}

class EditWorkoutState extends State<EditWorkout> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  final List<String> workOutTypes = ['Reps', 'Duration'];
  String? selectedWorkoutType;
  late DateTime date;
  String dateString = "Set date";
  final db = DBHelper();

  @override
  void initState() {
    final workout = widget.workout;
    titleController.text = workout.title;
    selectedWorkoutType = workout.type == 'reps' ? 'Reps' : 'Duration';
    typeController.text = workout.type == 'reps'
        ? workout.reps.toString()
        : workout.duration.toString();
    setsController.text = workout.sets.toString();
    date = workout.date;
    dateString = "${date.day}/${date.month}/${date.year}";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Edit Workout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Title and Sets Row
            Row(
              children: [
                Flexible(
                  child: CustomTextFormField(
                    controller: titleController,
                    labelText: "Title",
                    hint: "Workout title",
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  child: CustomTextFormField(
                    controller: setsController,
                    labelText: "Sets",
                    textInputType: TextInputType.number,
                    hint: 'Sets',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Type input and Dropdown
            Row(
              children: [
                Flexible(
                  child: CustomTextFormField(
                    controller: typeController,
                    labelText: selectedWorkoutType ?? 'Select Type First',
                    hint: selectedWorkoutType == 'Reps'
                        ? 'Reps'
                        : selectedWorkoutType == 'Duration'
                        ? 'Minutes'
                        : "Type",
                    textInputType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const SizedBox(height: 17),
                    SizedBox(
                      width: 100,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            selectedWorkoutType ?? 'Type',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          items: workOutTypes
                              .map(
                                (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                              .toList(),
                          value: selectedWorkoutType,
                          onChanged: (value) {
                            setState(() {
                              selectedWorkoutType = value;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 120,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.black54),
                              color: Colors.white,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            iconSize: 14,
                            iconEnabledColor: Colors.black,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 14),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Date Picker
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(color: Colors.black54),
                ),
                elevation: 2,
              ),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  setState(() {
                    date = pickedDate;
                    dateString = "${date.day}/${date.month}/${date.year}";
                  });
                } else {
                  Fluttertoast.showToast(
                    msg: 'No date selected.',
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.grey[50],
                    textColor: Colors.black,
                  );
                }
              },
              icon: const Icon(Icons.calendar_today, color: Colors.black),
              label: Text(
                dateString,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty ||
                    setsController.text.isEmpty ||
                    typeController.text.isEmpty ||
                    selectedWorkoutType == null ||
                    dateString == "Set date") {
                  Fluttertoast.showToast(
                    msg: 'Please fill in all fields.',
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.grey[50],
                  );
                  return;
                }

                // Construct updated workout
                Workout updatedWorkout = Workout(
                  id: widget.workout.id,
                  title: titleController.text,
                  type: selectedWorkoutType!.toLowerCase(),
                  reps: selectedWorkoutType == 'Reps'
                      ? int.tryParse(typeController.text) ?? 0
                      : 0,
                  duration: selectedWorkoutType == 'Duration'
                      ? int.tryParse(typeController.text) ?? 0
                      : 0,
                  sets: int.tryParse(setsController.text) ?? 0,
                  date: date,
                );

                db.updateWorkout(updatedWorkout);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const MediumText(text: 'Submit', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
