import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          SvgPicture.asset(AssetsData.logo,
            height: 18,
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.magnifyingGlass,size: 20,))
        ],
      ),
    );
  }
}
