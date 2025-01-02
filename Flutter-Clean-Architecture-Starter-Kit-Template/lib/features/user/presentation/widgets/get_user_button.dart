import 'package:flutter/material.dart';

class GetUserButton extends StatelessWidget {
  const GetUserButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text(
          "Get User",
        ),
      ),
    );
  }
}

