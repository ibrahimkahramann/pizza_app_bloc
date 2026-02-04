class MacrosEntity {
  int calories;
  int protein;
  int carbs;
  int fats;

  MacrosEntity(
      {required this.calories,
      required this.protein,
      required this.carbs,
      required this.fats});

  Map<String, Object> toDocument() {
    return {
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fats': fats,
    };
  }

  static MacrosEntity fromDocument(Map<String, dynamic> doc) {
    return MacrosEntity(
        calories: doc['calories'] as int? ?? 0,
        protein: doc['protein'] as int? ?? 0,
        carbs: doc['carbs'] as int? ?? 0,
        fats: doc['fats'] as int? ?? 0);
  }
}
