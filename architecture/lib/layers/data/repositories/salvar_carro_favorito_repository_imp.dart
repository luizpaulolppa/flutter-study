import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:architecture/layers/domain/repositories/salvar_carro_favorito_repository.dart';
import 'package:dartz/dartz.dart';

class SalvarCarroFavoritoRepositoryImp
    implements SalvarCarroFavoritoRepository {
  @override
  Future<Either<Exception, bool>> call(CarroEntity carroEntity) async {
    try {
      return Right(carroEntity.valor > 0);
    } catch (e) {
      return Left(Exception("repository error"));
    }
  }
}
