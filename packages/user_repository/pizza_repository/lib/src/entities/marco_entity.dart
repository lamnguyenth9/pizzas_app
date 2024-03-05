class MarcoEnity{
  int calories;
  int proteins;
  int fat;
  int carbs;
  MarcoEnity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs
  });
  Map<String,Object?> toDocument(){
    return{
      'calories': calories,
      'protein': proteins,
      'fat': fat,
      'carbs': carbs
    };
  }

  static MarcoEnity fromDocument(Map<String, dynamic> doc){
    return MarcoEnity(
      calories: doc['calories'], 
      proteins: doc['proteins'], 
      fat: doc['fat'], 
      carbs: doc['carbs']
    );
  }
}