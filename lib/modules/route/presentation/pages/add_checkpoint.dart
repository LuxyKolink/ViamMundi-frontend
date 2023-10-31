import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/map.api.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/router_provider_create.dart';
import 'package:viammundi_frontend/shared/widgets/textfield.dart';

import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/text.dart';
import '../bloc/checkpoint_provider_create.dart';

class AddCheckpointPage extends StatefulWidget {
  const AddCheckpointPage({super.key});

  @override
  State<AddCheckpointPage> createState() => _AddCheckpointPageState();
}

class _AddCheckpointPageState extends State<AddCheckpointPage> {
  late TextEditingController _name;
  late TextEditingController _desc;

  @override
  void initState() {
    _name = TextEditingController();
    _desc = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _email.dispose();
  //   _password.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    File? image = Provider.of<CheckPointProviderCreate>(context).currentImege;
    var provider =
        Provider.of<CheckPointProviderCreate>(context, listen: false);
    var providerMap = Provider.of<MapController>(context, listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSpacing.spacingMedium,
          ),
          const Padding(
            padding: EdgeInsets.all(AppSpacing.spacingMedium),
            child: Column(
              children: [
                CustomText(
                  text: 'Añadir',
                  isTitle: true,
                ),
                CustomText(
                  text: 'Checkpoint',
                  isTitle: true,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: 300,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.file(image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(controller: _name, labelText: 'Nombre'),
                const SizedBox(height: AppSpacing.spacingSmall),
                CustomTextField(
                  controller: _desc,
                  labelText: 'Descripción',
                  isDesc: true,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  text: 'Añadir',
                  onPressed: () async {
                    provider.setName(_name.text);
                    provider.setDescription(_desc.text);
                    provider.setImage(image);
                    await providerMap.addCurrentLocationMarker(_name.text);
                    provider.setCoordinates(providerMap.currentMarker!);
                    print(providerMap.markers);
                    print("aca los guardados");
                    print(provider.checkPoints);
                    print(provider.currentCheckpoint.name);
                    print(providerMap.markers);
                    provider.addCheckPoint(provider.currentCheckpoint);
                    print(provider.checkPoints.length);
                    provider.checkPoints.forEach((checkpoint) {
                      print('Name: ${checkpoint.name}');
                      print('Description: ${checkpoint.description}');
                      print('Coordinates: ${checkpoint.coordinates}');
                      print('Route ID: ${checkpoint.routeId}');
                      print('----------------------');

                    });
                    provider.setImageList(image);
                    Navigator.pushNamed(context, '/progress');
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
    // return Image.file(image!);
  }
}
