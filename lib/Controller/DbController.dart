import 'dart:convert';

import 'package:crud_getx_noteapp_api/Models/NoteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:http/http.dart' as http;


class DbController extends GetxController{

  String url = "https://65f3b94f105614e654a0f3d9.mockapi.io/note";

  RxList<NoteModel> notesList = RxList<NoteModel>();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();

  TextEditingController titleDetails = TextEditingController();
  TextEditingController desDetails = TextEditingController();


  // @override
  void onInit() async {
    // print('call onInit');
    super.onInit();
    getNotes();
  }


  Future<void> getNotes() async {
     var response = await http.get(Uri.parse(url));
     var notes = jsonDecode(response.body);
     notesList.clear();
     for(var note in notes){
       notesList.add(NoteModel.fromJson(note));
     }
     print(' Note Get');
  }

  Future<void> addNote() async {
    var newNote = NoteModel(
      title: title.text,
      description: des.text,
      date: DateTime.now().toString(),
      time: ''
    );

    if(title.text != "" || des.text != ""){
      var response = await http.post(
          Uri.parse(url),
          body: jsonEncode(newNote.toJson()),
          headers:  {"content-type" : "application/json"}
      );
      if(response.statusCode == 201){
        title.clear();
        des.clear();
        print('Note Added');
        getNotes();
        Get.back();
      }
    }else{
      print("please enter something");
    }

  }

  Future<void> deleteNote(String id) async {
    var newUrl = "https://65f3b94f105614e654a0f3d9.mockapi.io/note/$id";
    final response = await http.delete(Uri.parse(newUrl));
    if(response.statusCode == 200){
      print('note delete');
      getNotes();
      Get.back();
    }

  }

  Future<void> updateNote(String id) async {
    var newUrl = "https://65f3b94f105614e654a0f3d9.mockapi.io/note/$id";
    var updateNote = NoteModel(
      title: titleDetails.text,
      description: desDetails.text,
    );
    var response = await http.put(
        Uri.parse(newUrl),
        body: jsonEncode(updateNote.toJson()),
        headers:  {"content-type" : "application/json"}
    );
    if(response.statusCode == 200){
      print('Note Added');
      getNotes();
      Get.back();
    }
  }

}
