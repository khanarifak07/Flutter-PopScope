import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Page 2",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Navigate to Page 1",
              style: TextStyle(fontSize: 20),
            ),
            PopScope(
              canPop: false,
              onPopInvoked: (bool didPop) async {
                if (didPop) {
                  return;
                }
                final bool shouldPop = await _showBackDialog() ?? false;
                //if the context of the current widget is still valid and user has confirmed to leave the screen then pop
                if (context.mounted && shouldPop) {
                  Navigator.pop(context);
                }
              },
              child: TextButton(
                onPressed: () async {
                  bool shouldPop = await _showBackDialog() ?? false;
                  if (context.mounted && shouldPop) {
                    Navigator.pop(context);
                  }
                },
                child: const Text("Go Back"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> _showBackDialog() async {
    return showDialog(
        context: (context),
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Are you sure you want to leave"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("Leave"))
            ],
          );
        });
  }
}
