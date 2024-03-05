import 'package:pizza_repository/src/entities/pizza_entity.dart';
import 'package:pizza_repository/src/models/marco.dart';

class Pizza{
  String pizzaId;
  String picture;
  bool isVeg;
  int spyci;
  String name;
  String description;
  int price;
  int discount;
Marco marco;
  Pizza({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spyci,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.marco}
  ); 
  PizzaEntity toEntity(){
    return PizzaEntity(
      pizzaId:pizzaId,
      picture: picture,
      isVeg: isVeg,
      spyci: spyci,
      name: name,
      description: description,
      price: price,
      discount: discount,
      marco: marco
    );
  }

  static Pizza fromtEntity(PizzaEntity entity){
    return Pizza(
      pizzaId: entity.pizzaId, 
      picture: entity.picture, 
      isVeg: entity.isVeg, 
      spyci: entity.spyci, 
      name: entity.name, 
      description: entity.description, 
      price: entity.price, 
      discount: entity.discount, 
      marco: entity.marco);
  }

}