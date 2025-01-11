import 'package:crud_getx_noteapp_api/Pages/NewNotePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'NoteDetails.dart';
import '../Models/NoteModel.dart';

class NoteWidgets extends StatelessWidget {
  final NoteModel note;
  const NoteWidgets({super.key,required this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(NotesDetails(note: note,));
        // Get.to(const NewNotePage());
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade300,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Expanded(
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // "This is note where i can write anthing",
                        note.title!,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold
                        ),
                      ),
                      Flexible(
                          child: Text(
                              // 'This is a note where i can write anything This is a note where',
                            note.description!,
                            maxLines: 8,
                          )
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
