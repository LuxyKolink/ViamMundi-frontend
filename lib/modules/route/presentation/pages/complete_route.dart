import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/title_section.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

// import '../../data/models/dto/Route.DTO.dart';
// import '../bloc/router_provider.dart';
import '../bloc/router_provider_create.dart';
import '../widgets/map.dart';
import '../widgets/option_select_icon.dart';
import '../widgets/route_carrousel.dart';
import '../widgets/route_stats.dart';

class CompleteRoutePage extends StatefulWidget {
  const CompleteRoutePage({
    super.key,
  });

  @override
  State<CompleteRoutePage> createState() => _CompleteRoutePageState();
}

class _CompleteRoutePageState extends State<CompleteRoutePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var selectedTransport =
        context.watch<RouterProviderCreate>().rutaCompleta.transportMethod;
    var selectedAmbient =
        context.watch<RouterProviderCreate>().rutaCompleta.typeRoute;
    // List<ResParcialRouteDTO>? rutasTotales =
    //     Provider.of<RouterState>(context).rutasTotales;
    return SingleChildScrollView(
      child: Column(
        children: [
          const CompleteRouteTitleSection(
              profileImageUrl: 'assets/icons/profile_icon.png',
              userName: 'Diegod',
              routeName: 'Comidas Rapidas el Chamo'),
          SizedBox(
            height: 200,
            width: 500,
            child: _isLoading
                ? const SizedBox(
                    height: 180, width: 180, child: CircularProgressIndicator())
                : const SizedBox(height: 180, child: Maps()),
          ),
          RouteCarrouselWidget(listCheckpoints: List.empty()),
          const RoutePostStats(
            likes: 10,
            duration: 10,
            price: 10,
            distance: 10,
            comments: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.spacingSmall),
                  child: Text('Descripcion del Checkpoint'),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          const Divider(
            height: AppSpacing.spacingMedium,
            color: AppColors.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.spacingSmall),
                  child: Text('Nombre'),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.spacingSmall),
                  child: Text('Descripcion'),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration:
                      const BoxDecoration(color: AppColors.primaryColor),
                ),
              ],
            ),
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
                    isSelected: selectedTransport == "Bicicleta" ? true : false,
                    onPressed: () {},
                  ),
                  OptionSelectIcon(
                    icon: const Icon(Icons.directions_car),
                    isSelected: selectedTransport == "Carro" ? true : false,
                    onPressed: () {},
                  ),
                  OptionSelectIcon(
                    icon: const Icon(Icons.motorcycle),
                    isSelected: selectedTransport == "Moto" ? true : false,
                    onPressed: () {},
                  ),
                  OptionSelectIcon(
                    icon: const Icon(Icons.directions_run),
                    isSelected: selectedTransport == "A pie" ? true : false,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
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
                    icon: const Icon(Icons.apartment),
                    isSelected: selectedAmbient == "Ciudad" ? true : false,
                    onPressed: () {},
                  ),
                  OptionSelectIcon(
                    icon: const Icon(Icons.forest),
                    isSelected: selectedAmbient == "Rural" ? true : false,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
