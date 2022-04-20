import 'package:architecture/layers/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:architecture/layers/data/datasources/local/get_carros_por_cor_local_datasource_imp.dart';
import 'package:architecture/layers/data/repositories/get_carro_por_cor_repository_imp.dart';
import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Deve retornar uma instância de carro quando passado qualquer cor", () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp(
        GetCarroPorCorRepositoryImp(GetCarrosPorCorLocalDataSourceImp()));
    expect(useCase("azul"), isInstanceOf<CarroEntity>());
  });

  test("Deve retornar um carro de 4 portas quando vermelho", () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp(
        GetCarroPorCorRepositoryImp(GetCarrosPorCorLocalDataSourceImp()));
    var result = useCase("vermelho");
    expect(result.qtdPortas, 4);
  });

  test("Deve retornar um carro de 2 portas quando passar qualquer cor", () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp(
        GetCarroPorCorRepositoryImp(GetCarrosPorCorLocalDataSourceImp()));
    var result = useCase("preto");
    expect(result.qtdPortas, 2);
  });
}
