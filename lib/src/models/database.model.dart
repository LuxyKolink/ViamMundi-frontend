// To parse this JSON data, do
//
//     final articuloLista = articuloListaFromJson(jsonString);

import 'dart:convert';

ArticuloLista articuloListaFromJson(String str) =>
    ArticuloLista.fromJson(json.decode(str));

String articuloListaToJson(ArticuloLista data) => json.encode(data.toJson());

class ArticuloLista {
  List<Articulo> articulos;

  ArticuloLista({
    required this.articulos,
  });

  factory ArticuloLista.fromJson(Map<String, dynamic> json) => ArticuloLista(
        articulos: List<Articulo>.from(
            json["articulos"].map((x) => Articulo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "articulos": List<dynamic>.from(articulos.map((x) => x.toJson())),
      };
}

class Articulo {
  final String articulo;
  final String calificaciones;
  final String valoracion;
  final String precio;
  final String descuento;
  final String descripcion;
  final String urlimagen;

  Articulo({
    required this.articulo,
    required this.calificaciones,
    required this.valoracion,
    required this.precio,
    required this.descuento,
    required this.descripcion,
    required this.urlimagen,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) => Articulo(
        articulo: json["articulo"] as String,
        calificaciones: json["calificaciones"] as String,
        valoracion: json["valoracion"] as String,
        precio: json["precio"] as String,
        descuento: json["descuento"] as String,
        descripcion: json["descripcion"] as String,
        urlimagen: json["urlimagen"] as String,
      );

  Map<String, dynamic> toJson() => {
        "precio": precio,
        "articulo": articulo,
        "descuento": descuento,
        "urlimagen": urlimagen,
        "valoracion": valoracion,
        "descripcion": descripcion,
        "calificaciones": calificaciones,
      };
}
