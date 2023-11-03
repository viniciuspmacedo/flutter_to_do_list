import 'package:flutter/material.dart';

class Difficult extends StatelessWidget {
  const Difficult({
    super.key,
    required this.difficultLevel,
  });

  final int difficultLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: difficultLevel >= 1
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultLevel >= 2
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultLevel >= 3
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultLevel >= 4
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        ),
        Icon(
          Icons.star,
          color: difficultLevel >= 5
              ? Colors.blue
              : Colors.blue[100],
          size: 15,
        )
      ],
    );
  }
}