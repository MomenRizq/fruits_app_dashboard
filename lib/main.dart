import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/services/custom_bloc_observer.dart';
import 'package:fruits_app_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_app_dashboard/firebase_options.dart';
import 'core/helper_function/on_generate_routes.dart';
import 'core/services/get_it_services.dart';


 void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
   runApp(const MainApp());
 }
 
 class MainApp extends StatelessWidget {
   const MainApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return const MaterialApp(
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
     );
   }
 }