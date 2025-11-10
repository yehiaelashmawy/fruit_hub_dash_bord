import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/services/supabase_storage_service.dart';
import 'package:fruit_hub_dash_bord/features/dash_bord/presentation/views/dash_bord_view.dart';
import 'core/helper/on_generate_routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.initSupabase();
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
