import 'package:architecture/layers/data/repositories/salvar_carro_favorito_repository_imp.dart';
import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:architecture/layers/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase.dart';
import 'package:architecture/layers/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase_imp.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Espero que salve o carro com sucesso quando o valor for maior que 0",
      () async {
    SalvarCarroFavoritoUseCase useCase = SalvarCarroFavoritoUseCaseImp(
      SalvarCarroFavoritoRepositoryImp(),
    );

    CarroEntity carroEntity = CarroEntity(
      placa: "AAA123",
      qtdPortas: 2,
      valor: 1000.00,
    );

    var result = await useCase(carroEntity);
    late bool resultExpect;

    result.fold(
      (l) => null,
      (r) => resultExpect = r,
    );

    expect(resultExpect, true);
  });

  test("Espero que não salve o carro quando o valor for menor ou igual a 0",
      () async {
    SalvarCarroFavoritoUseCase useCase =
        SalvarCarroFavoritoUseCaseImp(SalvarCarroFavoritoRepositoryImp());

    CarroEntity carroEntity = CarroEntity(
      placa: "AAA123",
      qtdPortas: 2,
      valor: 0.00,
    );

    var result = await useCase(carroEntity);
    late bool resultExpect;

    result.fold(
      (l) => null,
      (r) => resultExpect = r,
    );

    expect(resultExpect, false);
  });
}
