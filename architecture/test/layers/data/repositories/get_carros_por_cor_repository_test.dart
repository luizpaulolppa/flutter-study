import 'package:architecture/layers/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:architecture/layers/data/datasources/local/get_carros_por_cor_local_datasource_imp.dart';
import 'package:architecture/layers/data/repositories/get_carro_por_cor_repository_imp.dart';
import 'package:architecture/layers/domain/repositories/get_carro_por_cor_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetCarrosPorCorDataSource dataSource = GetCarrosPorCorLocalDataSourceImp();
  GetCarroPorCorRepository repository = GetCarroPorCorRepositoryImp(dataSource);

  test("Devolva um carro independente da cor", () {
    var result = repository("qualquer");
    expect(result, isNotNull);
  });
}
