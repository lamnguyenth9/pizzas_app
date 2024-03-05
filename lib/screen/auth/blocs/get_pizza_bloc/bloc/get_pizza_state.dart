part of 'get_pizza_bloc.dart';


sealed class GetPizzaState extends Equatable {
  const GetPizzaState();
  
  @override
  List<Object> get props => [];
}

final class GetPizzaInitial extends GetPizzaState {}

class GetPizzaProcess extends GetPizzaState {}

class GetPizzaSuccees extends GetPizzaState {
  final List<Pizza> pizza;
  GetPizzaSuccees(this.pizza);
  @override
  List<Object> get props => [pizza];

}

class GetPizzaFailure extends GetPizzaState {}
