import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:architecture/layers/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase.dart';

class CarroController {
  final GetCarrosPorCorUseCase _getCarrosPorCorUseCase;
  final SalvarCarroFavoritoUseCase _salvarCarroFavoritoUseCase;

  late CarroEntity carro;

  CarroController(
    this._getCarrosPorCorUseCase,
    this._salvarCarroFavoritoUseCase,
  ) {
    getCarrosPorCor("vermelho");
  }

  getCarrosPorCor(String cor) {
    carro = _getCarrosPorCorUseCase(cor);
  }

  salvarCarroFavorito(CarroEntity carroEntity) async {
    var result = await _salvarCarroFavoritoUseCase(carroEntity);
  }
}
