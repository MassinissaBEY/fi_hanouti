part of 'discount_bloc.dart';

abstract class DiscountState {}

class DiscountInitial extends DiscountState {}

class DiscountLoaded extends DiscountState {
  final String discountType;

  DiscountLoaded(this.discountType);
}