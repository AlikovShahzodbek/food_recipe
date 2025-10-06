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
          isChecked = !isChecked; // Меняем состояние при клике
        });
      },
      child: Container(
        width: 24, // Увеличиваем размер для удобства
        height: 24, // Также увеличиваем высоту
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), // Скругление углов
          border: Border.all(
            color: AppColors().secondary100, // Цвет рамки
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
              ) // Показываем галочку
            : null,
      ),
    );
  }
}
