
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:ftodo/api/api.dart';
import 'package:provider/provider.dart';


class AddTodoScreen extends StatefulWidget {
@override 
_AddTodoScreenState createState()=>_AddTodoScreenState();

}

class _AddTodoScreenState extends State<AddTodoScreen> {

final todoTitleController = TextEditingController();
final tododesController = TextEditingController();

void onAdd() {
final String textVal= todoTitleController.text;
final String desVal = tododesController.text;

if(textVal.isNotEmpty && desVal.isNotEmpty){
final Todo todo = Todo(title:textVal,description:desVal);
Provider.of<TodoProvider>(context,listen:false).addTodo(todo);

}
}

@override 
Widget build (BuildContext context )  {
return Scaffold(
appBar: AppBar (
  title:Text('Add Todo')
), 
body: ListView (
  children: [
    Container (
      child: Column(
        children:[
          TextField(controller: todoTitleController,),
            TextField(controller: tododesController,),
            ElevatedButton(
              child: Text('Add'),
              onPressed:() {
                onAdd();
                Navigator.of(context).pop();

            })
        ],
      ),
)
],
),
);
}
}
