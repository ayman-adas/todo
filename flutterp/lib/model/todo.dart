class Modeltodo{
  String? task;
  bool ?complete;
  int? date;
  int ?index;

  get getTask => task;

 void setTask(String task) => this.task = task;

  get getcomplete => complete;

 voidcomplete( complete) => this.complete = complete;

  get getDate => date;

 void setDate( date) => this.date = date;

  get getindex => index;

 void setindex( int index) => this.index = index;
Modeltodo();
Modeltodo.fromMap(Map <String,dynamic> map) {
  task=map['task'];
  complete=map['complete'];
  index=map['index'];
  date=map['date'];

}

}