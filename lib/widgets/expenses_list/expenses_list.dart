import 'package:flutter/material.dart';

import 'package:app_three/widgets/expenses_list/expense_item.dart';
import 'package:app_three/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemovedExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemovedExpense; //We assign the

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        //Removes the expenses from list by swiping them to the left
        key: ValueKey(expenses[index]),
        //This creates a background color behind the card so when the card
        // is swipped to be deleted, there is a background colorthat is displayed
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        //Here, when an expense is swipped off the screen it is then removed from the expense list
        onDismissed: (direction) {
          onRemovedExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
