import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';
class AddWorkoutDialog extends StatefulWidget{
  const AddWorkoutDialog({super.key});
  @override
  State<AddWorkoutDialog> createState() => AddWorkoutDialogState();
}

class AddWorkoutDialogState extends State<AddWorkoutDialog>{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final List<String> workOutTypes = ['Reps', 'Duration'];

  String? selectedWorkoutType;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New Workout",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              controller: titleController,
              labelText: "Title",
              hint: "Enter workout title",
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: CustomTextFormField(
                    controller: repsController,
                    labelText: selectedWorkoutType ?? 'Select Type First',
                    hint: selectedWorkoutType == 'Reps' ? 'Reps' : selectedWorkoutType == 'Duration' ? 'Minutes' : "Type",
                    textInputType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    SizedBox(height: 12,),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          selectedWorkoutType ?? 'Type',
                          style:  TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: workOutTypes.map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
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
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black54,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}