import '../../domain/entities/carro_entity.dart';
import '../../domain/repositories/get_carro_por_cor_repository.dart';
import '../dto/carro_dto.dart';

class GetCarroPorCorRepositoryImp implements GetCarroPorCorRepository {
  @override
  CarroEntity call(String cor) {
    var json = {
      "placa": "SSS123",
      "quantidadeDePortas": 10,
      "valorFinal": 10.00,
    };
    return CarroDto.fromMap(json);
  }
}
