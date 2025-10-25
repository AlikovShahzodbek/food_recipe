import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/Theme/text_filed_theme.dart';
import 'package:practick_project/models/add_recipe_page/ingradient_model.dart';

class IngradientRow extends StatefulWidget {
  const IngradientRow({
    super.key,
    required this.ingradient,
    required this.onDelete,
    required this.onIngradientChanged,
    required this.onQuantityChanged,
  });

  final IngradientModel ingradient;
  final VoidCallback onDelete;
  final ValueChanged<String> onIngradientChanged;
  final ValueChanged<String> onQuantityChanged;

  @override
  State<IngradientRow> createState() => _IngradientRowState();
}

class _IngradientRowState extends State<IngradientRow> {
  late final TextEditingController _ingradientController;
  late final TextEditingController _quantityController;

  @override
  void initState() {
    _ingradientController = TextEditingController(
      text: widget.ingradient.ingradient,
    );
    _quantityController = TextEditingController(
      text: widget.ingradient.quantity,
    );

    _ingradientController.addListener(() {
      widget.onIngradientChanged(_ingradientController.text);
    });
    _quantityController.addListener(() {
      widget.onQuantityChanged(_quantityController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _ingradientController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            controller: _ingradientController,
            onChanged: widget.onIngradientChanged,
            decoration: TextFiledTheme().textFiledTheme.copyWith(
              hintText: "Ingradient",
              hintStyle: TextStyle(color: AppColors().grey3),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _quantityController,
            onChanged: widget.onQuantityChanged,
            decoration: TextFiledTheme().textFiledTheme.copyWith(
              hintText: "Qty.",
              hintStyle: TextStyle(color: AppColors().grey3),
            ),
          ),
        ),
        SizedBox(width: 5),
        InkWell(
          onTap: widget.onDelete,
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.delete_sweep_outlined,
              size: 30,
              color: AppColors().grey3,
            ),
          ),
        ),
      ],
    );
  }
}
