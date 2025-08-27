import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // location
  {
    'dtg4naz4': {
      'en': 'Select Location',
      'hi': '',
    },
    'yoglz31o': {
      'en': 'Confirm Pickup Location',
      'hi': '',
    },
  },
  // Payment
  {
    'yflis9lj': {
      'en': 'Complete Your Booking',
      'hi': '',
    },
    'gyvcxehr': {
      'en': 'Estimated Price',
      'hi': '',
    },
    'l0ngh7uy': {
      'en': 'Select Payment Method',
      'hi': '',
    },
    'tjorzb77': {
      'en': 'UPI Payment',
      'hi': '',
    },
    '88evq1q5': {
      'en': 'Pay using any UPI app',
      'hi': '',
    },
    'hhb8na7b': {
      'en': 'Credit/Debit Card',
      'hi': '',
    },
    'v6gmgfv9': {
      'en': 'Visa, Mastercard, RuPay',
      'hi': '',
    },
    'jpa2o2xt': {
      'en': 'Cash After Service',
      'hi': '',
    },
    '5jwiho1r': {
      'en': '100% Secure Payments',
      'hi': '',
    },
    '16qyu4kw': {
      'en': 'Your payment information is encrypted and secure',
      'hi': '',
    },
    'uj7yia73': {
      'en': 'Powered by Razorpay',
      'hi': '',
    },
    'mtokpwaa': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    'vit407sn': {
      'en': '•',
      'hi': '',
    },
    'hzdyt3ri': {
      'en': 'Refund Policy',
      'hi': '',
    },
    '23z7lieu': {
      'en': '•',
      'hi': '',
    },
    'fyor2c5g': {
      'en': 'Support',
      'hi': '',
    },
    'dsbrczfe': {
      'en': 'Cash After Service',
      'hi': '',
    },
  },
  // profile
  {
    'ke5xjtrw': {
      'en': 'Your Account',
      'hi': '',
    },
    'gc8sikbg': {
      'en': 'Edit Profile',
      'hi': '',
    },
    'mv1k4erx': {
      'en': 'Notification Settings',
      'hi': '',
    },
    'qfo3bef8': {
      'en': 'App Settings',
      'hi': '',
    },
    'ym6ywgxs': {
      'en': 'Support',
      'hi': '',
    },
    'eqxuexc8': {
      'en': 'Terms of Service',
      'hi': '',
    },
    'paa68kdj': {
      'en': 'LOG OUT',
      'hi': '',
    },
    'h20c0eqj': {
      'en': 'Home',
      'hi': '',
    },
  },
  // loginpage
  {
    'rsexw9y1': {
      'en': 'CoolieGo',
      'hi': '',
    },
    'heudh3ql': {
      'en': 'Your trusted porter service, anytime, anywhere!',
      'hi': '',
    },
    '15bifqj8': {
      'en': 'Welcome Back!',
      'hi': '',
    },
    'as6zt4yd': {
      'en': 'Please enter your mobile number to continue',
      'hi': '',
    },
    'y2e61v1w': {
      'en': 'Enter your mobile number',
      'hi': '',
    },
    'f9xsh5rm': {
      'en': 'Please enter a valid 10-digit mobile number',
      'hi': '',
    },
    'i25dpvog': {
      'en': 'Send OTP',
      'hi': '',
    },
  },
  // OTPverification
  {
    'rdqpqido': {
      'en': 'OTP VERIFICATION',
      'hi': '',
    },
    'tn70wz72': {
      'en': 'Didn\'t get code? ',
      'hi': '',
    },
    'f5rotm6j': {
      'en': 'RESEND',
      'hi': '',
    },
    'pptn2knz': {
      'en': 'verify OTP',
      'hi': '',
    },
    'mri08kig': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Confirmationpage
  {
    'qpx6ifdz': {
      'en': 'Order Confirmation',
      'hi': '',
    },
    '69i6z8iy': {
      'en': 'Your Coolie booking has been successful!',
      'hi': '',
    },
    'dp5omn4x': {
      'en': 'Booking Details',
      'hi': '',
    },
    'j2c5kx5j': {
      'en': 'Assigned Coolie:',
      'hi': '',
    },
    'mej4zyi7': {
      'en': 'Ramesh',
      'hi': '',
    },
    'a5lz1yml': {
      'en': 'Preferred Time:',
      'hi': '',
    },
    '9qxe5e7u': {
      'en': '12:30 PM',
      'hi': '',
    },
    'ea66dqtn': {
      'en': 'Cancellation Charges:',
      'hi': '',
    },
    'c86amhft': {
      'en': '₹50',
      'hi': '',
    },
    '9li20i3l': {
      'en': 'Waiting Charges:',
      'hi': '',
    },
    '36e8zsob': {
      'en': '₹50 per hour',
      'hi': '',
    },
    'wint8cfi': {
      'en': 'Coolie Live Location',
      'hi': '',
    },
    'm7t6bel3': {
      'en': 'Cancel Booking',
      'hi': '',
    },
    '9jmyrqov': {
      'en': 'Track Coolie',
      'hi': '',
    },
  },
  // helpcentre
  {
    'gd67re8g': {
      'en': 'Help Centre',
      'hi': '',
    },
    'pznl0qqs': {
      'en': 'Need assistance? We\'re here to help!',
      'hi': '',
    },
    'cpt4zkq2': {
      'en': 'Helpline Number:',
      'hi': '',
    },
    'y409jc9n': {
      'en': '+91 xxxxxx',
      'hi': '',
    },
    'aqnh9z0g': {
      'en': '📞 Call Us',
      'hi': '',
    },
    'bm4tdtju': {
      'en': '💬 Message Centre',
      'hi': '',
    },
    '87kpurpp': {
      'en': '🛠 How can we assist you?',
      'hi': '',
    },
    '92zeq6sj': {
      'en': '📦 Booking Issues',
      'hi': '',
    },
    'ykbcap9e': {
      'en': 'Help with your bookings',
      'hi': '',
    },
    'dj6n22q4': {
      'en': '📍 Location & Tracking',
      'hi': '',
    },
    'zsyq4dam': {
      'en': 'Track your deliveries',
      'hi': '',
    },
    'fuvej2es': {
      'en': '💰 Payments & Refunds',
      'hi': '',
    },
    'reebfwpm': {
      'en': 'Payment issues and refund status',
      'hi': '',
    },
    'ky6chu6g': {
      'en': '❌ Cancellations & Charges',
      'hi': '',
    },
    'pz1gl8tn': {
      'en': 'Help with cancellations',
      'hi': '',
    },
    'pkw13wfh': {
      'en': '🔄 Other Queries',
      'hi': '',
    },
    'it4fnxow': {
      'en': 'Additional support',
      'hi': '',
    },
    'texbeqh2': {
      'en': 'Our support team is available 24/7 to assist you!',
      'hi': '',
    },
  },
  // helpmesasages
  {
    'j3i1u2fa': {
      'en': 'Cancellation Policy',
      'hi': '',
    },
    '4mydiwp7': {
      'en':
          '• To cancel a booking, go to \'My Bookings\' and select the booking you wish to cancel.\n\n• Cancellation charges apply as follows:\n  - Free cancellation up to 24 hours before pickup\n  - 50% charge for cancellations within 24 hours\n  - 100% charge for no-shows\n\n• Refunds are processed within 5-7 business days, depending on your payment method and bank.\n\n• If you\'re unable to cancel through the app, please contact our support team immediately.',
      'hi': '',
    },
    'l6ingnmk': {
      'en': 'Booking Issues',
      'hi': '',
    },
    'e36wgwie': {
      'en':
          'If you\'re experiencing issues while booking, please try the following:\n\n• Check your internet connection and ensure it\'s stable\n\n• Restart the CoolieGo app and try again\n\n• If issues persist, you can book manually by contacting us via WhatsApp or phone call\n\n• For any other booking-related concerns, please reach out to our customer support team',
      'hi': '',
    },
    '4j1rp2aj': {
      'en': 'Payment & Refund Issues',
      'hi': '',
    },
    '0xmagn9i': {
      'en':
          '• If your payment fails, please check:\n  - Your card has sufficient balance\n  - Your card is enabled for online transactions\n  - Your bank isn\'t blocking the transaction\n\n• To check refund status, go to \'My Profile\' > \'Payment History\' > \'Refunds\'\n\n• Common reasons for transaction failures:\n  - Network connectivity issues\n  - Bank server downtime\n  - Incorrect card details\n  - Transaction limits exceeded',
      'hi': '',
    },
    'rxr6ngxs': {
      'en': 'Other Common Issues & Solutions',
      'hi': '',
    },
    'm2fciw89': {
      'en':
          '• Coolie not responding?\n  Try sending another request or contact support directly\n\n• Incorrect location detected?\n  Enable GPS permissions, restart the app, and ensure you have a clear signal\n\n• App crashes or errors?\n  - Clear app cache in your phone settings\n  - Update to the latest version of CoolieGo\n  - If problems persist, try uninstalling and reinstalling the app\n\n• Any other technical issues?\n  Contact our technical support team using the options below',
      'hi': '',
    },
    'tk1x7n6z': {
      'en': 'Contact Support',
      'hi': '',
    },
    '9j10vhbd': {
      'en':
          'Our support team is available 24/7 to assist you with any issues or questions.',
      'hi': '',
    },
    'raqxvlti': {
      'en': 'WhatsApp Support',
      'hi': '',
    },
    '65o9kyvr': {
      'en': '+91 7898988824',
      'hi': '',
    },
    'ixxyqqtn': {
      'en': 'cooliego.business@gmail.com',
      'hi': '',
    },
    'eu0ce7ec': {
      'en': 'Need Immediate Assistance?',
      'hi': '',
    },
    '8a3st7l0': {
      'en': 'Our team is ready to help you with any urgent issues.',
      'hi': '',
    },
    'v17n2afr': {
      'en': 'Contact Support Now',
      'hi': '',
    },
  },
  // messagecentre
  {
    'f1c8jep3': {
      'en': 'AI Assistant',
      'hi': '',
    },
    'xq0ymo80': {
      'en': '10:30 AM',
      'hi': '',
    },
    'vqaia6w4': {
      'en': '10:31 AM',
      'hi': '',
    },
    'hcpgmuj7': {
      'en':
          'New York is currently 72°F with partly cloudy skies. The forecast shows a high of 78°F and a low of 65°F today. The coordinates for New York City are approximately latitude 40.7128° N and longitude 74.0060° W.',
      'hi': '',
    },
    '6ytlsyjj': {
      'en': '10:32 AM',
      'hi': '',
    },
    'z92ddjh2': {
      'en': 'Type your message...',
      'hi': '',
    },
  },
  // selectservice
  {
    'r6s77zch': {
      'en': 'How can we help you today?',
      'hi': '',
    },
    'gatbtfps': {
      'en': 'Coolie Service',
      'hi': '',
    },
    '2lk3rxe7': {
      'en': 'Patient Transportation',
      'hi': '',
    },
  },
  // transit
  {
    '9h3ctio6': {
      'en': 'Where do you need help?',
      'hi': '',
    },
    '1tu1p1r8': {
      'en': 'Outside to Platform',
      'hi': '',
    },
    'ltalugjp': {
      'en': 'Platform to Outside',
      'hi': '',
    },
  },
  // username
  {
    'vbsvlqee': {
      'en': 'What\'s your name?',
      'hi': '',
    },
    'x73jlxkw': {
      'en': 'Enter your name',
      'hi': '',
    },
    'xnytj6x1': {
      'en': 'Enter your email (optional)',
      'hi': '',
    },
    'w0n0htyf': {
      'en': 'Submit',
      'hi': '',
    },
    'hac358m2': {
      'en': 'By submitting, you agree to our',
      'hi': '',
    },
    '3c1rqq9x': {
      'en': 'Terms of Service',
      'hi': '',
    },
  },
  // mappage
  {
    '32pi6pah': {
      'en': 'Selected Location',
      'hi': '',
    },
    'pmwcp42p': {
      'en': 'Drag map to position',
      'hi': '',
    },
    'eu7a5ttj': {
      'en': 'Confirm Location',
      'hi': '',
    },
    '5i3yvbqo': {
      'en': 'Select Location',
      'hi': '',
    },
  },
  // bookingpagenew3
  {
    '19uqkny2': {
      'en': 'CoolieGo',
      'hi': '',
    },
    '91a81zm2': {
      'en': 'Select Station',
      'hi': '',
    },
    'uzkdqz75': {
      'en': 'Choose your station',
      'hi': '',
    },
    '1stdiljb': {
      'en': 'Search stations...',
      'hi': '',
    },
    'rnnpnn0l': {
      'en': 'Raipur',
      'hi': '',
    },
    'ef2tj589': {
      'en': 'Nagpur',
      'hi': '',
    },
    'fisiz7bo': {
      'en': 'Delhi',
      'hi': '',
    },
    '6idp0gbt': {
      'en': 'Mumbai',
      'hi': '',
    },
    'ykia5nxc': {
      'en': 'Kolkata',
      'hi': '',
    },
    '2eivdjct': {
      'en': 'Pick Date & Time',
      'hi': '',
    },
    'x7jgtmkw': {
      'en': 'Select Weight',
      'hi': '',
    },
    'i7taykci': {
      'en': 'Choose weight range',
      'hi': '',
    },
    'tsyr0ckt': {
      'en': 'Search...',
      'hi': '',
    },
    'atxuskt9': {
      'en': '0-25 Kgs',
      'hi': '',
    },
    'a1nwh6wh': {
      'en': '25-50 Kgs',
      'hi': '',
    },
    'ggnmiss8': {
      'en': '50-200 Kgs',
      'hi': '',
    },
    'mppzuh9v': {
      'en': 'More Than 200Kgs',
      'hi': '',
    },
    'xht8dly1': {
      'en': 'Select No. of Bags',
      'hi': '',
    },
    'nu4rna9e': {
      'en': 'Choose number of bags',
      'hi': '',
    },
    'n232fsxd': {
      'en': 'Search...',
      'hi': '',
    },
    'w2928y06': {
      'en': '1',
      'hi': '',
    },
    'mnc8da5d': {
      'en': '2',
      'hi': '',
    },
    'of382x6l': {
      'en': '3',
      'hi': '',
    },
    'baqw4b6a': {
      'en': '4',
      'hi': '',
    },
    '7ehh1kwb': {
      'en': '5',
      'hi': '',
    },
    'v4c3xjcl': {
      'en': '6',
      'hi': '',
    },
    '7nosiyyc': {
      'en': '7',
      'hi': '',
    },
    'gulh2bu9': {
      'en': '8',
      'hi': '',
    },
    'xyyvkppn': {
      'en': '9',
      'hi': '',
    },
    'd5w3e8sv': {
      'en': '10',
      'hi': '',
    },
    'cj0ztfvv': {
      'en': '11',
      'hi': '',
    },
    't90pp9cz': {
      'en': '12',
      'hi': '',
    },
    'nktw10aa': {
      'en': '13',
      'hi': '',
    },
    'ffuy6kb5': {
      'en': 'Train Number',
      'hi': '',
    },
    '0bio4xoe': {
      'en': 'Enter train number',
      'hi': '',
    },
    'cz51gjz5': {
      'en': 'Coach Name',
      'hi': '',
    },
    'qy7xnvzx': {
      'en': 'Enter coach name',
      'hi': '',
    },
    'maljno1g': {
      'en': 'Book via whatsapp?',
      'hi': '',
    },
    '8tepp746': {
      'en': 'Book Coolie',
      'hi': '',
    },
    '567diot3': {
      'en': 'MENU',
      'hi': '',
    },
    '4bv279fw': {
      'en': 'Edit >',
      'hi': '',
    },
    '9v2vfwha': {
      'en': 'Phone Number',
      'hi': '',
    },
    'rrp1ccl8': {
      'en': '#12345678',
      'hi': '',
    },
    'sthzlqzc': {
      'en': 'Explore Features',
      'hi': '',
    },
    '09azm5b4': {
      'en': 'My Rides',
      'hi': '',
    },
    'mjnil19x': {
      'en': 'Payment',
      'hi': '',
    },
    'sdkw2f8y': {
      'en': 'Notifications',
      'hi': '',
    },
    'jyz700ym': {
      'en': 'Safety',
      'hi': '',
    },
    '0p2a95hp': {
      'en': 'Help',
      'hi': '',
    },
    'l0008tr4': {
      'en': 'Settings',
      'hi': '',
    },
  },
  // onboarding1
  {
    '6nbxmbtq': {
      'en': 'Easy coolie booking & fair pricing',
      'hi': '',
    },
    'osa4lih8': {
      'en': 'reliable coolies at affordable rates',
      'hi': '',
    },
    '59ffy5ef': {
      'en': 'Awesome Recipes',
      'hi': '',
    },
    'znsi1nj4': {
      'en': 'I have some great food options here!! Yum yum!!',
      'hi': '',
    },
    'nuoueamx': {
      'en': 'Personalized recipe discovery',
      'hi': '',
    },
    'vvdrofu0': {
      'en': 'I have some great food options here!! Yum yum!!',
      'hi': '',
    },
    'ei5116c3': {
      'en': 'Next',
      'hi': '',
    },
    'pncqtylc': {
      'en': 'Skip',
      'hi': '',
    },
    'nh8sweei': {
      'en': 'Home',
      'hi': '',
    },
  },
  // waitingpage
  {
    '286ugqqa': {
      'en': 'Hang tight! We\'ll notify you as soon as a coolie accepts.',
      'hi': '',
    },
    'zdidzpvv': {
      'en': 'Waiting for a coolie to accept your request...',
      'hi': '',
    },
    'zlhm4jjf': {
      'en': 'Cancel Request',
      'hi': '',
    },
    'c9hm5a5u': {
      'en': 'CoolieGo',
      'hi': '',
    },
  },
  // historypagenew
  {
    'ixbsypkh': {
      'en': 'My Rides',
      'hi': '',
    },
    'sf13u1oo': {
      'en': 'No rides booked yet!',
      'hi': '',
    },
    '26rx99qc': {
      'en':
          'Your bookings will appear here once you schedule a ride with a coolie.',
      'hi': '',
    },
    'rgh07kax': {
      'en': 'Book a Coolie',
      'hi': '',
    },
    'qsfmltq2': {
      'en': 'Delhi Railway Station',
      'hi': '',
    },
    'utt658pe': {
      'en': 'Platform 3, Gate 2',
      'hi': '',
    },
    'g4f21e79': {
      'en': 'Confirmed',
      'hi': '',
    },
    '7b47uz0c': {
      'en': 'Date & Time',
      'hi': '',
    },
    '11h03pqn': {
      'en': 'May 15, 2023 • 14:30',
      'hi': '',
    },
    'pl35jmwe': {
      'en': 'Bags',
      'hi': '',
    },
    'ds05jxia': {
      'en': '3',
      'hi': '',
    },
    '3xyibvzu': {
      'en': 'View Details',
      'hi': '',
    },
    '124smu60': {
      'en': 'Mumbai Central',
      'hi': '',
    },
    '1jn53olr': {
      'en': 'Platform 1, Main Entrance',
      'hi': '',
    },
    'dm68f9ut': {
      'en': 'Completed',
      'hi': '',
    },
    '4qhjjm30': {
      'en': 'Date & Time',
      'hi': '',
    },
    'qhs8doip': {
      'en': 'April 28, 2023 • 09:15',
      'hi': '',
    },
    'ml15cbnk': {
      'en': 'Bags',
      'hi': '',
    },
    'l6ukxxih': {
      'en': '2',
      'hi': '',
    },
    'gxl815xx': {
      'en': 'View Details',
      'hi': '',
    },
    'tb7djxp2': {
      'en': 'Kolkata Howrah',
      'hi': '',
    },
    '1kktbr2z': {
      'en': 'Platform 5, East Exit',
      'hi': '',
    },
    'u1byi7sj': {
      'en': 'Cancelled',
      'hi': '',
    },
    'mvoho96p': {
      'en': 'Date & Time',
      'hi': '',
    },
    '8hz74aho': {
      'en': 'March 10, 2023 • 17:45',
      'hi': '',
    },
    '71rpsulg': {
      'en': 'Bags',
      'hi': '',
    },
    't8im2vi4': {
      'en': '4',
      'hi': '',
    },
    'l2v5x063': {
      'en': 'View Details',
      'hi': '',
    },
  },
  // payments
  {
    'hejn16h1': {
      'en': 'Payments',
      'hi': '',
    },
    '6k4q9x76': {
      'en': 'Link Wallets',
      'hi': '',
    },
    'kaizo992': {
      'en': 'Fast refunds & instant payments',
      'hi': '',
    },
    'r61u9xae': {
      'en': 'Amazon',
      'hi': '',
    },
    'tf1hu9vz': {
      'en': 'PhonePe',
      'hi': '',
    },
    '5ea191gl': {
      'en': 'Paytm',
      'hi': '',
    },
    'vo2vvl1h': {
      'en': 'Pay via UPI',
      'hi': '',
    },
    '8au8qb9c': {
      'en': 'Secure, fast, no extra charges',
      'hi': '',
    },
    '26xfrgfl': {
      'en': 'Google Pay',
      'hi': '',
    },
    'dkot3fbl': {
      'en': 'PhonePe',
      'hi': '',
    },
    'w244e4l8': {
      'en': 'Paytm',
      'hi': '',
    },
    'owzf4122': {
      'en': 'Pay Later',
      'hi': '',
    },
    '9fnioodg': {
      'en': 'Pay only after service',
      'hi': '',
    },
    'nilsfxgb': {
      'en': 'QR Scan',
      'hi': '',
    },
    '9myzeps9': {
      'en': 'at Drop',
      'hi': '',
    },
    '3d7n61sw': {
      'en': 'Simpl Link',
      'hi': '',
    },
    'qas03zhh': {
      'en': 'Cash',
      'hi': '',
    },
    '6hyf83nj': {
      'en': 'No internet required',
      'hi': '',
    },
  },
  // settings
  {
    '1n3ys98e': {
      'en': 'Settings',
      'hi': '',
    },
    '1vozz9ob': {
      'en': 'General',
      'hi': '',
    },
    'c6a6enrm': {
      'en': 'Profile',
      'hi': '',
    },
    'zl9erolg': {
      'en': 'About',
      'hi': '',
    },
    'njkq697z': {
      'en': 'Subscribe to Beta',
      'hi': '',
    },
    'q2y732zh': {
      'en': 'Get early access to new features',
      'hi': '',
    },
    'cvosomcm': {
      'en': 'Logout',
      'hi': '',
    },
  },
  // About
  {
    'rw2xkc8w': {
      'en': 'About',
      'hi': '',
    },
    'wtyhzub8': {
      'en': 'Privacy Policy',
      'hi': '',
    },
    'dvhhtaqs': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    '1ltn0y6h': {
      'en': 'Join the Team',
      'hi': '',
    },
    'e9aoyxo6': {
      'en': 'Blog',
      'hi': '',
    },
    'm0ss6b3o': {
      'en': 'Software Licenses',
      'hi': '',
    },
    'yybr25f6': {
      'en': 'Version 1.0.3',
      'hi': '',
    },
  },
  // SoftwareLicenses
  {
    '5j2txqk9': {
      'en': 'Software Licenses',
      'hi': '',
    },
    'l9i15xab': {
      'en':
          'This app is developed using Flutter and Firebase technologies and includes open-source software. The following licenses apply:',
      'hi': '',
    },
    'uzun8mbj': {
      'en': '🔹',
      'hi': '',
    },
    'iwb93qtb': {
      'en': 'Flutter & Dart SDK',
      'hi': '',
    },
    'eur6yj1b': {
      'en': 'License: BSD 3-Clause License',
      'hi': '',
    },
    'ck9ydhnp': {
      'en':
          'Flutter and Dart are provided by Google and licensed under the BSD license.',
      'hi': '',
    },
    'bvnqdrbl': {
      'en': 'Website: https://flutter.dev',
      'hi': '',
    },
    'b8f8ipww': {
      'en': '🔹',
      'hi': '',
    },
    'wx3qed1d': {
      'en': 'Firebase SDK',
      'hi': '',
    },
    'lfidkipo': {
      'en': 'License: Apache License 2.0',
      'hi': '',
    },
    '0o78w934': {
      'en':
          'Firebase services like Authentication, Firestore, and Storage are used in this app.',
      'hi': '',
    },
    'iqimt2mb': {
      'en': 'Website: https://firebase.google.com',
      'hi': '',
    },
    'e5jtxkh2': {
      'en': '🔹',
      'hi': '',
    },
    'ui0oibzz': {
      'en': 'Third-Party Flutter Packages',
      'hi': '',
    },
    '7iabuqoy': {
      'en': 'Various Flutter packages are used, covered under these licenses:',
      'hi': '',
    },
    'f5q90ex9': {
      'en':
          '• MIT License – Most UI and utility packages\n• BSD License – Flutter core libraries\n• Apache 2.0 – Google/Firebase packages',
      'hi': '',
    },
    'kra991lp': {
      'en': '🔹',
      'hi': '',
    },
    'ptk6495i': {
      'en': 'Icons & Illustrations',
      'hi': '',
    },
    'ylmwoocc': {
      'en': 'Some icons/animations are sourced from:',
      'hi': '',
    },
    '3iaavpsh': {
      'en': '• LottieFiles.com\n• unDraw.co',
      'hi': '',
    },
    'jnulyr33': {
      'en':
          'These are free for commercial use with attribution where required.',
      'hi': '',
    },
    'wyk2p61z': {
      'en': '🔹',
      'hi': '',
    },
    'zbl6t3mu': {
      'en': 'Acknowledgments',
      'hi': '',
    },
    '3x5kq14k': {
      'en':
          'This app thanks the open-source community. All rights and trademarks belong to their respective owners.',
      'hi': '',
    },
    'r00nyuz0': {
      'en': 'Version: CoolieGo App – v1.0.0',
      'hi': '',
    },
  },
  // onboarding
  {
    'a5zixstj': {
      'en': 'Welcome to CoolieGo',
      'hi': '',
    },
    'dxosu8r9': {
      'en': 'India\'s first coolie booking platform',
      'hi': '',
    },
    'd57265yy': {
      'en':
          'Get help with your luggage at railway stations and airports across India',
      'hi': '',
    },
    'w18esyun': {
      'en': 'Key Features',
      'hi': '',
    },
    'hzbe9qw2': {
      'en': 'Travel Fast',
      'hi': '',
    },
    'qzkjj7tg': {
      'en': 'No more waiting in queues for luggage assistance',
      'hi': '',
    },
    '5bwwlaos': {
      'en': 'Easy Bookings',
      'hi': '',
    },
    'oqzet0wh': {
      'en': 'Book a coolie in just a few taps on your phone',
      'hi': '',
    },
    'h2mvrssu': {
      'en': 'Secure Baggage',
      'hi': '',
    },
    '4yx389hi': {
      'en': 'Track your luggage in real-time with verified coolies',
      'hi': '',
    },
    '8tzm7wkr': {
      'en': 'Enable Device Protection',
      'hi': '',
    },
    'pn49sl4p': {
      'en': 'We need a few permissions to provide you with the best experience',
      'hi': '',
    },
    'jro3kt5v': {
      'en': 'Location Access',
      'hi': '',
    },
    'gj2jpe1t': {
      'en': 'Required to find nearby coolies and track your luggage',
      'hi': '',
    },
    'aalh612i': {
      'en': 'Storage Access',
      'hi': '',
    },
    '981k8wtn': {
      'en': 'Required to store booking receipts and luggage photos',
      'hi': '',
    },
    'yqv193q3': {
      'en': 'Enable Admin Control',
      'hi': '',
    },
    'gf9a8ed9': {
      'en': 'Required for enhanced security and device protection',
      'hi': '',
    },
    '81iu1xs5': {
      'en': 'Grant Permissions',
      'hi': '',
    },
  },
  // chatinterface1
  {
    'fuv8900h': {
      'en': 'Chat with Support',
      'hi': '',
    },
    'qgdr999j': {
      'en': 'Hi there! How can I help you today?',
      'hi': '',
    },
    'yknr7xep': {
      'en': '10:30 AM',
      'hi': '',
    },
    'khcbm9u6': {
      'en':
          'I\'m having trouble with my recent order. Can you help me track it?',
      'hi': '',
    },
    'rs9x1vu7': {
      'en': '10:32 AM',
      'hi': '',
    },
    '7ubrfie7': {
      'en':
          'Of course! I\'d be happy to help you track your order. Could you please provide your order number?',
      'hi': '',
    },
    'dprbbues': {
      'en': '10:33 AM',
      'hi': '',
    },
    'kxvldade': {
      'en': 'My order number is #12345678',
      'hi': '',
    },
    'd37neo0r': {
      'en': '10:35 AM',
      'hi': '',
    },
    'kqcggzpv': {
      'en': 'Type your message...',
      'hi': '',
    },
  },
  // chatinterface2
  {
    'ov1w8l96': {
      'en': 'Hello! How can I help you today?',
      'hi': '',
    },
    'ptowfo2z': {
      'en': 'I need help with my account settings',
      'hi': '',
    },
    'uihb712p': {
      'en':
          'Sure, I can help with that. What specific settings are you trying to change?',
      'hi': '',
    },
    '4mv3xfmj': {
      'en': 'I want to update my notification preferences',
      'hi': '',
    },
    'x3a2rokw': {
      'en':
          'To update notification preferences, go to Settings > Notifications. There you can toggle which alerts you want to receive and how.',
      'hi': '',
    },
    'wrjwzvt6': {
      'en': 'Type your message...',
      'hi': '',
    },
  },
  // map1
  {
    '9m9tslcq': {
      'en': 'Selected Location',
      'hi': '',
    },
    'v0mte0w9': {
      'en': 'Latitude',
      'hi': '',
    },
    'tjajwm3n': {
      'en': '37.7749',
      'hi': '',
    },
    '3vnw2rj5': {
      'en': 'Longitude',
      'hi': '',
    },
    'svv4pq0n': {
      'en': '-122.4194',
      'hi': '',
    },
    'knomdcsl': {
      'en': 'Confirm Location',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    '0tdzgymq': {
      'en': '',
      'hi': '',
    },
    's5m4ilqe': {
      'en': '',
      'hi': '',
    },
    'hbmbftd9': {
      'en': '',
      'hi': '',
    },
    'xc8brbyd': {
      'en': '',
      'hi': '',
    },
    '0hhezrdz': {
      'en': '',
      'hi': '',
    },
    'm6eg08ur': {
      'en': '',
      'hi': '',
    },
    '9iswno92': {
      'en': '',
      'hi': '',
    },
    '2nykeg4z': {
      'en': '',
      'hi': '',
    },
    '1w20p4tb': {
      'en': '',
      'hi': '',
    },
    'srfdxxwv': {
      'en': '',
      'hi': '',
    },
    'sbdd9ykx': {
      'en': '',
      'hi': '',
    },
    'xgtqcwbz': {
      'en': '',
      'hi': '',
    },
    '1y8i9lzd': {
      'en': '',
      'hi': '',
    },
    'at2wuse7': {
      'en': '',
      'hi': '',
    },
    'aauu3q3h': {
      'en': '',
      'hi': '',
    },
    '7ri2hm5g': {
      'en': '',
      'hi': '',
    },
    'pz1kwl2i': {
      'en': '',
      'hi': '',
    },
    'ivvv4w5a': {
      'en': '',
      'hi': '',
    },
    '1f8z4k2u': {
      'en': '',
      'hi': '',
    },
    '3nakwkfa': {
      'en': '',
      'hi': '',
    },
    '3ko0qflq': {
      'en': '',
      'hi': '',
    },
    'uu1atzq6': {
      'en': '',
      'hi': '',
    },
    'igca24a5': {
      'en': '',
      'hi': '',
    },
    '8f9nz8wg': {
      'en': '',
      'hi': '',
    },
    'ovst7teh': {
      'en': '',
      'hi': '',
    },
    '8w91ttdn': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
