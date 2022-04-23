import 'package:architecture/layers/data/datasources/get_carros_por_cor_datasource.dart';
import 'package:architecture/layers/data/datasources/local/get_carros_por_cor_local_datasource_imp.dart';
import 'package:architecture/layers/data/repositories/get_carro_por_cor_repository_imp.dart';
import 'package:architecture/layers/data/repositories/salvar_carro_favorito_repository_imp.dart';
import 'package:architecture/layers/domain/repositories/get_carro_por_cor_repository.dart';
import 'package:architecture/layers/domain/repositories/salvar_carro_favorito_repository.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase_imp.dart';
import 'package:architecture/layers/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase.dart';
import 'package:architecture/layers/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase_imp.dart';
import 'package:architecture/layers/presentations/controllers/carro_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<GetCarrosPorCorDataSource>(
      () => GetCarrosPorCorLocalDataSourceImp(),
    );

    //repositories
    getIt.registerLazySingleton<GetCarroPorCorRepository>(
      () => GetCarroPorCorRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<SalvarCarroFavoritoRepository>(
      () => SalvarCarroFavoritoRepositoryImp(),
    );

    //usecases
    getIt.registerLazySingleton<GetCarrosPorCorUseCase>(
      () => GetCarrosPorCorUseCaseImp(getIt()),
    );
    getIt.registerLazySingleton<SalvarCarroFavoritoUseCase>(
      () => SalvarCarroFavoritoUseCaseImp(getIt()),
    );

    //controlers
    getIt.registerFactory<CarroController>(
      () => CarroController(
        getIt(),
        getIt(),
      ),
    );
  }
}

// CarroController controller = CarroController(
//   GetCarrosPorCorUseCaseImp(
//     GetCarroPorCorRepositoryImp(
//       GetCarrosPorCorLocalDataSourceImp(),
//     ),
//   ),
//   SalvarCarroFavoritoUseCaseImp(
//     SalvarCarroFavoritoRepositoryImp(),
//   ),
// );
