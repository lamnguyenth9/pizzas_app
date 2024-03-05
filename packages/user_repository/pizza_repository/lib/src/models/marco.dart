import 'package:pizza_repository/src/entities/marco_entity.dart';

class Marco{
  int calories;
  int fat;
  int proteins;
  int carbs;

  Marco({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs}
  );
 MarcoEnity toEntity(){
  return MarcoEnity(calories: calories, proteins: proteins, fat: fat, carbs: carbs);
 }
 static Marco fromtEntity(MarcoEnity enity){
  return Marco(
    calories: enity.calories, 
    proteins: enity.proteins, 
    fat: enity.fat, 
    carbs: enity.carbs);
 }
}