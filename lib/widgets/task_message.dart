import 'package:flutter/material.dart';

class TaskMessage extends StatefulWidget {
  const TaskMessage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<TaskMessage> createState() => _TaskMessageState();
}

class _TaskMessageState extends State<TaskMessage> {
  bool isOpen = false;
  void onButtonPress() {
    final currentValue = isOpen;
    setState(() {
      isOpen = !currentValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      left: 0,
      bottom: isOpen ? 0 : -(height / 3) + 60,
      child: Container(
        color: Theme.of(context).colorScheme.onBackground,
        width: width,
        height: height / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: double.infinity,
              height: 60,
              child: TextButton.icon(
                  onPressed: onButtonPress,
                  style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.onBackground),
                  label: const Text("WYZWANIE"),
                  icon: Icon(
                    isOpen
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                  )),
            ),
            const SizedBox(height: 20),
            widget.child,
          ],
        ),
      ),
    );
  }
}
