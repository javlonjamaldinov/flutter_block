import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:flutter_block/model/product.dart';
import 'package:flutter_block/screens/cart_list_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> productList = [
      Product(id: 1, name: 'Product 1', prise: 10),
      Product(id: 2, name: 'Product 2', prise: 20),
      Product(id: 3, name: 'Product 3', prise: 30),
      Product(id: 4, name: 'Product 4', prise: 40),
      Product(id: 5, name: 'Product 5', prise: 50),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        centerTitle: true,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int count = state.cartItems.length;
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CartListScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                  Positioned(
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minHeight: 15,
                        maxWidth: 15,
                      ),
                      child: Text(
                        '$count',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: ((context, index) {
          final product = productList[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.prise}'),
            trailing: IconButton(
              onPressed: () {
                final cartBloc = context.read<CartBloc>();
                final cartItems = cartBloc.state.cartItems;
                if (cartItems.any((item) => item.id == product.id)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Product Already Added to cart'),
                    duration: Duration(seconds: 2),
                  ));
                } else {
                  cartBloc.add(AddToCart(product));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Product Added to cart'),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              icon: const Icon(Icons.add_shopping_cart_outlined),
            ),
          );
        }),
      ),
    );
  }
}
