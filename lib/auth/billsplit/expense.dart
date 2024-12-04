import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _billController = TextEditingController();
  double _tip = 0.0;
  int _friends = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name of people to split with (comma separated)",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _billController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Total Bill Amount (\$)",
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tip (\$):"),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          _tip = (_tip - 1).clamp(0, double.infinity);
                        });
                      },
                    ),
                    Text("\$${_tip.toStringAsFixed(1)}"),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _tip++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Number of Friends:"),
                DropdownButton<int>(
                  value: _friends,
                  items: List.generate(10, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text("${index + 1}"),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      _friends = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _billController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Fill all the fields")),
                  );
                  return;
                }
                double total = double.parse(_billController.text);
                double splitAmount = (total + _tip) / _friends;
                Navigator.pop(context, {
                  "name": _nameController.text,
                  "total": total,
                  "tip": _tip,
                  "splitAmount": splitAmount.toStringAsFixed(2),
                });
              },
              child: const Text("Split Bill"),
            ),
          ],
        ),
      ),
    );
  }
}
