import 'package:flutter/material.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_app_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: SingleChildScrollView(
         child: Form(
           key: _formKey,
           autovalidateMode: autovalidateMode,
           child:  Column(
            spacing: 16,
             children: [
               CustomTextFormField(
                 hintText: 'Product Name',
                 textInputType: TextInputType.text,
               ),
            
               CustomTextFormField(
                 hintText: 'Product Price',
                 textInputType: TextInputType.number  ,
               ),
              
               CustomTextFormField(
                 hintText: 'Product Code',
                 textInputType: TextInputType.number,
               ),
            
               CustomTextFormField(
                 hintText: 'Product Description',
                 textInputType: TextInputType.text,
                 maxLines: 5,
               ),
            
               ImageField(onFileChanged: (image) {},),
                SizedBox(
                  height: 16,
                ),

             ],
           ),
         ),
       ),
     );
  }
}