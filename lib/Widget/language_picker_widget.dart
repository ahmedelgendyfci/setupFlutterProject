import 'package:flutter/material.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/l10n/language_provider.dart';
import 'package:provider/provider.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    var locale = provider.locale ?? Locale('en');
    return DropdownButtonHideUnderline(
        child: DropdownButton(
      value: provider.locale ?? Locale('en'),
      icon: Container(
        width: 12,
      ),
      items: L10n.all.map((locale) {
        final flag = L10n.getFlag(locale.languageCode);
        // log(flag.toString());
        return DropdownMenuItem(
          child: Center(
            child: Text(
              flag,
              style: TextStyle(fontSize: 32),
            ),
          ),
          value: locale,
          onTap: () async {
            final provider =
                Provider.of<LanguageProvider>(context, listen: false);
            provider.setPrefLanguage(locale);
          },
        );
      }).toList(),
      onChanged: (_) {},
    ));
  }
}
