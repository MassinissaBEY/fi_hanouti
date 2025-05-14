part of 'discount_bloc.dart';

abstract class DiscountEvent {}

class LoadDiscountInfo extends DiscountEvent {
  final String discountType;

  LoadDiscountInfo(this.discountType);
}