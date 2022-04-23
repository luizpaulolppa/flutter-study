import 'package:architecture/layers/data/datasources/local/get_carros_por_cor_local_datasource_imp.dart';
import 'package:architecture/layers/data/repositories/get_carro_por_cor_repository_imp.dart';
import 'package:architecture/layers/data/repositories/salvar_carro_favorito_repository_imp.dart';
import 'package:architecture/layers/domain/usecases/get_carros_por_cor/get_carros_por_cor_usecase_imp.dart';
import 'package:architecture/layers/domain/usecases/salvar_carro_favorito/salvar_carro_favorito_usecase_imp.dart';
import 'package:architecture/layers/presentations/controllers/carro_controller.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  CarroPage({Key? key}) : super(key: key);

  CarroController controller = CarroController(
    GetCarrosPorCorUseCaseImp(
      GetCarroPorCorRepositoryImp(
        GetCarrosPorCorLocalDataSourceImp(),
      ),
    ),
    SalvarCarroFavoritoUseCaseImp(
      SalvarCarroFavoritoRepositoryImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Text(controller.carro.placa),
      ),
    );
  }
}
