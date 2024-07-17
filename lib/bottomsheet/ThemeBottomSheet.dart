import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/MyProvider.dart';
import 'package:provider/provider.dart';

class ThemeingBottomSheet extends StatelessWidget {
  const ThemeingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          InkWell(
            onTap: () {
              provider.changeThemeing(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.themeingMode == ThemeMode.light
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary),
                ),
                Spacer(),
                provider.themeingMode == ThemeMode.light
                    ? Icon(Icons.done,
                        color: Theme.of(context).colorScheme.primary)
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeThemeing(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: provider.themeingMode == ThemeMode.dark
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary)),
                Spacer(),
                provider.themeingMode == ThemeMode.light
                    ? SizedBox.shrink()
                    : Icon(Icons.done,
                        color: Theme.of(context).colorScheme.primary)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
