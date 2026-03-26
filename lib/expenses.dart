import 'package:flutter/material.dart';
import 'package:expense_tracker_sp26/models/Expenses.dart';

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
      category: Category.food
    )
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Chart Here"),
          SizedBox(height: 30),
          Text("Xpenses List Here"),
        ],
      ),
    );
  }
}