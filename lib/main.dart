import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/features/dash_bord/presentation/views/dash_bord_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/helper/on_generate_routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xqaueennbjwdnisktenl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhxYXVlZW5uYmp3ZG5pc2t0ZW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI3OTk2NjgsImV4cCI6MjA3ODM3NTY2OH0.BFjEGb9LQEBqUOs6GaUxfDG9nvW58BbBeQ00ttK2tDE',
  );
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
