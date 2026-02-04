import '../models/models.dart';
import 'entities.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  double price;
  double discount;
  List<Macros> macros;

  PizzaEntity(
      {required this.pizzaId,
      required this.picture,
      required this.isVeg,
      required this.spicy,
      required this.name,
      required this.description,
      required this.price,
      required this.discount,
      required this.macros});

  Map<String, Object> toDocument() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros.map((macro) => macro.toEntity().toDocument()).toList(),
    };
  }

  static PizzaEntity fromDocument(Map<String, Object?> doc) {
    return PizzaEntity(
      pizzaId: doc['pizzaId'] as String,
      picture: doc['picture'] as String,
      isVeg: doc['isVeg'] as bool,
      spicy: doc['spicy'] as int,
      name: doc['name'] as String,
      description: doc['description'] as String,
      price: doc['price'] as double,
      discount: doc['discount'] as double,
      macros: (doc['macros']! as List<dynamic>).map((e) => Macros.fromEntity(MacrosEntity.fromDocument(e as Map<String, dynamic>))).toList(),
    );
  }
}
