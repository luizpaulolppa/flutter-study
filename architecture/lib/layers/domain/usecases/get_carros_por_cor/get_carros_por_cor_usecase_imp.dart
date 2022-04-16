import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:architecture/layers/domain/repositories/get_carro_por_cor_repository.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';

class GetCarrosPorCorUseCaseImp implements GetCarrosPorCorUseCase {
  final GetCarroPorCorRepository _repository;
  GetCarrosPorCorUseCaseImp(this._repository);

  @override
  CarroEntity call(String cor) {
    return _repository(cor);
  }
}
