part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}
class HomeInitialEvent extends HomeEvent{}

class WishlistButtonPressedEvent extends HomeEvent{}

class CartButtonClickedEvent extends HomeEvent{}

class NavigateToWishListPageEvent extends HomeEvent{}

class NavigateToCartPageEvent extends HomeEvent{}
