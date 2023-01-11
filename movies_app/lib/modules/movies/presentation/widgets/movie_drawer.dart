import 'package:flutter/material.dart';
import 'package:movies_app/core/controllers/app_bloc.dart';
import 'package:movies_app/core/helpers/dependency_injection_helper.dart';
import 'package:movies_app/core/utils/app_strings.dart';

class MovieDrawer extends StatelessWidget {
  const MovieDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.cyan,
      elevation: 5,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Mostafa Borham'),
            accountEmail: Text('mostafa@gmail.com'),
            currentAccountPicture: CircleAvatar(),
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: Text(AppStrings.translate(AppStrings.languageBtn)),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  DependencyInjectionHelper.dihInstance<AppBloc>()
                      .add(ChangeLocalizationEvent(context: context));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(AppStrings.translate(AppStrings.logout)),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.brightness_6),
                title: Text(AppStrings.translate(AppStrings.appMode)),
                trailing: Switch(value: AppBloc.isDark, onChanged: (newMode){
                  Navigator.of(context).pop();
                  DependencyInjectionHelper.dihInstance<AppBloc>().add(ChangeAppModeEvent(isDarkMode: newMode));
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
