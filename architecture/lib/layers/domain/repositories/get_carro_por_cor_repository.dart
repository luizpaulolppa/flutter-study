import 'package:architecture/layers/domain/entities/carro_entity.dart';

abstract class GetCarroPorCorRepository {
  CarroEntity call(String cor);
}
