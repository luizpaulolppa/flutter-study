import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetCarroPorCorRepository {
  Either<Exception, CarroEntity> call(String cor);
}
