import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/map.api.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/checkpoint_list_widget.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/map.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';
import 'package:viammundi_frontend/shared/widgets/button.dart';
import 'package:viammundi_frontend/shared/widgets/text.dart';

import '../../../../shared/widgets/icon_button.dart';
import '../bloc/checkpoint_provider_create.dart';
import '../bloc/router_provider_create.dart';

class InProgressRoutePage extends StatefulWidget {
  const InProgressRoutePage({super.key});

  @override
  State<InProgressRoutePage> createState() => _InProgressRoutePageState();
}

class _InProgressRoutePageState extends State<InProgressRoutePage> {
  bool _isLoading = false;
  late Timer timer;
  late Timer timer2;
  late String currentTime;
  late String distanceTotal = "0";

  @override
  void initState() {
    super.initState();
    currentTime = getCurrentTime();
    timer2 = Timer.periodic(Duration(seconds: 2), (Timer t) => _setDistance());
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  @override
  void dispose() {
    timer.cancel();
    timer2.cancel();
    super.dispose();
  }

  String getCurrentTime() {
    var providerRoute =
        Provider.of<RouterProviderCreate>(context, listen: false);
    var horainicial2 = providerRoute.horaInicial;
    if (horainicial2 != null) {
      var diferencia = DateTime.now().difference(horainicial2);
      var diferenciaHoras = diferencia.inHours;
      var diferenciaMinutos = diferencia.inMinutes.remainder(60);
      providerRoute.changeHourFinal(diferenciaMinutos);
      return '$diferenciaHoras horas y $diferenciaMinutos minutos';
    } else {
      return '';
    }
  }

  String getCurrentDistance() {
    var listPoints =
        Provider.of<MapController>(context, listen: false).pointroutes;
    var mapNotifier = Provider.of<MapController>(context, listen: false);
    var distanceTotal = mapNotifier.calculateTotalDistance(listPoints);
    int distanceKm = (distanceTotal ~/ 1000);
    int distanceMeters = (distanceTotal % 1000).toInt();
    return '$distanceKm km $distanceMeters metros';
  }

  void _getCurrentTime() {
    setState(() {
      currentTime = getCurrentTime();
    });
  }

  void _setDistance() {
    setState(() {
      distanceTotal = getCurrentDistance();
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectedState = context.watch<CheckPointProviderCreate>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(AppSpacing.spacingMedium),
            child: Center(
              child: CustomText(
                text: 'Ruta en Curso',
                isTitle: true,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 500,
            child: _isLoading
                ? const SizedBox(
                    height: 180, width: 180, child: CircularProgressIndicator())
                : const SizedBox(height: 180, child: Maps()),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                      child: CustomText(text: currentTime),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                      ///////////////////////////////////////
                      child: CustomText(text: distanceTotal),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      height: 75,
                      width: 75,
                      child: IconButton(
                        onPressed: () async {
                          final returnedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (returnedImage != null) {
                            print("si lo toma");
                            File imageFile = File(returnedImage.path);
                            selectedState.setImage(imageFile);
                            if (!context.mounted) return;
                            Navigator.pushNamed(context, '/addcheckpoint');
                          }
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSpacing.spacingLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      height: 75,
                      width: 75,
                      child: CustomIconButton(
                        onPressed: () async {
                          final returnedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (returnedImage != null) {
                            File imageFile = File(returnedImage.path);
                            selectedState.setImage(imageFile);
                            if (!context.mounted) return;
                            Navigator.pushNamed(context, '/addcheckpoint');
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacingLarge),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  text: 'Publicar',
                  onPressed: () {
                    var listPoints =
                        Provider.of<MapController>(context, listen: false)
                            .pointroutes;
                    var mapNotifier =
                        Provider.of<MapController>(context, listen: false);
                    var distanceTotal =
                        mapNotifier.calculateTotalDistance(listPoints);

                    var providerRouter = Provider.of<RouterProviderCreate>(
                        context,
                        listen: false);

                    providerRouter.changeDistanceTotal(distanceTotal);
                    var ruta_completa_final = Provider.of<RouterProviderCreate>(
                            context,
                            listen: false)
                        .rutaCompleta;
                    var list_checkpoints_final =
                        Provider.of<CheckPointProviderCreate>(context,
                                listen: false)
                            .checkPoints;
                    var list_imagenes_final =
                        Provider.of<CheckPointProviderCreate>(context,
                                listen: false)
                            .checkPointsImages;

                    //List<LatLng> pointroutes
                    //CompleteRouteDTO rutaCompleta
                    //List<ReqCompleteCheckPointDTO>
                    //List<File> checkPointsImages
                    //var traceroute_encode = mapNotifier.pointroutes;
                    var traceroute_encode =
                        mapNotifier.pointroutes.map((point) {
                      return {
                        "latitude": point.latitude,
                        "longitude": point.longitude,
                      };
                    }).toList();
                    var traceroute_json = json.encode(traceroute_encode);
                    providerRouter.changeTraceRoute(traceroute_json);
                    //RUTA
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
                      print("dateRoute: ${ruta_completa_final.dateRoute}");
                      print(
                          "locationRoute: ${ruta_completa_final.locationRoute}");
                      print("priceRoute: ${ruta_completa_final.priceRoute}");
                      // No se puede imprimir un JsonCodec directamente, necesitarías convertirlo a un formato legible primero
                      print("traceRoute: ${ruta_completa_final.traceRoute}");
                    } else {
                      print("El objeto ruta_completa_final es nulo");
                    }

                    //CHECKPOINT
                    for (var checkpoint in list_checkpoints_final) {
                      print("Name: ${checkpoint.name}");
                      print("Description: ${checkpoint.description}");
                      print("Coordinates: ${checkpoint.coordinates}");
                      print("Route ID: ${checkpoint.routeId}");
                      print("\n");
                    }

                    print(ruta_completa_final);
                    print(list_checkpoints_final.toString());
                    print(list_imagenes_final.toString());
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
    );
  }
}
