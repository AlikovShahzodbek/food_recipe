import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart'; // Убедись, что путь корректен

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false; // Используем более читаемое название переменной

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: () {
        setState(() {
          isChecked = !isChecked; 
        });
      },
      child: Container(
        width: 24, 
        height: 24, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), 
          border: Border.all(
            color: AppColors().secondary100,
            width: 1.5,
          ),
        ),
        child: isChecked
            ? Center(
                child: Icon(
                  Icons.check,
                  color: AppColors().secondary100,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ) 
            : null,
      ),
    );
  }
}
