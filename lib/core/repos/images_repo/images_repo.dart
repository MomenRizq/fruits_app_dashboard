import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../errors/faluire.dart';

abstract class ImagesRepo 
{
  Future<Either<Failure, String>> uploadImage(File image);
}