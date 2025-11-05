import 'package:flutter/material.dart';

import '../../features/dash_bord/views/dash_bord_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashBordView.routeName:
      return MaterialPageRoute(builder: (context) => const DashBordView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
