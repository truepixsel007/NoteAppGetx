
import 'package:crud_getx_noteapp_api/Controller/DbController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'N E W - N O T E',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              controller: dbController.title,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
              ),
            ),

            TextFormField(
              controller: dbController.des,
              maxLines: 20,
              decoration: InputDecoration(
                  hintText: 'Desciption',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),

            ElevatedButton(
                onPressed:() {
                  dbController.addNote();
                  Get.back();
                },
                child: Text('Save')
            )
          ],

        ),
      ),
    );
  }
}
