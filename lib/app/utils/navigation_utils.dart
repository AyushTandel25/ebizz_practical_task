import '/../app/utils/fade_routes.dart';
import 'package:flutter/material.dart';

/// The [RouteType] determines what [PageRoute] is used for the new route.
///
/// This determines the transition animation for the new route.
enum RouteType {
  defaultRoute,
  fade,
  slideIn,
}

/// A convenience class to wrap [Navigator] functionality.
///
/// Since a [GlobalKey] is used for the [Navigator], the [BuildContext] is not
/// necessary when changing the current route.
class NavigationUtilities {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// A convenience method to push a new [MaterialPageRoute] to the [Navigator].
  static void push(Widget widget, {String? name, Function(dynamic)? onBack}) {
    key.currentState!
        .push(
      FadeRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: name),
      ),
    )
        .then(
      (value) {
        if (onBack != null) {
          onBack(value);
        }
      },
    );
  }

  static void pushRemoveUntil(Widget widget, {String? name}) {
    key.currentState!.pushAndRemoveUntil(
      FadeRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void pushReplace(Widget widget, {String? name}) {
    key.currentState!.pushReplacement(
      FadeRoute(
        builder: (context) => widget,
      ),
    );
  }

  /// A convenience method to push a new [route] to the [Navigator].
  static Future<dynamic> pushRoute(Widget widget,
      {RouteType type = RouteType.fade,
      Map? args,
      Function(dynamic)? onBack}) async {
    args ??= <String, dynamic>{};
    args["routeType"] = type;
    return await key.currentState!
        .pushAndRemoveUntil(
      FadeRoute(builder: (context) => widget),
      (route) => false,
    )
        .then(
      (value) {
        if (onBack != null) {
          onBack(value);
        }
      },
    );
  }

  /// A convenience method to push a new [route] to the [Navigator].
  static Future<dynamic> pushRouteUntil(String route,
      {RouteType type = RouteType.fade,
      Map? args,
      Function(dynamic)? onBack}) async {
    args ??= <String, dynamic>{};
    args["routeType"] = type;
    return await key.currentState!.pushNamed(route, arguments: args).then(
      (value) {
        if (onBack != null) {
          onBack(value);
        }
      },
    );
  }

  /// A convenience method to push a named replacement route.
  static void pushReplacementNamed(String route,
      {RouteType type = RouteType.fade, Map? args}) {
    args ??= <String, dynamic>{};
    args["routeType"] = type;

    key.currentState!.pushReplacementNamed(
      route,
      arguments: args,
    );
  }

  static void pushRemoveUntilName(Widget widget,
      {String? name, String? routeNameUntilRemoved}) {
    key.currentState!.pushAndRemoveUntil(
      FadeRoute(
        builder: (context) => widget,
        settings: RouteSettings(name: name),
      ),
      (Route<dynamic> route) => (routeNameUntilRemoved == null
          ? false
          : (route.settings.name == routeNameUntilRemoved)),
    );
  }

  static void pushReplacementNamedUntil(String route,
      {RouteType type = RouteType.fade, Map? args}) {
    args ??= <String, dynamic>{};
    args["routeType"] = type;

    key.currentState!.pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }

  /// Returns a [RoutePredicate] similar to [ModalRoute.withName] except it
  /// compares a list of route names.
  ///
  /// Can be used in combination with [Navigator.pushNamedAndRemoveUntil] to
  /// pop until a route has one of the name in [names].
  static RoutePredicate namePredicate(List<String> names) {
    return (route) =>
        !route.willHandlePopInternally &&
        route is ModalRoute &&
        (names.contains(route.settings.name));
  }
}

/// [onGenerateRoute] is called whenever a new named route is being pushed to
/// the app.
///
/// The [RouteSettings.arguments] that can be passed along the named route
/// needs to be a `Map<String, dynamic>` and can be used to pass along
/// arguments for the screen.
Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  final arguments = settings.arguments as Map<String, dynamic>;
  final routeType = arguments["routeType"] as RouteType;

  Widget screen = Container();

  switch (routeName) {
    // case SignIn.route:
    //   screen = SignIn();
    //   break;
  }
  switch (routeType) {
    case RouteType.fade:
      return FadeRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      );
    case RouteType.defaultRoute:
    default:
      return MaterialPageRoute(
        builder: (_) => screen,
        settings: RouteSettings(name: routeName),
      );
  }
}
