import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final bool onChanged;

  const MainButton({
    Key? key,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(
          color: onChanged == false ? Colors.amber : Colors.deepPurpleAccent,
        ),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              onChanged == false ? Colors.pink : Colors.deepPurpleAccent,
              onChanged == false ? Colors.amber : Colors.black87
            ]),
      ),
      height: 60,
      width: title != '+'
          ? (MediaQuery.of(context).size.width - 88) / 3
          : (MediaQuery.of(context).size.width - 58) * 2 / 3,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
