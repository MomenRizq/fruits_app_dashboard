
import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/errors/faluire.dart';
import 'package:fruits_app_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_app_dashboard/core/services/database_services.dart';
import 'package:fruits_app_dashboard/features/add_product/domain/entities/add_product_entity_input.dart';

import '../../../features/add_product/data/models/add_product_input_model.dart';
import '../../utils/endpoint.dart';

class ProductsRepoImpl implements ProductsRepo {
   final DatabaseServices databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
   Future<Either<Failure, void>> addProduct(
     AddProductInputEntity addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: EndPoint.AddProduct,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}