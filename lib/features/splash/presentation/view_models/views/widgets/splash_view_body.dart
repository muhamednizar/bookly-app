import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/utils/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        SvgPicture.asset(AssetsData.logo,width: 250,),
         const SizedBox(height: 10,),
         const Text('Read Free Books',textAlign: TextAlign.center,),
      ],
    );
  }
}
