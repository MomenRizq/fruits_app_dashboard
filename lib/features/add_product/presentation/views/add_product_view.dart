import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_app_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';
import 'package:fruits_app_dashboard/features/add_product/presentation/views/widgets/add_products_view_body_blocBuilder.dart';

import '../../../../core/repos/products_repo/products_repo.dart';
import '../../../../core/services/get_it_services.dart';
import '../../../../core/widgets/build_app_bar.dart';
import '../cubit/cubit/add_product_cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Add Product',
      ),
      body: BlocProvider(
        create:  (context) => AddProductCubit(
          getIt.get<ImagesRepo>(),
          getIt.get<ProductsRepo>(),
        ),
        child: const AddProductsViewBodyBlocBuilder(),
      ),
    );
  }
}
