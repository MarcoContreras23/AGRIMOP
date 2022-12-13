import 'package:agri_mop/utils/use_navigation.dart';
import 'package:flutter/material.dart';


/// class to represent the onboarding view into state management
class OnboardingController {
  late BuildContext _context;
  late PageController pageController;
  ValueNotifier<double> currentPage = ValueNotifier(0.0);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final OnboardingController _singleton = OnboardingController._();
  factory OnboardingController(BuildContext context) =>
      _singleton._instance(context);
  OnboardingController._();

  OnboardingController _instance(BuildContext context) {
    _singleton._context = context;
    return _singleton;
  }

  void init() {
    pageController = PageController()..addListener(listenerPageView);
  }

  void listenerPageView() {
    currentPage.value = pageController.page!;
  }

  void nextPage() {
    pageController.nextPage(
      duration: kThemeAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  void redirectLogin() {
    useNavigateReplacePage(_context, "homePage");
  }

  void dispose() {
    currentPage.value = 0.0;
    pageController.removeListener(listenerPageView);
    pageController.dispose();
  }
}
