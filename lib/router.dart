import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/auth/forgot_password.dart';
import 'package:food_delivery_app/view/auth/login.dart';
import 'package:food_delivery_app/view/auth/sign_up.dart';
import 'package:food_delivery_app/view/cart/my_cart.dart';
import 'package:food_delivery_app/view/checkout/checkout.dart';
import 'package:food_delivery_app/view/dashboard/dashboard.dart';
import 'package:food_delivery_app/view/home_page/home_page.dart';
import 'package:food_delivery_app/view/maps/address_search.dart';
import 'package:food_delivery_app/view/maps/map.dart';
import 'package:food_delivery_app/view/products/products.dart';
import 'package:food_delivery_app/view/profile/profile.dart';
import 'package:food_delivery_app/view/restaurant_details/restaurant_details.dart';
import 'package:food_delivery_app/view/summary/summary.dart';
import 'package:food_delivery_app/view/wishlist/wishlist.dart';

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

      case RoutesConstants.cart:
        return MaterialPageRoute(
            builder: (_) => MyCart(), settings: settings);



      case RoutesConstants.restaurant_details:
        return MaterialPageRoute(
            builder: (_) => RestaurantDetails(), settings: settings);


      case RoutesConstants.maps:
        return MaterialPageRoute(
            builder: (_) => Maps(), settings: settings);


      case RoutesConstants.autoComplete:
        return MaterialPageRoute(
            builder: (_) => CustomSearchScaffold(), settings: settings);

      case RoutesConstants.wishlist:
        return MaterialPageRoute(
            builder: (_) => WishList(), settings: settings);

      case RoutesConstants.dashboard:
        return MaterialPageRoute(
            builder: (_) => DashBoard(), settings: settings);

      case RoutesConstants.products:
        return MaterialPageRoute(
            builder: (_) => Products(), settings: settings);






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