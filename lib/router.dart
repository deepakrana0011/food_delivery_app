import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/auth/forgot_password.dart';
import 'package:food_delivery_app/view/auth/login.dart';
import 'package:food_delivery_app/view/auth/sign_up.dart';
import 'package:food_delivery_app/view/checkout/checkout.dart';
import 'package:food_delivery_app/view/dashboard/home_page.dart';
import 'package:food_delivery_app/view/onboarding/onboardingview.dart';
import 'package:food_delivery_app/view/profile/profile.dart';
import 'package:food_delivery_app/view/summary/summary.dart';

import 'constants/route_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesConstants.login:
        return MaterialPageRoute(
            builder: (_) => Login(), settings: settings);


      case RoutesConstants.signup:
        return MaterialPageRoute(
            builder: (_) => SignUp(), settings: settings);


      case RoutesConstants.onboarding:
        return MaterialPageRoute(
            builder: (_) => OnboardingScreen(), settings: settings);

      case RoutesConstants.home_page:
        return MaterialPageRoute(
            builder: (_) => HomePage(), settings: settings);



      case RoutesConstants.profile:
        return MaterialPageRoute(
            builder: (_) => Profile(), settings: settings);

      case RoutesConstants.forgot:
        return MaterialPageRoute(
            builder: (_) => ForgotPassword(), settings: settings);


      case RoutesConstants.checkout:
        return MaterialPageRoute(
            builder: (_) => Checkout(), settings: settings);



      case RoutesConstants.summary:
        return MaterialPageRoute(
            builder: (_) => Summary(), settings: settings);







      default:
      //return MaterialPageRoute(builder: (_) =>  Testing());
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));

    }
  }
}