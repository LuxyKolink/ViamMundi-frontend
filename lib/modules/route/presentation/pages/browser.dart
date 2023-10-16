import 'package:flutter/material.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/resources/colors.dart';
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
  late final TextEditingController _locationSearch;
  late final TextEditingController _tagSelect;
  late final TextEditingController _km;
  late final TextEditingController _hours;
  late final TextEditingController _initialPrice;
  late final TextEditingController _lastPrice;

  @override
  void initState() {
    _locationSearch = TextEditingController();
    _tagSelect = TextEditingController();
    _km = TextEditingController();
    _hours = TextEditingController();
    _initialPrice = TextEditingController();
    _lastPrice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _locationSearch.dispose();
    _tagSelect.dispose();
    _km.dispose();
    _hours.dispose();
    _initialPrice.dispose();
    _lastPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isButtonDisabled: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Buscador',
                fontSize: FontSize.fontSizeLarge,
                textColor: AppColors.primaryColor,
                isBold: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextField(
                  controller: _locationSearch,
                  labelText: 'Ubicación',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextField(
                  controller: _tagSelect,
                  labelText: 'Seleccionar Tag',
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(16),
              //             child:
              //                 CustomTextField(controller: _km, labelText: 'Km'),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(16),
              //             child: CustomTextField(
              //                 controller: _hours, labelText: 'Horas'),
              //           ),
              //         ],
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(16),
              //             child: CustomTextField(
              //                 controller: _initialPrice, labelText: 'Desde'),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(16),
              //             child: CustomTextField(
              //                 controller: _lastPrice, labelText: 'Hasta'),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
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
