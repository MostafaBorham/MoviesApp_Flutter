import 'package:movies_app/core/errors/error_models.dart';

class ServerException implements Exception {
  final ServerErrorModel serverErrorModel;

  ServerException({required this.serverErrorModel});
}
