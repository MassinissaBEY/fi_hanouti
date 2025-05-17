import 'package:flutter/material.dart';

class DiscountInfoPage extends StatelessWidget {
  const DiscountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

    final String discountType =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(title: const Text('Discount Information')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            _getDiscountInfo(discountType),
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
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
        return 'No information available.';
    }
  }
}
