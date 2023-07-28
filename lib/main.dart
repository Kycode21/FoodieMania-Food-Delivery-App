import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app_ui/screens/introduction_screen.dart';
import 'package:provider/provider.dart';

import 'Provider/cart_screen_provider.dart';
import 'Provider/contact_screen_provider.dart';
import 'Provider/payment_screen_provider.dart';
import 'Provider/popular_items_provider.dart';
import 'Provider/restaurant_screen_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = '{publishable-key}';

  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ContactProvider()),
        ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => PopularItemsProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FoodieMania: Food Delivery App',
        theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.red,
        ),
        home: const IntroductionScreen(),
      ),
    );
  }
}
