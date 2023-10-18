import 'package:flutter/material.dart';
import '../../../profile/presentation/widgets/user_banner.dart';
import '../../../skeleton/widgets/appbar.dart';

class CreateRoutePage extends StatelessWidget {
  const CreateRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: UserBannerWidget()
    );
  }
}
