import 'package:event_app/l10n/app_localizations.dart';
import 'package:event_app/providers/app_language_provider.dart';
import 'package:event_app/providers/app_theme_provider.dart';
import 'package:event_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:event_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width*0.04,
          vertical: height*0.02
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          InkWell(
            onTap: (){
              //todo: change theme to dark
             themeProvider.changeTheme(ThemeMode.dark);
            },
            child:themeProvider.isDarkModeCheck() ?
            getSelectedItemWidget(language: AppLocalizations.of(context)!.dark):
            getUnselectedItemWidget(language: AppLocalizations.of(context)!.dark),
          ),
          SizedBox(height: height*0.02,),

          InkWell(
            onTap: (){
              //todo: change theme to light
              themeProvider.changeTheme(ThemeMode.light);
            },
            child:!(themeProvider.isDarkModeCheck())?
            getSelectedItemWidget(language: AppLocalizations.of(context)!.light):
            getUnselectedItemWidget(language:AppLocalizations.of(context)!.light),
          )
        ],
      ),
    );
  }

  Widget getSelectedItemWidget({required String language}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text( language,
          style: AppStyles.bold16Primary,),
        const Icon(Icons.check,color:AppColors.primaryLight,)
      ],
    );
  }

  Widget getUnselectedItemWidget({required String language}){
    return Text( language,
      style: AppStyles.bold16Black,);
  }
}
