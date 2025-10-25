import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';

class IngradientCard extends StatelessWidget {
  const IngradientCard({
    super.key,
    required this.ingradients,
    required this.measures,
  });
  final String ingradients;
  final String measures;

  @override
  Widget build(BuildContext context) {
    final cardDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppColors().black.withAlpha(30),
          offset: Offset(0, 5),
          blurRadius: 2,
          spreadRadius: 1,
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: cardDecoration,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(ingradients, maxLines: 1),
              SizedBox(width: 30),
              Flexible(
                child: AutoSizeText(
                  measures,
                  style: TextStyle(color: AppColors().grey3),
                  textAlign: TextAlign.right,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
