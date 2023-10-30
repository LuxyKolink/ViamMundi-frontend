import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/selected_option_provider.dart';

class AddCheckpointPage extends StatelessWidget {
  const AddCheckpointPage({super.key});

  @override
  Widget build(BuildContext context) {
    File? image = Provider.of<SelectedOptionProvider>(context).image;
    return Image.file(image!);
  }
}
