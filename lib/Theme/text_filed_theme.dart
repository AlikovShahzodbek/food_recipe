import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';

class TextFiledTheme {

final textFiledTheme = InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  isCollapsed: true,
  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: AppColors().primary80, width: 2),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: AppColors().grey3),
  ),
);

}