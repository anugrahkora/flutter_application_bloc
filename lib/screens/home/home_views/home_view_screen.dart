import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // listenWhen: (previous, current) {

      // },
      // buildWhen: (previous, current) {

      // },
      listener: (context, state) {},
      builder: (context, state) {
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
      },
    );
  }
}
