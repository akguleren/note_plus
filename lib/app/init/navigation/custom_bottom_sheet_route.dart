import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomRouteBottomSheet extends CustomRoute<dynamic> {
  CustomRouteBottomSheet({
    required super.page,
    super.path,
    this.isScrollControlled,
    this.useSafeArea,
    this.isDismissible,
    this.enableDrag,
  }) : super(
          customRouteBuilder: <T>(BuildContext context, Widget child, AutoRoutePage<T> page) => modalSheetBuilder<T>(
            context: context,
            child: child,
            page: page,
            isScrollControlled: isScrollControlled,
            useSafeArea: useSafeArea,
            isDismissible: isDismissible,
            enableDrag: enableDrag,
          ),
        );
  final bool? isScrollControlled;
  final bool? useSafeArea;
  final bool? isDismissible;
  final bool? enableDrag;

  static Route<T> modalSheetBuilder<T>({
    required BuildContext context,
    required Widget child,
    RouteSettings? page,
    bool? isScrollControlled,
    bool? useSafeArea,
    bool? isDismissible,
    bool? enableDrag,
  }) {
    return ModalBottomSheetRoute(
      settings: page,
      builder: (context) => child,
      isScrollControlled: isScrollControlled ?? true,
      backgroundColor: Colors.transparent,
      useSafeArea: useSafeArea ?? false,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
    );
  }
}
