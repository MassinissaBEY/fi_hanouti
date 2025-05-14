import 'package:fi_hanouti/features/bloc/discount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DiscountInfoPage extends StatelessWidget {
  const DiscountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Information'),
      ),
      body: BlocBuilder<DiscountBloc, DiscountState>(
        builder: (context, state) {
          if (state is DiscountLoaded) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _getDiscountInfo(state.discountType),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  String _getDiscountInfo(String discountType) {
    switch (discountType) {
      case 'Regular Discounts':
        return 'Information about regular discounts...';
      case 'Loyalty Discounts':
        return 'Information about loyalty discounts...';
      case 'Bonus Discounts':
        return 'Information about bonus discounts...';
      default:
        return 'No information available';
    }
  }
}