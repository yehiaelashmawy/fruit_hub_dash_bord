import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/dash_bord/presentation/views/dash_bord_view.dart';
import 'core/helper/on_generate_routs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DashBordView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
