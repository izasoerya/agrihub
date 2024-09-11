import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const SubmitButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!,
      ),
    );
  }
}
