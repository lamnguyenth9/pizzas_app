import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'get_pizza_event.dart';
part 'get_pizza_state.dart';

class GetPizzaBloc extends Bloc<GetPizzaEvent, GetPizzaState> {
 PizzaRepo _pizzaRepo;
  GetPizzaBloc(this._pizzaRepo) : super(GetPizzaInitial()) {
    on<GetPizza>((event, emit) async{
      emit(GetPizzaProcess());
      try{
        print("hi");
         List<Pizza> pizzas = await _pizzaRepo.getPizzas();
         print("hi");
         emit(GetPizzaSuccees(pizzas));
      }catch(e){
        emit(GetPizzaFailure());
      }
    });
  }
}
