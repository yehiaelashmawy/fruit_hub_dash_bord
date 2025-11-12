import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:fruit_hub_dash_bord/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_hub_dash_bord/core/services/get_it_services.dart';
import 'package:fruit_hub_dash_bord/core/services/supabase_storage.dart';
import 'package:fruit_hub_dash_bord/features/dashbord/dashbord_view.dart';

import 'package:fruit_hub_dash_bord/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseStorage.initSupabase();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //await SupabaseStorage.createSupabaseBucket( bucketName: 'fruits_images');

  setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const DashbordView(),
      onGenerateRoute: onGenerateRoutes,
    );
  }
}
