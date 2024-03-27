import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:flutter_block/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:flutter_block/model/product.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(
          CartState(
            [],
          ),
        ) {
    on<CartEvent>(_mapEventToState);
  }
  Future<void> _mapEventToState(
      CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCart) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..add(event.product);
      emit(
        CartState(updatedCart),
      );
    } else if (event is RemoveFromcart) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..remove(event.product);
      emit(
        CartState(updatedCart),
      );
    }
  }
}
