import 'package:bookly/Core/utils/app_routers.dart';
import 'package:bookly/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        children: [
          Image.asset(
            AssetsData.logo,
            height: 17,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kserchview);
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              )),
        ],
      ),
    );
  }
}
