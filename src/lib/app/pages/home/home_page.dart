import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_bloc_event.dart';
import 'bloc/home_bloc_state.dart';
import 'widgets/home_header.dart';
import 'widgets/home_products_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const HomeHeader(),
              const SizedBox(height: 48.0),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeBlocState>(
                  bloc: context.read<HomeBloc>(),
                  builder: (context, state) {
                    if (state is HomeInitialState) {
                      context.read<HomeBloc>().add(GetProductsEvent());
                      return Container();
                    } else if (state is HomeProductsLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeProductsLoadedState) {
                      return HomeProductsList(products: state.products);
                    } else {
                      return Center(
                        child: Text((state as HomeProductsErrorState).message),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
