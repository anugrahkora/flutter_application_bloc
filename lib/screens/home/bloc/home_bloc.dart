import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<WishlistButtonPressedEvent>(wishlistButtonPressedEvent);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
    on<NavigateToWishListPageEvent>(navigateToWishListEvent);
    on<NavigateToCartPageEvent>(navigateToCartPageState);
  }

  FutureOr<void> wishlistButtonPressedEvent(
      WishlistButtonPressedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('wishlisted');
    }
  }

  FutureOr<void> cartButtonClickedEvent(
      CartButtonClickedEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('added to cart');
    }
  }

  FutureOr<void> navigateToWishListEvent(
      NavigateToWishListPageEvent event, Emitter<HomeState> emit) {
    if (kDebugMode) {
      print('Navigated to wishlist');
    }
  }

  FutureOr<void> navigateToCartPageState(
      NavigateToCartPageEvent event, Emitter<HomeState> emit) {
        if (kDebugMode) {
      print('Navigated to cart');
    }
      }
}
