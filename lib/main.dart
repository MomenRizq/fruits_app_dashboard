import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/features/dashboard/views/dashboard_view.dart';

import 'core/helper_function/on_generate_routes.dart';

 void main() {
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