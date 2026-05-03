import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/onBoarding/on_boarding_model.dart';
import 'package:event_app/providers/app_language_provider.dart';
import 'package:event_app/providers/app_theme_provider.dart';
import 'package:event_app/utils/app_assets.dart';
import 'package:event_app/onBoarding/widgets/language_toggle_item.dart';
import 'package:event_app/onBoarding/widgets/theme_toggle_item.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:event_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "onBoarding";

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() =>
      _OnBoardingScreenState();
}

class _OnBoardingScreenState
    extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  late List<OnBoardingModel> pages;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final l = AppLocalizations.of(context)!;

    pages = [
      OnBoardingModel(
        lightImage: AppAssets.introOnbord,
        darkImage: AppAssets.introOnbordDR,
        title: (l) => l.onboarding_title_1,
        description: (l) => l.onboarding_desc_1,
      ),
      OnBoardingModel(
        lightImage: AppAssets.secondOndord,
        darkImage: AppAssets.secondOnbordDR,
        title: (l) => l.onboarding_title_2,
        description: (l) => l.onboarding_desc_2,
      ),
      OnBoardingModel(
        lightImage: AppAssets.therdOnbord,
        darkImage: AppAssets.therdOndordDR,
        title: (l) => l.onboarding_title_3,
        description: (l) => l.onboarding_desc_3,
      ),
      OnBoardingModel(
        lightImage: AppAssets.fourOnbord,
        darkImage: AppAssets.fourOndordDR,
        title: (l) => l.onboarding_title_4,
        description: (l) => l.onboarding_desc_4,
      ),
    ];
  }

  Future<void> finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoarding', false);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final themeProvider = context.watch<AppThemeProvider>();
    final langProvider = context.watch<AppLanguageProvider>();

    final isDark = themeProvider.isDarkMode;
    final isArabic =
        Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            /// 🔷 Logo
            Padding(
              padding: const EdgeInsets.all(16),
              child:
              Image.asset(AppAssets.logoTop, height: 60),
            ),

            /// 🔷 Pages
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = pages[index];

                  return Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      /// IMAGE
                      Image.asset(
                        isDark
                            ? item.darkImage
                            : item.lightImage,
                        height: 260,
                      ),

                      const SizedBox(height: 30),

                      /// TITLE
                      Text(
                        item.title(l),
                        textAlign: TextAlign.center,
                        style:
                         AppStyles.bold20Primary
                        ,
                      ),

                      const SizedBox(height: 16),

                      /// DESCRIPTION
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Text(
                          item.description(l),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).brightness == Brightness.dark
                          ?AppStyles.medium16Black
                          :AppStyles.medium16whit,
                        ),
                      ),

                      /// 🔥 FIRST PAGE ONLY
                      if (index == 0) ...[
                        const SizedBox(height: 40),

                        /// LANGUAGE
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: Text(l.language,
                                style:AppStyles.medium20Primary ,),
                            ),

                            Container(
                              margin:
                              const EdgeInsets.only(
                                  right: 20),
                              padding:
                              const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey
                                    .shade300,
                                borderRadius:
                                BorderRadius
                                    .circular(30),
                                border:
                                Border.all(
                                    color: AppColors.primaryLight,
                                width: 1.8)
                              ),
                              child: Row(
                                children: [
                                  LanguageToggleItem(
                                   image: AppAssets.LRflag,
                                    isSelected:
                                    langProvider
                                        .isEnglish,
                                    onTap: () {
                                      langProvider
                                          .changeLanguage(
                                          "en");
                                    },
                                  ),
                                  LanguageToggleItem(
                                    image: AppAssets.EGflag,
                                    isSelected:
                                    !langProvider
                                        .isEnglish,
                                    onTap: () {
                                      langProvider
                                          .changeLanguage(
                                          "ar");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        /// THEME
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 20),
                              child: Text(l.theme,
                                style: AppStyles.medium20Primary,),
                            ),

                            Container(
                              margin:
                              const EdgeInsets.only(
                                  right: 20),
                              padding:
                              const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey
                                    .shade300,
                                borderRadius:
                                BorderRadius
                                    .circular(30),
                                border: Border.all(color:
                                AppColors.primaryLight,width: 1.8)
                              ),
                              child: Row(
                                children: [
                                  ThemeToggleItem(
                                    icon: Icons.wb_sunny,
                                    isSelected: !isDark,
                                    onTap: () {
                                      context
                                          .read<
                                          AppThemeProvider>()
                                          .changeTheme(
                                          ThemeMode
                                              .light);
                                    },
                                  ),
                                  ThemeToggleItem(
                                    icon: Icons
                                        .nightlight_round,
                                    isSelected: isDark,
                                    onTap: () {
                                      context
                                          .read<
                                          AppThemeProvider>()
                                          .changeTheme(
                                          ThemeMode
                                              .dark);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        /// 🔵 LET’S START BUTTON
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                               AppColors.primaryLight,
                                padding:
                                const EdgeInsets
                                    .symmetric(
                                    vertical:
                                    16),
                                shape:
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius
                                      .circular(30),
                                ),
                              ),
                              onPressed: () {
                                controller.nextPage(
                                  duration:
                                  const Duration(
                                      milliseconds:
                                      300),
                                  curve: Curves
                                      .easeInOut,
                                );
                              },
                              child: Text(
                                l.start,
                                style:
                                AppStyles.medium20whit,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),

            /// 🔷 Bottom Controls
            if (currentIndex != 0)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                child: Row(
                  children: [
                    if (currentIndex > 0)
                      _circleButton(

                        icon:
                             Icons.arrow_back_ios,
                        onTap: () {
                          controller.previousPage(
                            duration:
                            const Duration(
                                milliseconds: 300),
                            curve:
                            Curves.easeInOut,
                          );
                        },
                      ),

                    const Spacer(),

                    Row(
                      children: List.generate(
                        pages.length,
                            (i) => AnimatedContainer(
                          duration: const Duration(
                              milliseconds: 300),
                          margin:
                          const EdgeInsets
                              .symmetric(
                              horizontal:
                              3),
                          width: currentIndex == i
                              ? 18
                              : 6,
                          height: 6,
                          decoration:
                          BoxDecoration(
                            color: currentIndex ==
                                i
                                ? AppColors.primaryLight
                                : Colors.grey,
                            borderRadius:
                            BorderRadius
                                .circular(10),
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    _circleButton(
                      icon: currentIndex ==
                          pages.length - 1
                          ? Icons.check
                          :Icons.arrow_forward_ios
                          ,
                      onTap: () async {
                        if (currentIndex <
                            pages.length - 1) {
                          controller.nextPage(
                            duration:
                            const Duration(
                                milliseconds:
                                300),
                            curve: Curves
                                .easeInOut,
                          );
                        } else {
                          await finish();
                          Navigator
                              .pushReplacementNamed(
                              context,
                              "/home");
                        }
                      },
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white),
      ),
    );
  }
}