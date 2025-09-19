import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/assets.dart';
import '../../../../../core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();

  }



  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AssetsData.logo,
          width: 250,
        ),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }


  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        )
    );
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 7),end:Offset.zero ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),() {
      if (!mounted) return;
      GoRouter.of(context).push(AppRouter.kHomeView);
      },);
  }

}

