import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/add_recipes_page/add_new_ingradient_button.dart';
import 'package:practick_project/components/main_screen/add_recipes_page/ingradient_row.dart';
import 'package:practick_project/models/add_recipe_page/ingradient_model.dart';

class AddRecipesIngradientList extends StatefulWidget {
  const AddRecipesIngradientList({super.key, required this.onListChanged});
  final Function(List<IngradientModel>) onListChanged;

  @override
  State<AddRecipesIngradientList> createState() =>
      _AddRecipesIngradientListState();
}

class _AddRecipesIngradientListState extends State<AddRecipesIngradientList> {
  final List<IngradientModel> ingradients = [IngradientModel()];

  void addRow() {
    setState(() {
      ingradients.add(IngradientModel());
      widget.onListChanged(ingradients);
    });
  }

  void deleteRow(String id) {
    setState(() {
      ingradients.removeWhere((item) => item.id == id);
      widget.onListChanged(ingradients);
    });
  }

  List<String> getAllIngredients() {
    return ingradients.map((e) => e.ingradient).toList();
  }

  /// Возвращает все заполненные меры
  List<String> getAllMeasures() {
    return ingradients.map((e) => e.quantity).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: ingradients.length,
          itemBuilder: (builder, index) {
            final ingradient = ingradients[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: IngradientRow(
                key: ValueKey(ingradient.id),
                ingradient: ingradient,
                onDelete: () => deleteRow(ingradient.id),
                onIngradientChanged: (value) {
                  ingradient.ingradient = value;
                  widget.onListChanged(ingradients);
                },
                onQuantityChanged: (value) {
                  ingradient.quantity = value;
                  widget.onListChanged(ingradients);
                },
              ),
            );
          },
        ),
        SizedBox(height: 5),
        AddNewIngradientButton(ontap: () => addRow()),
      ],
    );
  }
}
