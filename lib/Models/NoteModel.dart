class NoteModel {
   String? title;
   String? description;
   String? date;
   String? time;
   String? id;

   NoteModel({this.title, this.description, this.date, this.time, this.id});

   NoteModel.fromJson(Map<String, dynamic> json) {
      title = json['title'];
      description = json['description'];
      date = json['date'];
      time = json['time'];
      id = json['id'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['title'] = this.title;
      data['description'] = this.description;
      data['date'] = this.date;
      data['time'] = this.time;
      data['id'] = this.id;
      return data;
   }
}
