import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/router_provider.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';

import '../widgets/route_post.dart';

class FeedContentPage extends StatefulWidget {
  FeedContentPage({super.key});

  @override
  State<FeedContentPage> createState() => _FeedContentPageState();
}

class _FeedContentPageState extends State<FeedContentPage> {
  @override
  void initState() {
    Provider.of<RouterState>(context, listen: false).getAllRoutesProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<ResParcialRouteDTO>? rutasTotales =
        Provider.of<RouterState>(context).rutasTotales;

  print(rutasTotales?[0].distanceRoute);
    return rutasTotales != null && rutasTotales.isNotEmpty
        ? ListView.builder(
            itemCount: rutasTotales.length,
            itemBuilder: (BuildContext context, int index) {
              return RoutePostWidget(
                distance: rutasTotales[index].distanceRoute,
                duration: rutasTotales[index].durationRoute,
                likes: rutasTotales[index].likes,
                comments: rutasTotales[index].likes,
                price: rutasTotales[index].priceRoute,
                idUser: rutasTotales[index].userID,
                listCheckpoints: rutasTotales[index].listCheckPoints,
                nameRoute: rutasTotales[index].nameRoute,
              );
            },
          )
        : Center(
            child: Text('No hay rutas disponibles'),
          );
  }
}
