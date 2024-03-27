import 'package:equatable/equatable.dart';
import 'package:flutter_block/model/product.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;
  AddToCart(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveFromcart extends CartEvent {
  final Product product;
  RemoveFromcart(this.product);
  @override
  List<Object> get props => [product];
}
