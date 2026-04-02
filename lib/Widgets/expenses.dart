import 'package:expense_tracker_sp26/Widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_sp26/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'totinos',
      amount: 2.99,
      date: DateTime.now(),
      category: Category.food,
    ),

    Expense(
      title: 'movie',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),

    Expense(
      title: 'uber',
      amount: 25.99,
      date: DateTime.now(),
      category: Category.travel,
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(icon: const Icon(Icons.add),
          onPressed: () {
            
          },)
        ],
      ),
      body: Column(
        children: [
          Text("Chart Here"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}