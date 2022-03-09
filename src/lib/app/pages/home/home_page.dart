import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/interfaces/product_image_repository_interface.dart';
import '../../core/interfaces/product_repository_interface.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc_event.dart';
import 'bloc/home_bloc_state.dart';
import 'widgets/home_products_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String router = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: const _HomePage(),
      create: (context) => HomeBloc(
        context.read<IProductRepository>(),
        context.read<IProductImageRepository>(),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coodesh Challenge'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
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
