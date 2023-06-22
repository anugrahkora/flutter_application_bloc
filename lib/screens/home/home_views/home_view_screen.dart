import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/screens/cart/cart_views/cart_view_screen.dart';
import 'package:flutter_application_bloc/screens/wishlist/wishlist_views/wishlist_view_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToCartActionPageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartViewScreen(),
              ));
        } else if (state is NavigateToWishlistPageActionState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishlistViewScreen(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeInitialState:
            return initialState();
          case HomeLoadingState:
            return loadingState();
          case HomeLoadedState:
            final stateData = state as HomeLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(NavigateToWishListPageEvent());
                      },
                      icon: const Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(NavigateToCartPageEvent());
                      },
                      icon: const Icon(Icons.shopping_bag)),
                ],
              ),
              body: ListView.builder(
                itemCount: stateData.groceryItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(stateData.groceryItems[index].id.toString()),
                    title: Text(stateData.groceryItems[index].name.toString()),
                  );
                },
              ),
            );
          case HomeErrorState:
            return errorState();
          default:
            return initialState();
        }
      },
    );
  }

  Scaffold initialState() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery App'),
        actions: [
          IconButton(
              onPressed: () {
                homeBloc.add(NavigateToWishListPageEvent());
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                homeBloc.add(NavigateToCartPageEvent());
              },
              icon: const Icon(Icons.shopping_bag)),
        ],
      ),
    );
  }

  Scaffold loadingState() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery App'),
        actions: [
          IconButton(
              onPressed: () {
                homeBloc.add(NavigateToWishListPageEvent());
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                homeBloc.add(NavigateToCartPageEvent());
              },
              icon: const Icon(Icons.shopping_bag)),
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Scaffold errorState() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery App'),
        actions: [
          IconButton(
              onPressed: () {
                homeBloc.add(NavigateToWishListPageEvent());
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                homeBloc.add(NavigateToCartPageEvent());
              },
              icon: const Icon(Icons.shopping_bag)),
        ],
      ),
      body: const Center(
        child: Text('Error Occured'),
      ),
    );
  }
}
