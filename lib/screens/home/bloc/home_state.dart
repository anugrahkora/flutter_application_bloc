part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<GroceryModel> groceryItems;

  const HomeLoadedState({required this.groceryItems});
}

class HomeErrorState extends HomeState {}

abstract class HomeActionState extends HomeState {}

class NavigateToWishlistPageActionState extends HomeActionState {}

class NavigateToCartActionPageState extends HomeActionState {}
