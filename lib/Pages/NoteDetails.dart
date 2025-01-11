// Get.to(NotesDetails(note: note,));

import 'package:crud_getx_noteapp_api/Controller/DbController.dart';
import 'package:crud_getx_noteapp_api/Models/NoteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesDetails extends StatelessWidget {
  final NoteModel note;
  const NotesDetails({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
    dbController.titleDetails.text = note.title.toString();
    dbController.desDetails.text = note.description.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'N E W - N O T E',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
          onPressed: (){
            print(note.id);
            dbController.deleteNote(note.id!);
          },
          icon: Icon(
              Icons.delete,
            color: Colors.white,
         )
          )
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              controller: dbController.titleDetails,
              decoration: InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            TextFormField(
              controller: dbController.desDetails,
              maxLines: 20,
              decoration: InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 20,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  dbController.updateNote(note.id!);
                },
                child: Text("Update Note"))
          ],
        ),
      ),
    );
  }
}
