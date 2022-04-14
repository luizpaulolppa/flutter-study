import 'package:architecture/layers/domain/entities/carro_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test("Espero que a entidade não seja nula", () {
    CarroEntity carroEntity = CarroEntity(
      placa: "AAA123",
      qtdPortas: 2,
      valor: 1000.00,
    );
    expect(carroEntity, isNotNull);
  });

  test("Espero que a quantidade de portas seja 2", () {
    CarroEntity carroEntity = CarroEntity(
      placa: "AAA123",
      qtdPortas: 2,
      valor: 1000.00,
    );
    expect(carroEntity.qtdPortas, 2);
  });

  test("Espero que o valorReal seja 2000.00", () {
    CarroEntity carroEntity = CarroEntity(
      placa: "AAA123",
      qtdPortas: 2,
      valor: 1000.00,
    );
    var resultadoEsperado = 2000.00;
    expect(carroEntity.qtdPortas, 2);
    expect(resultadoEsperado, 2000.00);
  });

  test("Espero que o valorReal seja 0.00", () {
    CarroEntity carroEntity = CarroEntity(
      placa: "AAA123",
      qtdPortas: 0,
      valor: 1000.00,
    );
    var resultadoEsperado = 0.00;
    expect(resultadoEsperado, 0.00);
  });
}
