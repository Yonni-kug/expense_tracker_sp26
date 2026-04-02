import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});
 
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            label: Text("Title"),
          ),
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText:'\$',
            label: Text("Amount"),
          )
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            label: Text("Date"),
          )
        ),
        Row(children: [
          ElevatedButton(onPressed:(){
            Navigator.pop(context);
          }, child: Text("Cancel")
        ), 
          ElevatedButton(onPressed: () {
            print(_titleController.text);
            print(_amountController.text);
            print(_dateController.text);
          }, child: Text("Save"))
        ],)
      ],
    ),
  );
}
}
