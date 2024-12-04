import 'package:billsplit_apk/auth/billsplit/expense.dart';
import 'package:flutter/material.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, dynamic>> _expenses = [];

  void _addExpense(Map<String, dynamic> expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(int index) {
    setState(() {
      _expenses.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        children: [
          Expanded(
            child: _expenses.isEmpty
                ? const Center(
                    child: Text(
                      "No expenses added yet!",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) {
                      final expense = _expenses[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(
                              "${expense['name']} - \$${expense['splitAmount']} each"),
                          subtitle: Text(
                              "Total Bill: \$${expense['total']} (Tip: \$${expense['tip']})"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeExpense(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final expense = await Navigator.push<Map<String, dynamic>>(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpensePage(),
            ),
          );
          if (expense != null) {
            _addExpense(expense);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
