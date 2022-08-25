import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

//register font licence
void registryFontLicence() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
