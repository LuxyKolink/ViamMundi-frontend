import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/checkpoint_provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/checkpoint_provider_create.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/router_provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/router_provider_create.dart';
import 'package:viammundi_frontend/shared/widgets/textfield.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/circle_avatar.dart';
import '../../../../shared/widgets/text.dart';
import '../../../skeleton/bloc/selected_provider.dart';
import '../widgets/checkpoint_list_widget.dart';
import '../widgets/map.dart';

class RouteResumePage extends StatefulWidget {
  const RouteResumePage({super.key});

  @override
  State<RouteResumePage> createState() => _RouteResumePageState();
}

class _RouteResumePageState extends State<RouteResumePage> {
  late final TextEditingController _name;
  late final TextEditingController _desc;
  late final TextEditingController _price;
  bool _isLoading = false;

  @override
  void initState() {
    _name = TextEditingController();
    _desc = TextEditingController();
    _price = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _desc.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var RouterProvider = Provider.of<RouterProviderCreate>(context);

    //variables:
    var tiempo = RouterProvider.rutaCompleta.durationRoute;
    var typoRuta = RouterProvider.rutaCompleta.typeRoute;
    var typoTransporte = RouterProvider.rutaCompleta.transportMethod;
    var distancia = RouterProvider.rutaCompleta.distanceRoute;
    var idUser = RouterProvider.rutaCompleta.userID;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppSpacing.spacingMedium),
              child: Center(
                child: CustomText(
                  text: 'Resumen',
                  isTitle: true,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: 500,
              child: _isLoading
                  ? const SizedBox(
                      height: 180,
                      width: 180,
                      child: CircularProgressIndicator())
                  : GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: const SizedBox(height: 180, child: Maps())),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spacingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: CircleAvatarWidget(
                    profileImageUrl:
                        "http://192.168.1.10:4000/images/imgProf/$idUser",
                  )),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: "Tiempo: $tiempo Minutos"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: 'Recorrido: $distancia Metros'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: 'Transporte: $typoTransporte'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: 'Zona: $typoRuta'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.spacingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Checkpoints'),
                  SizedBox(height: AppSpacing.spacingSmall),
                  SizedBox(
                    height: 250,
                    child: CheckpointListWidget(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spacingMedium),
              child: CustomTextField(
                  controller: _name, labelText: 'Nombre de la ruta'),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spacingMedium),
              child: CustomTextField(
                  controller: _desc, labelText: 'Descripción', isDesc: true),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spacingMedium),
              child: CustomTextField(controller: _price, labelText: 'Precio'),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spacingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    text: 'Publicar',
                    onPressed: () async {
                      RouterProvider.changeName(_name.text);
                      RouterProvider.changeDesc(_desc.text);
                      RouterProvider.changePric(int.parse(_price.text));
                      var ruta_completa_final = RouterProvider.rutaCompleta;
                      if (ruta_completa_final != null) {
                        print("userID: ${ruta_completa_final.userID}");
                        print(
                            "transportMethod: ${ruta_completa_final.transportMethod}");
                        print("typeRoute: ${ruta_completa_final.typeRoute}");
                        print("nameRoute: ${ruta_completa_final.nameRoute}");
                        print(
                            "descriptionRoute: ${ruta_completa_final.descriptionRoute}");
                        print(
                            "durationRoute: ${ruta_completa_final.durationRoute}");
                        print(
                            "distanceRoute: ${ruta_completa_final.distanceRoute}");
                        print(
                            "locationRoute: ${ruta_completa_final.locationRoute}");
                        print("priceRoute: ${ruta_completa_final.priceRoute}");
                        // No se puede imprimir un JsonCodec directamente, necesitarías convertirlo a un formato legible primero
                        print("traceRoute: ${ruta_completa_final.traceRoute}");
                      } else {
                        print("El objeto ruta_completa_final es nulo");
                      }

                      var list_checkpoints_final =
                          Provider.of<CheckPointProviderCreate>(context,
                                  listen: false)
                              .checkPoints;
                      var list_imagenes_final =
                          Provider.of<CheckPointProviderCreate>(context,
                                  listen: false)
                              .checkPointsImages;
                      //CHECKPOINT
                      for (var checkpoint in list_checkpoints_final) {
                        print("Name: ${checkpoint.name}");
                        print("Description: ${checkpoint.description}");
                        print("Coordinates: ${checkpoint.coordinates}");
                        print("Route ID: ${checkpoint.routeId}");
                        print("\n");
                      }
                      //mandar a la api:
                      var routerProviderApi =
                          Provider.of<RouterState>(context, listen: false);
                      var idRouteFinalFinal = await routerProviderApi
                          .createRouteProvider(ruta_completa_final);
                      print("IDROUTEFINALFINAL");
                      print(idRouteFinalFinal);
                      List<int> listIds = [];
                      for (var checkPoint in list_checkpoints_final) {
                        checkPoint.routeId = idRouteFinalFinal!;
                        print("Name: ${checkPoint.name}");
                        print("Description: ${checkPoint.description}");
                        print("Coordinates: ${checkPoint.coordinates}");

                        print("Route ID: ${checkPoint.routeId}");

                        //guardar checkpoint por checkpoint con id de ruta

                        var routerProviderApiDos = Provider.of<CheckPointState>(
                            context,
                            listen: false);
                        var idCheckPoint = await routerProviderApiDos
                            .getIdCreateCheckpoint(checkPoint);

                        listIds.add(idCheckPoint);
                      }
                      print(listIds);

                      var contador = 0;
                      for (var file in listIds) {
                        String primera_palabra = "checkpoin";
                        String segunda_palabra = ruta_completa_final.userID;
                        String tercera_palabra = idRouteFinalFinal.toString();
                        String cuarta_palabra = file.toString();

                        var resultado = primera_palabra +
                            "_" +
                            segunda_palabra +
                            "_" +
                            tercera_palabra +
                            "_" +
                            cuarta_palabra +
                            ".jpg";
                        print(resultado);
                        var routerProviderApiDos = Provider.of<CheckPointState>(
                            context,
                            listen: false);

                        List<File> listaFiles =
                            Provider.of<CheckPointProviderCreate>(context,
                                    listen: false)
                                .checkPointsImages;

                        var idCheckPoint = await routerProviderApiDos
                            .getIdCreateFileOfCheckpoint(
                                listaFiles[contador], resultado);
                        contador = contador + 1;
                      }
                      Provider.of<SelectedProvider>(context, listen: false).changePage(0);
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  Button(
                    text: 'Cancelar',
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
