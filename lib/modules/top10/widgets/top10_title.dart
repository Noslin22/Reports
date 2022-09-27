import 'package:flutter/material.dart';

class Top10Title extends StatefulWidget {
  const Top10Title({Key? key}) : super(key: key);

  @override
  State<Top10Title> createState() => _Top10TitleState();
}

class _Top10TitleState extends State<Top10Title> {
  bool isTithe = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Top 10 - Igrejas",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Dízimo",
              style: TextStyle(
                color: isTithe ? null : Colors.grey[200],
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              "Oferta",
              style: TextStyle(
                color: !isTithe ? null : Colors.grey[200],
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
