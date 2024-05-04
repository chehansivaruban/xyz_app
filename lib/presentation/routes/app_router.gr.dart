// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:xyz_app/presentation/authentication/login_page.dart' as _i4;
import 'package:xyz_app/presentation/chat/chat_page.dart' as _i1;
import 'package:xyz_app/presentation/explore/explore_page.dart' as _i2;
import 'package:xyz_app/presentation/home/home_page.dart' as _i3;
import 'package:xyz_app/presentation/navbar/navbar_page.dart' as _i5;
import 'package:xyz_app/presentation/profile/profile_page.dart' as _i6;
import 'package:xyz_app/presentation/purchases/purchases_page.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ChatRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChatPage(),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExplorePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    NavBarRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NavBarPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    PurchasesRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PurchasesPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i8.PageRouteInfo<void> {
  const ChatRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExplorePage]
class ExploreRoute extends _i8.PageRouteInfo<void> {
  const ExploreRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NavBarPage]
class NavBarRoute extends _i8.PageRouteInfo<void> {
  const NavBarRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavBarRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PurchasesPage]
class PurchasesRoute extends _i8.PageRouteInfo<void> {
  const PurchasesRoute({List<_i8.PageRouteInfo>? children})
      : super(
          PurchasesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PurchasesRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
