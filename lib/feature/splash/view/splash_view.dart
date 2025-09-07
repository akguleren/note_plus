import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generation/generation.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/feature/splash/viewmodel/splash_view_model.dart';

@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  // PageRouteInfo pageToNavigate = const SplashRoute();

  @override
  void initState() {
    super.initState();
    ref.read(SplashNotifier.vm.notifier).setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ref.colorTokens.background?.primary,
      body: Center(child: Assets.lottie.splashBackground.lottie(height: 300)),
    );
  }
}
