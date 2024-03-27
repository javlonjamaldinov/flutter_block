import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_state.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state.cartItems.isEmpty) {
          return const Center(
            child: Text('Your cart is empty!'),
          );
        } else {
          return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.cartItems[index].name),
                  subtitle: Text('\$${state.cartItems[index].prise}'),
                  trailing: IconButton(
                    onPressed: () {
                      final cartBloc = BlocProvider.of<CartBloc>(context);
                      cartBloc.add(
                        RemoveFromcart(
                          state.cartItems[index],
                        ),
                      );
                    },
                    icon: const Icon(Icons.remove_shopping_cart_outlined),
                  ),
                );
              });
        }
      }),
      floatingActionButton: Container(
        height: 50,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            // Ваша функция здесь
          },
          child: const Icon(Icons.check_outlined),
        ),
      ),
    );
  }
}
