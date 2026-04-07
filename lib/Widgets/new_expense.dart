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

void _presentDatePicker() async {
  final now = DateTime.now();
  final firstDate = DateTime(now.year - 1, now.month, now.day);
  final pickedDate = await showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: firstDate, 
    lastDate: now
  );
  print(pickedDate);
}

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
        
        Row(
            children: [
              Expanded(
                child: TextField(
                  controller:_amountController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text("Amount"),
                  ),
                ),
              ),
              SizedBox(width:16),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const Text('Selected Date'),
                IconButton(onPressed:_presentDatePicker , icon: const Icon(Icons.calendar_month))
              ],),)
            ],
          ),

        TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            prefixText: '///',
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
        ],
      )

      ],
    ),
  );
}
}
