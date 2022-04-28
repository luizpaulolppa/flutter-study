import 'package:architecture/layers/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/carro_entity.dart';
import '../../domain/repositories/get_carro_por_cor_repository.dart';

class GetCarroPorCorRepositoryImp implements GetCarroPorCorRepository {
  final GetCarrosPorCorDataSource _getCarrosPorCorDataSource;

  GetCarroPorCorRepositoryImp(this._getCarrosPorCorDataSource);

  @override
  Either<Exception, CarroEntity> call(String cor) {
    return _getCarrosPorCorDataSource(cor);
  }
}
