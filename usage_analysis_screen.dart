import 'package:flutter/material.dart';

class UsageData {
  final DateTime time;
  final double usage;

  UsageData(this.time, this.usage);
}

class UsageAnalysisScreen extends StatelessWidget {
  const UsageAnalysisScreen({super.key});

  List<UsageData> _generateChartData() {
    return [
      UsageData(DateTime.now(), (5 * 0.8)),
      UsageData(DateTime.now(), (5 * 0.2)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final data = _generateChartData();
    final averageUsage =
        data.map((e) => e.usage).reduce((a, b) => a + b) / data.length;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Current Usage"),
                    SizedBox(height: 8),
                    Text("Electricity: 1.5 kW"),
                    Text("Water: 0.2 L/min"),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              DefaultTextStyle(
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Historical Usage"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor,
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          child: const Text("Daily"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor,
                            ),
                            foregroundColor: WidgetStateProperty.all(
                              Colors.white,
                            ),
                          ),
                          child: const Text("Monthly"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8),
                child: LinearProgressIndicator(
                  value: averageUsage / 5.0,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
