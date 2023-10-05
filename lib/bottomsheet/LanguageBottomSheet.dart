import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Providers/MyProvider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.languageCode == "en"
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary)),
                Spacer(),
                provider.languageCode == "en"
                    ? Icon(Icons.done,
                        color: Theme.of(context).colorScheme.primary)
                    : SizedBox.shrink()
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.languageCode == "ar"
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary)),
                Spacer(),
                provider.languageCode == "en"
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
