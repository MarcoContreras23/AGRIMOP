import 'package:agri_mop/utils/pagination_carousel.dart';
import 'package:flutter/material.dart';
// Widgets
import 'widgets/button.dart';
import 'widgets/sliders.dart';
import 'widgets/information.dart';

// Controller
import 'onboarding_controller.dart';
///list of images to show during onboarding
List<Map<String, String>> sliders = [
  {
    'image': "assets/plantFerti.json",
    'label': 'Fertilizante',
    'description':
        '',
  },
  {
    'image': "assets/plants.json",
    'label': 'Humedad',
    'description':
        '',
  },
  {
    'image': "assets/growing.json",
    'label': 'Temperatura',
    'description':
    '',
  },
  {
    'image': "assets/watering.json",
    'label': 'Agua',
    'description':
        '',
  }
];
/// this class represents the onboarding view
class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late OnboardingController _controller;

  @override
  void initState() {
    _controller = OnboardingController(context)..init();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: (paddingBottom + 25)),
        child: _body(),
      ),
    );
  }

  Widget _body() => ValueListenableBuilder<double>(
        valueListenable: _controller.currentPage,
        builder: (BuildContext _, double currentPage, Widget? __) => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _info(currentPage.round()),
            _sliders(currentPage),
            _footer(currentPage.round()),
          ],
        ),
      );

  Widget _sliders(double currentPage) => Sliders(
        currentPage: currentPage,
        sliders: sliders,
        pageController: _controller.pageController,
      );

  Widget _info(int currentPage) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      transform: Matrix4.translationValues(0, (height / 3.6), 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pagination(currentPage),
          const SizedBox(height: 50),
          InformationOnboarding(
            label: sliders[currentPage]['label']!,
            description: sliders[currentPage]['description']!,
          ),
        ],
      ),
    );
  }

  Widget _footer(int currentPage) => AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: currentPage == sliders.length - 1 ? _redirectButton() : _nextButton(),
      );

  Widget _nextButton() => ButtonOnboarding(
        onTap: _controller.nextPage,
        label: 'Siguiente',
      );

  Widget _redirectButton() => ButtonOnboarding(
        onTap: _controller.redirectLogin,
        label: 'Iniciar sesión',
      );

  Widget _pagination(int currentPage) => PaginationCarousel(
        quantity: sliders.length,
        currentPage: currentPage,
        sizeSelectIndicator: 11,
        sizeUnSelectIndicator: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      );
}
