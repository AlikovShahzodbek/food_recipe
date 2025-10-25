import 'package:uuid/uuid.dart';

class IngradientModel {
  IngradientModel({this.ingradient = '', this.quantity = '', String? id})
    : id = id ?? const Uuid().v4();

  String ingradient;
  String quantity;
  String id;
}
