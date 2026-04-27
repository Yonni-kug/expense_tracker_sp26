import 'dart:math';
import 'package:expense_tracker_sp26/Widgets/chart/chart.dart';
import 'package:expense_tracker_sp26/Widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_sp26/Widgets/new_expense.dart';
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
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  
  void _addExpense(Expense expense) {
  setState(() {
      _registeredExpenses.add(expense);
  });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 6),
        action: SnackBarAction(label: "Undo", onPressed: (){
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        }),
      )
    );
  }

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

    var width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses found. Click the + to add some!"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses, 
        onRemoveExpense: _removeExpense,
      );
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(icon: const Icon(Icons.add),
          onPressed: () {
            _openAddExpenseOverlay();
          },)
        ],
      ),
      body:width < 600 ? Column(
        children: [
          Text("The chart!"),
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ) :
      Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent),
        ]),
    );
  }
}