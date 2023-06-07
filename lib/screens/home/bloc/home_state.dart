part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}
 
class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {}

abstract class HomeActionState extends HomeState{}

class NavigateToWishlistPageActionState extends HomeActionState{}

class NavigateToCartActionPageState extends HomeActionState{}



