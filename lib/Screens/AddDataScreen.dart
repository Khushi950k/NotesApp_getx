import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp_getx/Controller/dbController.dart';
import 'package:notesapp_getx/Models/notesmodel.dart';
import 'package:notesapp_getx/Widgets/UiHelper.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final DatabaseHelper databaseHelper=Get.put(DatabaseHelper());
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(titleController,"Enter Title", Icons.title),
          UiHelper.CustomTextField(descController,"Enter Description", Icons.description),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            final newnote=NotesModel(title: titleController.text.toString(), desc: descController.text.toString());
            databaseHelper.addNotes(newnote);
            Get.back();
          }, child: Text("Add Notes"))

        ],),
    );
  }
}