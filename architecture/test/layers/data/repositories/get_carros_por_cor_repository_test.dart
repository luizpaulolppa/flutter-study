import 'package:architecture/layers/data/repositories/get_carro_por_cor_repository_imp.dart';
import 'package:architecture/layers/domain/repositories/get_carro_por_cor_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetCarroPorCorRepository repository = GetCarroPorCorRepositoryImp();

  test("Devolva um carro independente da cor", () {
    var result = repository("qualquer");
    expect(result, isNotNull);
  });
}
