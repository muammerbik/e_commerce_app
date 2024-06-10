import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';
import 'package:mami_onesignal_flutter/home_page/view/home_page_view.dart';
import 'package:mami_onesignal_flutter/onboarding_page/widgets/onboarding_image_widget.dart';
import 'package:mami_onesignal_flutter/onboarding_page/widgets/onboarding_text_widget.dart';
import 'package:mami_onesignal_flutter/onboarding_page/widgets/privacy_policy_widget.dart';
import 'package:mami_onesignal_flutter/onboarding_page/widgets/sign_in_with_google_button.dart';
import 'package:mami_onesignal_flutter/secure_storage/firebase_auth_service.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  void _signInWithGoogle(BuildContext context) async {
    final auth = FirebaseAuthService();
    final user = await auth.googleWithSingIn();

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePageView()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google ile giriş yapılamadı.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.success) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePageView()),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const OnboardingImageWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 385.h,
                width: 375.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 80.w),
                      child: const OnboardingTextWidget(),
                    ),
                    SignInWithGoogleButton(
                      onTap: () => _signInWithGoogle(context),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const PrivacyPolicyWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
