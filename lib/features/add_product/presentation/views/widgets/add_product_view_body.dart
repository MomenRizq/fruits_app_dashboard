import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_app_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_app_dashboard/features/add_product/domain/entities/add_product_entity_input.dart';
import 'package:fruits_app_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

import '../../cubit/cubit/add_product_cubit.dart';
import 'is_featured_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description;
  late num price;
  File? image;
  bool isFeatured = false;
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
                 onSaved: (value) {
                  name = value!;
                },
                 hintText: 'Product Name',
                 textInputType: TextInputType.text,
               ),
            
               CustomTextFormField(
                onSaved: (value) {
                  price = num.tryParse(value!) ?? 0;
                },
                 hintText: 'Product Price',
                 textInputType: TextInputType.number  ,
               ),
              
               CustomTextFormField(
                 onSaved: (value) {
                   code = value!.toLowerCase();
                 },
                 hintText: 'Product Code',
                 textInputType: TextInputType.text ,
               ), 
            
               CustomTextFormField(
                  onSaved: (value) {
                    description = value!;
                  },
                 hintText: 'Product Description',
                 textInputType: TextInputType.text,
                 maxLines: 5,
               ),
               SizedBox(
                  height: 16,
                ),
            
               IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                  },
              ),
              const SizedBox(
                height: 16,
              ),
               ImageField(onFileChanged: (image) {
                  this.image = image;
               },),
                SizedBox(
                  height: 16,
                ),
                const SizedBox(
                height: 24,
              ),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                      );
                       context.read<AddProductCubit>().addProduct(input);
                      
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              const SizedBox(
                height: 24,
              ),
                 

             ],
           ),
         ),
       ),
     );
  }
}


void showError(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Please select an image'),
    ),
  );
}