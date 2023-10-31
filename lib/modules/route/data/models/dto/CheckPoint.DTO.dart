import 'dart:convert';

class ReqCompleteCheckPointDTO {
  String name;
  String description;
  String coordinates;
  int routeId;

  ReqCompleteCheckPointDTO({
    required this.name,
    required this.description,
    required this.coordinates,
    required this.routeId,
  });

  ReqCompleteCheckPointDTO.initial()
      : name = '',
        description = '',
        coordinates = '',
        routeId = 0;

  factory ReqCompleteCheckPointDTO.fromJson(Map<String, dynamic> json) {
    return ReqCompleteCheckPointDTO(
      name: json['name'] as String,
      description: json['description'] as String,
      coordinates: json['coordinates'] as  String,
      routeId: json['route_id'] as int,
    );
  }
}

class ResCompleteCheckPointDTO {
  final int id;
  final int routeID;
  final int statusCode;
  final String message;

  ResCompleteCheckPointDTO({
    required this.id,
    required this.routeID,
    required this.statusCode,
    required this.message,
  });

  factory ResCompleteCheckPointDTO.fromJson(Map<String, dynamic> json) {
    return ResCompleteCheckPointDTO(
      id: json['id'] as int,
      routeID: json['route_id'] as int,
      statusCode: json['status_code'] as int,
      message: json['message'] as String,
    );
  }
}

class ResUploadFileDTO {
  final String message;
  final String path;
  final int statusCode;
  final String nameFile;

  ResUploadFileDTO({
    required this.message,
    required this.path,
    required this.statusCode,
    required this.nameFile,
  });

  factory ResUploadFileDTO.fromJson(Map<String, dynamic> json) {
    return ResUploadFileDTO(
      message: json['message'] as String,
      path: json['path'] as String,
      statusCode: json['status_code'] as int,
      nameFile: json['name_file'] as String,
    );
  }
}

class ResParcialCheckPointDTO {
  final int id;
  final String multimediaPath;

  ResParcialCheckPointDTO({
    required this.id,
    required this.multimediaPath,
  });

  factory ResParcialCheckPointDTO.fromJson(Map<String, dynamic> json) {
    return ResParcialCheckPointDTO(
      id: json['id'] as int,
      multimediaPath: json['multimedia_path'] as String,
    );
  }
}

class ReqStreamFileDTO {
  final int id;

  ReqStreamFileDTO({
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class ResStreamFileDTO {
  final String message;
  final int statusCode;

  ResStreamFileDTO({
    required this.message,
    required this.statusCode,
  });

  factory ResStreamFileDTO.fromJson(Map<String, dynamic> json) {
    return ResStreamFileDTO(
      message: json['message'] as String,
      statusCode: json['status_code'] as int,
    );
  }
}