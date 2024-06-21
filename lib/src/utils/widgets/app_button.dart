import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onTap;
  final Color buttonColor;
  final bool isLoading;
  const AppButton({
    super.key,
    this.onTap,
    this.isLoading = false,
    this.buttonColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: isLoading
            ? const CircularProgressIndicator.adaptive()
            : const Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
      ),
    );
  }
}
