import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:flutter_block/screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CartBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        title: "Ecommerce App",
        initialRoute: '/',
        routes: {
          '/': (context) => const ProductListScreen(),
        },
      ),
    );
  }
}
