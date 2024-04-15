import 'package:flutter/material.dart';

class LevelTile extends StatelessWidget {
  const LevelTile({
    super.key,
    required this.imagePath,
    required this.onTap,
    required this.label,
  });

  final String imagePath;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 300,
              fit: BoxFit.cover,
            ),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
