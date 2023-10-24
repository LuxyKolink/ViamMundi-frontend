import 'package:flutter/material.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/text.dart';
import '../../../../shared/widgets/textfield.dart';
import '../../../skeleton/widgets/appbar.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({super.key});

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  late final TextEditingController _profileName;

  @override
  void initState() {
    _profileName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _profileName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Buscador',
                isTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextField(
                  controller: _profileName,
                  labelText: 'Nombre de Perfil',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Button(text: 'Buscar', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
