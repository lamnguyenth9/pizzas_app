import 'package:pizza_repository/src/entities/marco_entity.dart';
import 'package:pizza_repository/src/models/marco.dart';


class PizzaEntity{
  String pizzaId;
  String picture;
  bool isVeg;
  int spyci;
  String name;
  String description;
  int price;
  int discount;
  Marco marco;
  PizzaEntity({
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
  Map<String,Object?> toDocument(){
    return{
      'pizzaId': pizzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spyci': spyci,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'marco': marco.toEntity().toDocument()
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc){
    return PizzaEntity(
      pizzaId: doc['pizzaId'], 
      picture:doc['picture'], 
      isVeg: doc['isVeg'], 
      spyci: doc['spyci'], 
      name: doc['name'], 
      description: doc['description'], 
      price: doc['price'], 
      discount: doc['discount'], 
      marco: Marco.fromtEntity(MarcoEnity.fromDocument(doc['marco'])));
  }
}