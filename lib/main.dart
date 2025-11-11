import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash_bord/core/services/custom_bloc_observer.dart';
import 'package:fruit_hub_dash_bord/core/services/get_it_service.dart';
import 'package:fruit_hub_dash_bord/core/services/supabase_storage_service.dart';
import 'package:fruit_hub_dash_bord/features/dash_bord/presentation/views/dash_bord_view.dart';
import 'package:fruit_hub_dash_bord/firebase_options.dart';
import 'core/helper/on_generate_routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseStorageService.initSupabase();
  // await SupabaseStorageService.createBucket('fruits_images');
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetit();
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
