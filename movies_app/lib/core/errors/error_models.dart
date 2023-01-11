import 'package:equatable/equatable.dart';

class ServerErrorModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ServerErrorModel(
      {required this.statusCode,
      required this.statusMessage,
      required this.success});

  factory ServerErrorModel.fromJson(Map<String, dynamic> json) =>
      ServerErrorModel(
          statusCode: json['statusCode'],
          statusMessage: json['statusMessage'],
          success: json['success']);

  @override
  // TODO: implement props
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
