import 'package:flutter/material.dart';

class BillManagementScreen extends StatelessWidget {
  const BillManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text("Current Bill"),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text("\$50.00"),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).primaryColor,
                  ),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                ),
                child: const Text("Pay Now"),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text("Past Bills"),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  ...[
                    "December 2023 - \$45.00",
                    "November 2023 - \$55.00",
                    "October 2023 - \$40.00",
                  ].map((bill) {
                    return ListTile(
                      title: Text(
                        bill,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                        ),
                      ),
                      trailing: Icon(
                        Icons.receipt,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
