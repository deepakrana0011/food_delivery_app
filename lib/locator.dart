import 'package:food_delivery_app/provider/signup_provider.dart';
import 'package:get_it/get_it.dart';



GetIt locator = GetIt.instance;

void setupLocator() {


  locator.registerFactory(() => SignUpProvider());


}