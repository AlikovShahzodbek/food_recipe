import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';

class AddNewIngradientButton extends StatelessWidget {
  const AddNewIngradientButton({super.key, required this.ontap});

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: Row(
          children: [
            Icon(Icons.add_circle_outline, color: AppColors().primary100),
            SizedBox(width: 15),
            Text(
              "Add New Ingradient",
              style: TextStyle(
                color: AppColors().primary100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
