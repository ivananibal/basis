import 'package:flutter/material.dart';

import 'basis_route_builder.dart';
import 'transition.dart';

abstract class Routing {

  String get initialRoute => '/';
  Map<String, BasisRouteBuilder> get basisRoutes;
  Duration get _d => const Duration(milliseconds: 300);

  Widget _transitionBuilder(
    BuildContext context, 
    Animation<double> anim, 
    Animation<double> secondAnim, 
    child, {
      TransitionType transitionType,
    }
  ) {

    if (transitionType == TransitionType.upToDown) {
      return upToDown(anim, child);
    } else if (transitionType == TransitionType.downToUp) {
      return downToUp(anim, child);
    } else if (transitionType == TransitionType.leftToRight) {
      return leftToRight(anim, child);
    } else if (transitionType == TransitionType.rightToLeft) {
      return rightToLeft(anim, child);
    } else if (transitionType == TransitionType.leftToRightFaded) {
      return leftToRightFaded(anim, child);
    } else if (transitionType == TransitionType.rightToLeftFaded) {
      return rightToLeftFaded(anim, child);
    } else if (transitionType == TransitionType.rotate) {
      return rotate(anim, child);
    } else if (transitionType == TransitionType.scale) {
      return scale(anim, child);
    } else if (transitionType == TransitionType.scaleElasticIn) {
      return scaleElasticIn(anim, child);
    } else if (transitionType == TransitionType.scaleElasticInOut) {
      return scaleElasticInOut(anim, child);
    } else if (transitionType == TransitionType.size) {
      return size(anim, child);
    } else if (transitionType == TransitionType.fadeIn) {
      return fadeIn(anim, child);
    } else if (transitionType == TransitionType.noTransition) {
      return child;
    } else {
      return leftToRight(anim, child);
    }
  }

  Route onGenerateRoute(RouteSettings routerSettings) {
    var routerName = routerSettings.name;
    var routerArgs = routerSettings.arguments;

    var navigateTo = basisRoutes[routerName]?.widgetBuilderArgs;
    
    var transitionType = basisRoutes[routerName]?.transitionType;
    var duration = basisRoutes[routerName]?.duration;

    if (navigateTo == null) return null;

    return PageRouteBuilder(
      pageBuilder: (context, anim, secondAnim) {
        return navigateTo(context, routerArgs);
      },
      transitionDuration: duration ?? _d,
      reverseTransitionDuration: duration ?? _d,
      transitionsBuilder: (context, anim, secondAnim, child) {
        return _transitionBuilder(
          context, 
          anim, 
          secondAnim, 
          child, 
          transitionType: transitionType ?? TransitionType.leftToRight,
        );
      } 
    );
  }
}