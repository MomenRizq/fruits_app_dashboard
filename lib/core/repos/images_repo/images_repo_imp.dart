import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_app_dashboard/core/errors/faluire.dart';
import 'package:fruits_app_dashboard/core/services/storage_service.dart';
import 'package:fruits_app_dashboard/core/utils/endpoint.dart';

import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
   final StorageService storageService;

  ImagesRepoImpl(this.storageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await storageService.uploadFile(image, EndPoint.images);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to uoload image'),
      );
    }
  }
}