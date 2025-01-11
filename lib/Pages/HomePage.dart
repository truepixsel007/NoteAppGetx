// theme color = http://mcg.mbitson.com/#!?mcgpalette0=%233f51b5

import 'package:crud_getx_noteapp_api/Controller/DbController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_getx_noteapp_api/Pages/NewNotePage.dart';
import 'package:crud_getx_noteapp_api/Pages/NoteWidgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    DbController dbController = Get.put(DbController());

    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.deepPurple.shade100,
         title: const Text('A P I - N O T E',
         style: TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.bold,
         ),
         ),
         centerTitle: true,
         actions: [
           IconButton(
               onPressed: (){
                 dbController.getNotes();
               },
               icon: const Icon(
               Icons.search,
                 color: Colors.white,
           ))
         ],
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // dbController.addNote();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NewNotePage()));
        },
        // tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
       body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() => GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children:
            dbController.notesList.map(
              // e mean element
                  (e) => NoteWidgets(
                note: e,
              ),
            ).toList(),
          ),
          ),
       ),
    );
  }
}
