import 'package:event_app/home/tabs/profile/language/language_bottom_sheet.dart';
import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/providers/app_language_provider.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:event_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.02
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headlineLarge,),
            InkWell(
              onTap: (){
               showLanguageBottomSheet();
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: height*0.02
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width*0.04,
                  vertical: height*0.01
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primaryLight,
                    width: 2
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.appLanguage == 'en'?
                      AppLocalizations.of(context)!.english:
                      AppLocalizations.of(context)!.arabic,
                    style: AppStyles.bold20Primary,),
                    Icon(Icons.arrow_drop_down_outlined,
                    color: AppColors.primaryLight,size: 35,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) =>const LanguageBottomSheet() ,
    );
  }
}
