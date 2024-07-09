class Modeltodo{
  String? task;
  String ?complete;
  String? date;
    String? index;
  get getTask => task;

 void setTask(String task) => this.task = task;

  get getcomplete => complete;

 voidcomplete( complete) => this.complete = complete;

  get getDate => date;

 void setDate( date) => this.date = date;

  get getindex => index;

 void setindex( String index) => this.index = index;
Modeltodo();
Modeltodo.fromMap(Map <String,dynamic> map) {
  task=map['task'].toString();
  complete=map['complete'].toString();
  index=map['id'].toString();
  date=map['date'].toString();

}
@override
  String toString() {
    return 'task $task complete $complete index $index date $date';
  }
}