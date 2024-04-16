import 'package:flutter/material.dart';
import 'package:flutter_les3/models/expense.dart';
import 'package:flutter_les3/wdiget/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpenses});

  final void Function(Expense expense) onRemoveExpenses;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        direction: DismissDirection.horizontal,
        background: Container(
          color: Theme.of(context).colorScheme.background.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpenses(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
