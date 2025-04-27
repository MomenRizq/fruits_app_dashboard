import 'package:flutter/material.dart';


import '../../../../core/widgets/custom_button.dart';
 
 class DashboardViewBody extends StatelessWidget {
   const DashboardViewBody({super.key});
 
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           CustomButton(
             onPressed: () {},
             text: 'Add Data',
           ),
         ],
       ),
     );
   }
 }