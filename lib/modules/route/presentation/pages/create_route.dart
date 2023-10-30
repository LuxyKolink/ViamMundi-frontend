import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/map.api.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/router_provider_create.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/map.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/option_select_icon.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';
import 'package:viammundi_frontend/shared/resources/map.utils.dart';
import 'package:viammundi_frontend/shared/widgets/button.dart';
import 'package:viammundi_frontend/shared/widgets/text.dart';

class CreateRoutePage extends StatefulWidget {
  const CreateRoutePage({super.key});

  @override
  State<CreateRoutePage> createState() => _CreateRoutePageState();
}

class _CreateRoutePageState extends State<CreateRoutePage> {
  bool _isLoading = true;

  late Timer timer;
  late String currentTime;

  void _determinePosition() async {
    await Provider.of<MapController>(context, listen: false).getUserLocation();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    obtenerGps();
    super.initState();
    _determinePosition();
    currentTime = "";
    currentTime = getCurrentTime();
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  String getCurrentTime() {
    return DateFormat.Hms().format(DateTime.now());
  }

  void _getCurrentTime() {
    setState(() {
      currentTime = getCurrentTime();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MapController>(context).getUserLocation();
    var selectedTransport =
        context.watch<RouterProviderCreate>().rutaCompleta.transportMethod;
    var selectedAmbient =
        context.watch<RouterProviderCreate>().rutaCompleta.typeRoute;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Center(
          child: CustomText(
            text: 'Crear Ruta',
            isTitle: true,
          ),
        ),
        _isLoading
            ? const SizedBox(
                height: 180, width: 180, child: CircularProgressIndicator())
            : const SizedBox(height: 180, child: Maps()),
        const SizedBox(height: AppSpacing.spacingLarge),
        CustomText(text: currentTime),
        const SizedBox(height: AppSpacing.spacingLarge),
        const Padding(
          padding: EdgeInsets.all(AppSpacing.spacingMedium),
          child: Text('Medio de Transporte'),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Container(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(color: AppColors.primaryColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionSelectIcon(
                  icon: const Icon(Icons.pedal_bike),
                  isSelected: selectedTransport == "1" ? true : false,
                  onPressed: () {
                    Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeTransport("1");
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedTransport == "2" ? true : false,
                  onPressed: () {
                    Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeTransport("2");
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedTransport == "3" ? true : false,
                  onPressed: () {
                    Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeTransport("3");
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedTransport == "4" ? true : false,
                  onPressed: () {
                    Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeTransport("4");
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(AppSpacing.spacingMedium),
          child: Text('Zona'),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Container(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(color: AppColors.primaryColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionSelectIcon(
                  isSelected: selectedAmbient == "1" ? true : false,
                  onPressed: () {
                    Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeAmbient("1");
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedAmbient == "2" ? true : false,
                  onPressed: () {
                    Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeAmbient("2");
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Button(
            text: 'Iniciar',
            onPressed: () {
              Provider.of<RouterProviderCreate>(context, listen: false)
                        .changeHour(DateTime.now());
              Provider.of<MapController>(context, listen: false).suscribePosition();
              Navigator.pushNamed(context, '/progress');
            },
          ),
        ),
      ],
    );
  }
}
