import 'package:flutter/material.dart';
import 'package:train_tracking/core/navigators/route_names.dart';
import 'package:train_tracking/features/auth/presentation/pages/auth_state.dart';
import 'package:train_tracking/features/auth/presentation/pages/login_screen.dart';
import 'package:train_tracking/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:train_tracking/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:train_tracking/features/checkout/presentation/pages/checkout_screen.dart';
import 'package:train_tracking/features/home/presentation/pages/home_nav.dart';
import 'package:train_tracking/features/home/presentation/pages/home_screen.dart';
import 'package:train_tracking/features/search/presentation/pages/search_screen.dart';
import 'package:train_tracking/features/tickets/presentation/my_tickets_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.login:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const LoginScreen(),
        );
    case Routes.signup:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SignUpScreen(),
      );
    case Routes.homeNav:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeNav(),
      );
    case Routes.home:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeScreen(),
      );
    case Routes.search:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SearchScreen(),
      );
    case Routes.onBoarding:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const OnBoardingScreen(),
      );
    case Routes.myTickets:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const MyTicketScreen(),
      );
    case Routes.authWrapper:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AuthValidation(),
      );

    default:
      return MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute<void>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow!,
  );
}
