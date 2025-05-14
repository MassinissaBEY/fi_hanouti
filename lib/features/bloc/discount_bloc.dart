import 'package:flutter_bloc/flutter_bloc.dart';
part 'discount_event.dart';
part 'discount_state.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  DiscountBloc() : super(DiscountInitial()) {
    on<LoadDiscountInfo>(_onLoadDiscountInfo);
  }

  void _onLoadDiscountInfo(LoadDiscountInfo event, Emitter<DiscountState> emit) {
    emit(DiscountLoaded(event.discountType));
  }
}