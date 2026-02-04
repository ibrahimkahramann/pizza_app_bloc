import '../entities/entities.dart';

class Macros {
  int calories;
  int protein;
  int carbs;
  int fats;

  Macros(
      {required this.calories,
      required this.protein,
      required this.carbs,
      required this.fats});

  MacrosEntity toEntity() {
    return MacrosEntity(
        calories: calories, protein: protein, carbs: carbs, fats: fats);
  }

  static Macros fromEntity(MacrosEntity entity) {
    return Macros(
        calories: entity.calories,
        protein: entity.protein,
        carbs: entity.carbs,
        fats: entity.fats);
  }
}
