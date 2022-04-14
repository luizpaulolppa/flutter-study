import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Deve retornar uma instância de carro quando passado qualquer cor", () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp();
    expect(useCase("azul"), isInstanceOf<CarroEntity>());
  });

  test("Deve retornar um carro de 4 portas quando vermelho", () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp();
    var result = useCase("vermelho");
    expect(result.qtdPortas, 4);
  });

  test("Deve retornar um carro de 2 portas quando passar qualquer cor", () {
    GetCarrosPorCorUseCase useCase = GetCarrosPorCorUseCaseImp();
    var result = useCase("preto");
    expect(result.qtdPortas, 2);
  });
}
