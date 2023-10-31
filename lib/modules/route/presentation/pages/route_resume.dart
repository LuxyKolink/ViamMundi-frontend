import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/router_provider_create.dart';
import 'package:viammundi_frontend/shared/widgets/textfield.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/text.dart';
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
    String transport =
        Provider.of<RouterProviderCreate>(context).rutaCompleta.transportMethod;
    String zone =
        Provider.of<RouterProviderCreate>(context).rutaCompleta.typeRoute;
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
                  : const SizedBox(height: 180, child: Maps()),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.spacingLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: 'Tiempo: 12:30'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: 'Recorrido: 10Km'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                        child:
                            CustomText(text: 'Medio de Transporte: $transport'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.spacingSmall),
                        child: CustomText(text: 'Zona: $zone'),
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
              child:
                  CustomTextField(controller: _desc, labelText: 'Descripción'),
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
                    onPressed: () {},
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
