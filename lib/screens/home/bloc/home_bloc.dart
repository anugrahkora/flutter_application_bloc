import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_bloc/data/grocery_data.dart';

import '../../../models/grocery_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<WishlistButtonPressedEvent>(wishlistButtonPressedEvent);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
    on<NavigateToWishListPageEvent>(navigateToWishListEvent);
    on<NavigateToCartPageEvent>(navigateToCartPageEvent);
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
    // if (kDebugMode) {
    //   print('Navigated to wishlist');
    // }
    emit(NavigateToWishlistPageActionState());
  }

  FutureOr<void> navigateToCartPageEvent(
      NavigateToCartPageEvent event, Emitter<HomeState> emit) {
    // if (kDebugMode) {
    //   print('Navigated to cart');
    // }
    emit(NavigateToCartActionPageState());
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(HomeLoadedState(
        groceryItems: GroceryData.groceryProducts
            .map((e) => GroceryModel(
                id: e['id'],
                name: e['name'],
                price: e['price'],
                quantity: e['quantity'],
                category: e['category']))
            .toList()));
  }
}
