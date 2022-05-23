import 'transition.dart';
import 'widget_args_builder.dart';

class BasisRouteBuilder {
  final TransitionType? transitionType;
  final WidgetArgsBuilder widgetBuilderArgs;
  final Duration duration;

  const BasisRouteBuilder(
    this.widgetBuilderArgs, {
    this.transitionType,
    this.duration = const Duration(milliseconds: 300),
  });
}