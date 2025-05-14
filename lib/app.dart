import 'package:fi_hanouti/features/bloc/discount_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/discounts/presentation/pages/discount_main_page.dart';
import 'features/discounts/presentation/pages/discount_info_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscountBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Discount App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          '/': (context) => const DiscountMainPage(),
          '/discount-info': (context) => const DiscountInfoPage(),
        },
      ),
    );
  }
}
