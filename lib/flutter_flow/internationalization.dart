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

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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
  // Home
  {
    't1qslyjm': {
      'en': 'Search Products',
      'ar': 'البحث عن المنتجات',
    },
    '261y1faf': {
      'en': 'Search products here...',
      'ar': 'ابحث عن المنتجات هنا...',
    },
    'c63vwxjh': {
      'en': 'Choose  ',
      'ar': 'اختر',
    },
    '1pavrmyc': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'oa94gzur': {
      'en': 'Shop Now',
      'ar': 'تسوق الآن',
    },
    '1vtrenwa': {
      'en': 'Newly ',
      'ar': 'تم إطلاقه',
    },
    '4sv21zk2': {
      'en': 'Launched',
      'ar': ' حديثاً',
    },
    'ou7tc5hf': {
      'en': 'Recently ',
      'ar': 'تم عرضه',
    },
    '04cadsqn': {
      'en': 'Viewed',
      'ar': 'شوهد',
    },
    '9cjn16ki': {
      'en': 'Popular ',
      'ar': 'الشائعة',
    },
    '6iol3bki': {
      'en': 'Picks',
      'ar': 'شائعه',
    },
    'wn35b45i': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'g6gl9ld6': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // testPage
  {
    'ox56ektc': {
      'en': 'Button',
      'ar': '',
    },
    '4hhr3lg3': {
      'en': 'Button',
      'ar': '',
    },
    'gx21u9ii': {
      'en': 'Discover Unique Collections',
      'ar': '',
    },
    'sqacgs2f': {
      'en': 'Discover Unique Collections',
      'ar': '',
    },
    'wbj26qne': {
      'en': 'Discover Unique Collections',
      'ar': '',
    },
    '2jmt97ps': {
      'en': 'CM',
      'ar': '',
    },
    'fikq5yy1': {
      'en': 'Search...',
      'ar': '',
    },
    '249yrzmf': {
      'en': 'CM',
      'ar': '',
    },
    'z8lk0911': {
      'en': 'M',
      'ar': '',
    },
    'gm53bspn': {
      'en': 'CM',
      'ar': '',
    },
    'cgbh0nkd': {
      'en': 'Button',
      'ar': '',
    },
    'jh4dyiy9': {
      'en': 'Page Title',
      'ar': '',
    },
    'gip7od34': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Highlights1
  {
    'rpbnet94': {
      'en': '1',
      'ar': '١',
    },
    'l4y7pv0l': {
      'en': '2',
      'ar': '٢',
    },
    'rs0ol1t1': {
      'en': '3',
      'ar': '٣',
    },
    '8u4huu60': {
      'en': 'Discover Unique',
      'ar': 'إكتشفي تشكيلات',
    },
    'rrt6tk5u': {
      'en': 'Collections',
      'ar': 'مجموعات',
    },
    'cmw2ef32': {
      'en':
          'Step into a world of elegance and exclusivity. Explore handpicked collections designed to elevate your style.',
      'ar':
          'ادخل عالمًا من الأناقة والتميّز. استكشف مجموعات منتقاة بعناية لارتقاء بذوقك.',
    },
    'y7298xyk': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '69j0xiop': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'pmcur5nz': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Entry
  {
    'zpqwywgd': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Register
  {
    'mdr4xs7c': {
      'en': 'Let’s Get started ',
      'ar': 'لنبدأ',
    },
    '12hxfdgi': {
      'en': 'Create an account to continue',
      'ar': 'أنشئ حسابًا للمتابعة',
    },
    'b0em9anj': {
      'en': 'First name',
      'ar': 'الإسم الأول',
    },
    'yy5p7xji': {
      'en': '*',
      'ar': '*',
    },
    '1bb39xpk': {
      'en': 'Name *',
      'ar': 'الاسم *',
    },
    'f88vmyid': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    'bpzkb8xc': {
      'en': 'Email ',
      'ar': 'البريد الإلكتروني',
    },
    '8z6mfny6': {
      'en': '*',
      'ar': '*',
    },
    'skghnwpf': {
      'en': 'Name *',
      'ar': 'الاسم *',
    },
    'n6nq4dxp': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '4mj8qyiq': {
      'en': 'Password ',
      'ar': 'كلمة المرور',
    },
    '89csp913': {
      'en': '*',
      'ar': '*',
    },
    'kvn6ngs6': {
      'en': 'Email *',
      'ar': 'البريد الإلكتروني*',
    },
    'pbtpywrw': {
      'en': 'Password',
      'ar': 'أدخل كلمة المرور الخاصة بك',
    },
    '9jpp558a': {
      'en': 'Confirm Password ',
      'ar': 'تأكيد كلمة المرور',
    },
    'da8e4fhl': {
      'en': '*',
      'ar': '*',
    },
    'cv7ghf5f': {
      'en': 'Email *',
      'ar': '',
    },
    '5knljmiu': {
      'en': 'Confirm Password',
      'ar': 'أدخل كلمة المرور الخاصة بك للتأكيد',
    },
    'ih6rucx8': {
      'en': 'Phone Number ',
      'ar': 'رقم التليفون',
    },
    'h9nbiyjf': {
      'en': '*',
      'ar': '*',
    },
    'evxipk8z': {
      'en': 'Email *',
      'ar': '',
    },
    'f0bhaq3e': {
      'en': 'Kuwait',
      'ar': 'Kuwait',
    },
    'wsk10cv3': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    'id2tqycj': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'g6l5562r': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    'ux2se8s9': {
      'en': 'or sign in with',
      'ar': 'أو سجل بوساطة',
    },
    'snd7grb8': {
      'en': 'Confirm',
      'ar': 'تأكيد',
    },
    'ckyeocj4': {
      'en': 'By continuing you agree ',
      'ar': 'من خلال الاستمرار فإنك توافق ',
    },
    '3mb9be7t': {
      'en': 'Terms of Services ',
      'ar': 'شروط الخدمة ',
    },
    'bne3uci7': {
      'en': '& ',
      'ar': '&',
    },
    'nkd7g189': {
      'en': 'Privacy Policy ',
      'ar': 'سياسة الخصوصية ',
    },
    'jcvh9orz': {
      'en': 'Already have an account ? ',
      'ar': 'هل لديك حساب؟',
    },
    'tr12v7m6': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    'ruo8xm13': {
      'en': 'Please enter username',
      'ar': 'الرجاء إدخال اسم المستخدم',
    },
    'dc8vjxan': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't4oc08bj': {
      'en': 'Please provide a valid email ',
      'ar': 'يرجى تقديم بريد إلكتروني صالح',
    },
    'ewazh1d8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'eeu8wrud': {
      'en': 'Please enter password',
      'ar': 'الرجاء إدخال كلمة المرور',
    },
    '5z96ccit': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'y1pqo5uz': {
      'en': 'Enter Your confirm password',
      'ar': 'الرجاء تأكيد إدخال كلمة المرور',
    },
    'clld053t': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'r9p4a69z': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    'e75o7cxi': {
      'en': 'Enter correct number',
      'ar': 'أدخل الرقم الصحيح',
    },
    'gl0iq18j': {
      'en': 'Enter correct number',
      'ar': 'أدخل الرقم الصحيح',
    },
    'vkvmd8f3': {
      'en': 'Invalid phone number ',
      'ar': 'رقم هاتف غير صالح',
    },
    'jp6h5wtr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'msqks0i9': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Shop
  {
    'wtd5s078': {
      'en': 'Search Products',
      'ar': 'بحث',
    },
    '76onb21h': {
      'en': 'Shop by',
      'ar': 'تسوّق حسب',
    },
    '43apeb42': {
      'en': 'DESIGNERS',
      'ar': 'المصممين',
    },
    'ayh7mntr': {
      'en': 'Shop by',
      'ar': 'تسوّق حسب',
    },
    'soc1z6fs': {
      'en': 'CREATORS',
      'ar': 'ُنّاع المحتوى',
    },
    '447tret0': {
      'en': 'Shop by',
      'ar': 'تسوّق حسب',
    },
    'iwz05azw': {
      'en': 'STORES',
      'ar': 'المحلات',
    },
    'yx0nbfsn': {
      'en': 'Categories ',
      'ar': 'الفئات',
    },
    'vmlldeif': {
      'en': 'Popular ',
      'ar': 'الشائعة',
    },
    'udcpl7k5': {
      'en': 'Picks',
      'ar': 'الاختيارات',
    },
    'bo9w3xj8': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'mnxm3yx9': {
      'en': ' results',
      'ar': 'اختيارا',
    },
    '7jplrpub': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'zukbwsf4': {
      'en': 'Shop',
      'ar': 'تسوق',
    },
    'j055jdqz': {
      'en': 'Shop',
      'ar': '',
    },
  },
  // Step1-Personal
  {
    '6xh5fzb8': {
      'en': 'ADD PICTURE',
      'ar': 'أضف صورة',
    },
    'utg069vl': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    'kyxkqnvr': {
      'en': '*',
      'ar': '*',
    },
    'dl0eomf9': {
      'en': 'Name *',
      'ar': 'الاسم',
    },
    'mnb8eq19': {
      'en': 'Enter your first name',
      'ar': '',
    },
    '06xq81sy': {
      'en': 'Last Name ',
      'ar': 'اسم العائلة',
    },
    'fn7mhsi3': {
      'en': '*',
      'ar': '*',
    },
    'gsdtnup7': {
      'en': 'Name *',
      'ar': 'الاسم',
    },
    'ud8mri0s': {
      'en': 'Enter last name',
      'ar': 'أدخل الاسم الأخير',
    },
    'stmlru7u': {
      'en': 'Gender ',
      'ar': 'الجنس',
    },
    'd91s5os5': {
      'en': '*',
      'ar': '',
    },
    'u17owf38': {
      'en': 'Date of Birth*',
      'ar': '',
    },
    'vpwfpsdg': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    'b7b6fbi7': {
      'en': 'Date of Birth ',
      'ar': 'تاريخ الميلاد',
    },
    '2mvtsbmq': {
      'en': '*',
      'ar': '*',
    },
    '8218fyrl': {
      'en': 'Date of Birth*',
      'ar': '',
    },
    'ztxv5y9b': {
      'en': 'Email ID ',
      'ar': ' البريد الإلكتروني',
    },
    'uv38bq8c': {
      'en': '*',
      'ar': '*',
    },
    '8eb07nyq': {
      'en': 'Email ID *',
      'ar': '',
    },
    'y4aeqo4c': {
      'en': 'Enter your email',
      'ar': '',
    },
    'xqqldqcp': {
      'en': 'Mobile Number ',
      'ar': 'رقم الجوال',
    },
    'yqyib8zg': {
      'en': '*',
      'ar': '*',
    },
    'co8rlf2e': {
      'en': 'Phone Number *',
      'ar': 'رقم الجوال',
    },
    'whgth3ke': {
      'en': 'Enter your mobile number',
      'ar': 'رقم الجوال',
    },
    '96qubmtp': {
      'en': 'Alternate Number ',
      'ar': 'رقم بديل',
    },
    'lgh41k9a': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    '80kkmv87': {
      'en': 'Kuwait',
      'ar': 'الكويت',
    },
    'lv4d2xh4': {
      'en': 'Please select...',
      'ar': 'يرجى التحديد...',
    },
    'f0qppnuc': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    'wnmsh70n': {
      'en': 'Enter your alternate number',
      'ar': '',
    },
    'bfai4w9t': {
      'en': 'Phone Number ',
      'ar': 'رقم التليفون',
    },
    'sm17qy6x': {
      'en': '*',
      'ar': '*',
    },
    'w9enzn9i': {
      'en': 'Email *',
      'ar': '',
    },
    '5ljvov7e': {
      'en': 'Kuwait',
      'ar': 'الكويت',
    },
    '9bikkzsm': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    'd32biumd': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '4stpyrdi': {
      'en': 'Enter your mobile number',
      'ar': 'رقم الجوال',
    },
    'fxe363tj': {
      'en': 'Please enter first name',
      'ar': 'الرجاء إدخال الاسم الأول',
    },
    'agy6bipk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xf9sfm1i': {
      'en': 'Please enter last name',
      'ar': 'الرجاء إدخال الاسم الأخير',
    },
    'moxa5d4a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wosvewvn': {
      'en': 'Please provide a valid email ',
      'ar': 'يرجى تقديم بريد إلكتروني صالح',
    },
    'cib4v0in': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'b1hqx6re': {
      'en': 'Please enter mobile number',
      'ar': 'الرجاء إدخال رقم الهاتف المحمول',
    },
    'h5ggzguk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3z42mn0s': {
      'en': 'Please enter alternative  number',
      'ar': '',
    },
    'o386q434': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    's3lpd1ct': {
      'en': 'Save',
      'ar': 'حفظ',
    },
    'd9yghwty': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // ProductList
  {
    '8xuv9a5b': {
      'en': 'Shop',
      'ar': 'تسوق',
    },
    '7jsyr0pw': {
      'en': 'Nothing here just yet…',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    '62dsuzl5': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نضف أي منتجات بعد. عُد لاحقًا — نعدك أن يكون الأمر جديرًا بالانتظار!',
    },
    'n0wbtc4t': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    'mjllv998': {
      'en': 'Nothing here just yet…',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    '8vybhunz': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نضف أي منتجات بعد. عُد لاحقًا — نعدك أن يكون الأمر جديرًا بالانتظار!',
    },
    'mf59fwjk': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    'y6cn22dp': {
      'en': 'Nothing here just yet… ',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    'opzbkv9r': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نجمع أي شيء بعد. زورونا قريبًا، نعدكم أن الأمر يستحق العناء!',
    },
    'go9cb3mx': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    'el76x0pb': {
      'en': 'Nothing here just yet… ',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    'no8qkuw2': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نجمع أي شيء بعد. زورونا قريبًا، نعدكم أن الأمر يستحق العناء!',
    },
    'amr0a0nw': {
      'en': 'Back to Shop',
      'ar': 'صفحة التسوق',
    },
    'xxkh5mj9': {
      'en': 'Nothing here just yet… ',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    '4m18fxc3': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نجمع أي شيء بعد. زورونا قريبًا، نعدكم أن الأمر يستحق العناء!',
    },
    '51830y3u': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    'u0qvqq8l': {
      'en': 'Nothing here just yet… ',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    'lnzvudpl': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نجمع أي شيء بعد. زورونا قريبًا، نعدكم أن الأمر يستحق العناء!',
    },
    '96x42ez3': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    'e5fkoc3o': {
      'en': 'Nothing here just yet… ',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    'ibnlwmmi': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نجمع أي شيء بعد. زورونا قريبًا، نعدكم أن الأمر يستحق العناء!',
    },
    '9tvh3354': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    'fhecz59f': {
      'en': 'Nothing here just yet… ',
      'ar': 'لا يوجد شيء هنا حتى الآن...',
    },
    '99r8wxux': {
      'en':
          'Looks like we haven’t stocked anything yet. Come back soon—we promise it’ll be worth it!',
      'ar':
          'يبدو أننا لم نجمع أي شيء بعد. زورونا قريبًا، نعدكم أن الأمر يستحق العناء!',
    },
    'orai85xs': {
      'en': 'Go to Shop',
      'ar': 'صفحة التسوق',
    },
    '5667jh1y': {
      'en': 'Sort By',
      'ar': 'فرز حسب',
    },
    'k5l8vj4u': {
      'en': 'Filter',
      'ar': 'تصفية حسب',
    },
    'xoyusk6s': {
      'en': 'Clear',
      'ar': 'مسح',
    },
    '6w3jo2sr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s2-Highlightsssbc
  {
    'ioh93djq': {
      'en': '1',
      'ar': '',
    },
    'va5lw5qu': {
      'en': 'Discover Unique',
      'ar': 'اكتشف المجموعات الفريدة',
    },
    'kgxp1ndm': {
      'en': 'Collections',
      'ar': 'مجموعات',
    },
    'dpjti66c': {
      'en':
          'Step into a world of elegance and exclusivity. Explore handpicked collections designed to elevate your style.',
      'ar':
          'ادخل عالمًا من الأناقة والتميّز. استكشف مجموعات منتقاة بعناية لارتقاء بذوقك.',
    },
    '6jp1cbzi': {
      'en': 'Next',
      'ar': '',
    },
    'w4hisjgo': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'b7vxkqh9': {
      'en': '2',
      'ar': '',
    },
    'kwf5ao33': {
      'en': 'Personalized',
      'ar': 'مخصّصة',
    },
    '9hxza4ie': {
      'en': ' Recommendations',
      'ar': 'توصيات',
    },
    'tp2qhne5': {
      'en':
          'Fashion that truly understands you. Our smart recommendation system curates styles based on your preferences, ensuring every suggestion aligns with your taste.',
      'ar':
          'أزياء تناسب ذوقك تماما. نظام التوصيات الذكي لدينا ينسّق أنماطًا بناءً على تفضيلاتك، ليضمن أن تتوافق كل اقتراحاتنا مع ذوقك.',
    },
    'pqhej5i2': {
      'en': 'Next',
      'ar': '',
    },
    'tzvzr4p3': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'rf6nrwjh': {
      'en': '3',
      'ar': '',
    },
    'pk6hzowt': {
      'en': 'Seamless Shopping ',
      'ar': '',
    },
    'u5xs2qwb': {
      'en': 'Experience',
      'ar': 'تجربة',
    },
    '26sbvfxy': {
      'en':
          'Shopping has never been this simple. Browse, select, and purchase your favorite items with ease. Enjoy a smooth, secure checkout process',
      'ar':
          'التسوّق لم يكن يومًا بهذه السهولة. تصفّح، واختر، واشترِ منتجاتك المفضلة بكل سلاسة. استمتع بعملية دفع آمنة وسهلة.\n',
    },
    'eij5vfef': {
      'en': 'Next',
      'ar': '',
    },
    'jas5pim0': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'qqzeq1k0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Highlights2
  {
    'cc28m8t7': {
      'en': '1',
      'ar': '١',
    },
    'wzdsg6ns': {
      'en': '2',
      'ar': '٢',
    },
    'mfxole92': {
      'en': '3',
      'ar': '٣',
    },
    '9vhff2fx': {
      'en': 'Personalized',
      'ar': 'مخصّصة',
    },
    'yqvkq7vf': {
      'en': 'Recommendations',
      'ar': 'التوصيات',
    },
    'x5tdjdbx': {
      'en':
          'Fashion that truly understands you. Our smart recommendation system curates styles based on your preferences, ensuring every suggestion aligns with your taste.',
      'ar':
          'أزياء  تناسب ذوقك تماما، نظامنا الذكي للإقتراحات يقدم لكي أنماطا مختارة بناء على تفضيلاتك لضمان توافق كل اقتراح مع ذوقك',
    },
    '0n62bx2a': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'osaifqg6': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'owuxwy9q': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Highlights3
  {
    'an3z5uhn': {
      'en': '1',
      'ar': '١',
    },
    'tr97mphi': {
      'en': '2',
      'ar': '٢',
    },
    'kvybp3md': {
      'en': '3',
      'ar': '٣',
    },
    '31r3kwpp': {
      'en': 'Seamless Shopping ',
      'ar': 'تجربة تسوق',
    },
    'k9us94sn': {
      'en': 'Experience',
      'ar': 'سلسة',
    },
    'xcvwl3j4': {
      'en':
          'Shopping has never been this simple. Browse, select, and purchase your favorite items with ease. Enjoy a smooth, secure checkout process',
      'ar':
          'التسوّق لم يكن يومًا بهذه السهولة. تصفّح، واختر، واشترِ منتجاتك المفضلة بكل سلاسة. استمتع بعملية دفع آمنة وسهلة',
    },
    '77042cho': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '4gileht4': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'd47tunnp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Step2-Measurements
  {
    'swp3rzy6': {
      'en': '1',
      'ar': '١',
    },
    'zf9dpcxu': {
      'en': '2',
      'ar': '٢',
    },
    'z5uowv7d': {
      'en': '3',
      'ar': '٣',
    },
    'x3omtdi1': {
      'en': 'We’ll create your perfect fit!',
      'ar': 'سوف نقوم بتصميم ما يناسبك تمامًا!',
    },
    'emoumv29': {
      'en': 'Share your measurements to help us craft styles just for you.',
      'ar': 'شاركنا مقاساتك لنصمّم أنماطًا مخصّصة لك.',
    },
    'gi7ttsfg': {
      'en': 'Height',
      'ar': 'الطول',
    },
    'wfye8775': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'mymvtu9z': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'lweho2g5': {
      'en': 'Search...',
      'ar': '',
    },
    '3j3n0xpx': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'nautychb': {
      'en': 'Weight',
      'ar': 'الوزن',
    },
    'gel79ib7': {
      'en': 'Kg',
      'ar': 'كجم',
    },
    '63lre1jp': {
      'en': 'Kg',
      'ar': 'كجم',
    },
    'hdfaw3jj': {
      'en': 'Search...',
      'ar': '',
    },
    'hskb9i4e': {
      'en': 'Kg',
      'ar': 'كجم',
    },
    'or66bpq2': {
      'en': 'Bust / Chest',
      'ar': 'الصدر / محيط الصدر',
    },
    'abwmvr0f': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'n6ykiit6': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'k7cjf9sj': {
      'en': 'Search...',
      'ar': '',
    },
    'z2n0d4ea': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'v8t44iud': {
      'en': 'Waist',
      'ar': 'الخصر',
    },
    '8jkgglej': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'uoztgb5n': {
      'en': 'Cm',
      'ar': 'سم',
    },
    's5gv7hxf': {
      'en': 'Search...',
      'ar': '',
    },
    '3gur1lu9': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '9ammd8ms': {
      'en': 'Hip',
      'ar': 'الورك',
    },
    'yrsad3qc': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'kwya9c08': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'zq90qgri': {
      'en': 'Search...',
      'ar': '',
    },
    '5ai6soqr': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'e1ngr8nb': {
      'en': 'Inseam',
      'ar': 'درزة داخلية',
    },
    'roz9c7pu': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '3qhfszjb': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'tple759z': {
      'en': 'Search...',
      'ar': '',
    },
    'lr3u0dky': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'jl72de75': {
      'en': 'Shoulder Width',
      'ar': 'عرض الكتفين',
    },
    '09qo7b9t': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'zn0p96mr': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '5fxj91gx': {
      'en': 'Search...',
      'ar': '',
    },
    'sd5jxzqp': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'rryqt0e2': {
      'en': 'Arm Length',
      'ar': 'طول الذراع',
    },
    'njuyp9ze': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '5c8h1qnu': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'rjxp1bip': {
      'en': 'Search...',
      'ar': '',
    },
    'lxmgm7e0': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '8grnqxjb': {
      'en': 'Field is required',
      'ar': '',
    },
    'ivrx5gps': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4i6uvje9': {
      'en': 'Field is required',
      'ar': '',
    },
    'nb16zns0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jnddmard': {
      'en': 'Field is required',
      'ar': '',
    },
    'kky1gibe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '96iwa9uo': {
      'en': 'Field is required',
      'ar': '',
    },
    '9czccjeq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wubc0dbt': {
      'en': 'Field is required',
      'ar': '',
    },
    'b3m7e42v': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x70pwqhx': {
      'en': 'Field is required',
      'ar': '',
    },
    'wlgho7ag': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'faeifuk4': {
      'en': 'Field is required',
      'ar': '',
    },
    'y5vyhtex': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'phxwe0ny': {
      'en': 'Field is required',
      'ar': '',
    },
    '6ufvce88': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gcz0jz3y': {
      'en': 'Save & Continue',
      'ar': 'حفظ ومتابعة',
    },
    'r44ajkcf': {
      'en': 'Skip',
      'ar': 'يتخطى',
    },
    '3iqn4ulr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Step3-PreferredStyle
  {
    '6udyql3c': {
      'en': '1',
      'ar': '١',
    },
    '5kf18vrh': {
      'en': '2',
      'ar': '٢',
    },
    'wtz3lefv': {
      'en': '3',
      'ar': '٣',
    },
    '6zy1at7f': {
      'en': 'Choose your preferred style',
      'ar': 'اختر أسلوبك المفضّل',
    },
    'ysszwr0q': {
      'en':
          'Select one or more styles you love. We’ll tailor recommendations to your preferences.',
      'ar':
          ' اختر نمطًا واحدًا أو أكثر تحبّه، وسنخصّص التوصيات وفقًا لتفضيلاتك.',
    },
    'r5r9k3tj': {
      'en': 'Save & Continue',
      'ar': 'حفظ ومتابعة',
    },
    'fu3wzgxh': {
      'en': 'Skip',
      'ar': 'يتخطى',
    },
    '92kut1qz': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Step4-ReferralCode
  {
    '3kvazbtc': {
      'en': '1',
      'ar': '١',
    },
    '846sf665': {
      'en': '2',
      'ar': '٢',
    },
    'reh323ar': {
      'en': '3',
      'ar': '٣',
    },
    'fxnddfmx': {
      'en': 'Do you have a referral code?',
      'ar': 'هل لديك رمز إحالة؟',
    },
    'iti7nczb': {
      'en':
          'Enter your referral code below to unlock exclusive benefits or discounts.',
      'ar': 'أدخل رمز الإحالة أدناه للحصول على مزايا أو خصومات حصرية.',
    },
    's7xp42zh': {
      'en': 'Enter referral code here ',
      'ar': 'أدخل رمز الإحالة هنا',
    },
    'ya1faaex': {
      'en': 'Enter your referral code here',
      'ar': '',
    },
    'vyo5uncc': {
      'en': 'XXXXXXXX',
      'ar': 'XXXXXXXX',
    },
    'vzik9jtp': {
      'en':
          'Referral code applied successfully! You’ve unlocked exclusive benefits.',
      'ar': 'تم تطبيق رمز الإحالة بنجاح! لقد حصلت على مزايا حصرية.',
    },
    '2753gd5y': {
      'en': 'Complete',
      'ar': 'إتمام',
    },
    '8v1686y8': {
      'en': 'Skip',
      'ar': 'يتخطى',
    },
    'xk08g523': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Login
  {
    '97r67i2i': {
      'en': 'Please Sign in',
      'ar': 'يرجى تسجيل الدخول',
    },
    'qb0g23bl': {
      'en': 'Access your account to enjoy a seamless experience.',
      'ar': 'ادخل إلى حسابك للاستمتاع بتجربة سلسة.',
    },
    '9x87bq8n': {
      'en': 'or sign in with',
      'ar': 'أو سجّل الدخول بواسطة',
    },
    '6e6yirt2': {
      'en': 'Email ',
      'ar': 'البريد الإلكتروني',
    },
    'm596szsz': {
      'en': '*',
      'ar': '*',
    },
    'o8xx12wm': {
      'en': 'Name *',
      'ar': 'الاسم',
    },
    'ew1zzgba': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'gzb3shhh': {
      'en': 'Password ',
      'ar': 'كلمة المرور',
    },
    'byil9vjv': {
      'en': '*',
      'ar': '*',
    },
    'vjr1plhc': {
      'en': 'Email *',
      'ar': 'البريد الإلكتروني',
    },
    'w3ad35f4': {
      'en': 'Enter your password',
      'ar': 'أدخل كلمة المرور',
    },
    'cztyc69u': {
      'en': 'Forgot your password?',
      'ar': 'هل نسيت كلمة المرور؟',
    },
    '3oylv2lf': {
      'en': 'Name *',
      'ar': '',
    },
    '2h7fm9lb': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    't2e9viw6': {
      'en': 'By continuing you agree ',
      'ar': 'بالمتابعة فإنك توافق على',
    },
    'a5amw58c': {
      'en': 'Terms of Services ',
      'ar': '',
    },
    'f89ed9uu': {
      'en': '& ',
      'ar': '',
    },
    'nrg96nui': {
      'en': 'Privacy Policy ',
      'ar': '',
    },
    'w942wu9j': {
      'en': 'Don’t have an account ? ',
      'ar': 'ليس لديك حساب؟',
    },
    '94c9zbou': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
    },
    'mch5wv38': {
      'en': 'Please provide a valid email ',
      'ar': 'يرجى تقديم بريد إلكتروني صالح',
    },
    'zww9jyxt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hxm35nyl': {
      'en': 'Please enter password',
      'ar': 'الرجاء إدخال كلمة المرور',
    },
    'ud2c5jrk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'a6xnvm6e': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Designers-List
  {
    'knh5m8h4': {
      'en': 'Designers Hub ',
      'ar': 'مركز المصممين',
    },
    'j6wlrhrb': {
      'en': 'Confusion while selecting \ndresses?',
      'ar': 'هل تشعرين بالارتباك أثناء اختيار الفساتين؟',
    },
    '9d8euxjc': {
      'en': 'Consult Now',
      'ar': 'استشر الآن',
    },
    'x0m15gce': {
      'en': 'Our ',
      'ar': 'مصممونا',
    },
    'ynfyymby': {
      'en': 'Designers',
      'ar': 'المصممون',
    },
    'cr2b1tlr': {
      'en':
          'Discover collections from our talented designers, bringing unique and exclusive fashion to you. Follow your favorites to stay updated on their latest creations.',
      'ar':
          'اكتشف مجموعات مصممينا الموهوبين الذين يجلبون إليك أزياء فريدة وحصرية. تابع المفضّلين لديك للبقاء على اطلاع بآخر تصاميمهم.\n',
    },
    '4fly72sy': {
      'en': 'Confusion while \nselecting dresses?',
      'ar': 'هل تشعرين بالارتباك أثناء اختيار الفساتين؟',
    },
    '8m1y3j9k': {
      'en': 'Consult Now',
      'ar': 'استشر الآن',
    },
    'pj1esee6': {
      'en': 'All Designer ',
      'ar': 'كل المصممين',
    },
    'pwu5bnzr': {
      'en': 'All',
      'ar': 'الكل',
    },
    'tucde2pp': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'vvmg98id': {
      'en': 'Following',
      'ar': 'المتابَعون',
    },
    'hsj1iqj2': {
      'en': 'All',
      'ar': 'الكل',
    },
    'c1slh3i5': {
      'en': 'Best Rated',
      'ar': 'الأعلى تقييمًا',
    },
    'owodwezx': {
      'en': 'Store',
      'ar': 'المتجر',
    },
    'kbntv617': {
      'en': 'All',
      'ar': 'الكل',
    },
    '28n811cb': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'gy6luqfa': {
      'en': 'Following',
      'ar': 'المتابَعون',
    },
    'rbpyuu4q': {
      'en': 'All',
      'ar': 'الكل',
    },
    'pcgm643a': {
      'en': 'Best Rated',
      'ar': 'الأعلى تقييمًا',
    },
    'c1ru0ojg': {
      'en': 'Formal',
      'ar': 'المتابَعون',
    },
    'ps7h58i4': {
      'en': 'All',
      'ar': 'الكل',
    },
    'kbahpuim': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'f51lm7sx': {
      'en': 'Following',
      'ar': 'التالي',
    },
    'ez53m93z': {
      'en': 'All',
      'ar': 'الكل',
    },
    'xi578rmv': {
      'en': 'Casual Designer ',
      'ar': 'مصمّم كاجوال',
    },
    'whg2jdvd': {
      'en': 'Best Rated',
      'ar': 'الأعلى تقييمًا',
    },
    'nophft4b': {
      'en': 'Wedding',
      'ar': 'زفاف',
    },
    'oytsxush': {
      'en': 'All',
      'ar': 'الكل',
    },
    'w14903nt': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'hpezoz3d': {
      'en': 'Following',
      'ar': 'المتابَعون',
    },
    '4egs6ue7': {
      'en': 'All',
      'ar': 'الكل',
    },
    'w3y5k180': {
      'en': 'Casual Designer ',
      'ar': 'مصمم غير رسمي',
    },
    'iq2iob1u': {
      'en': 'Best Rated',
      'ar': '',
    },
    'nfm0h86b': {
      'en': 'Party Wear',
      'ar': 'ملابس الحفلات',
    },
    'hn7zrls9': {
      'en': 'All',
      'ar': 'الكل',
    },
    '86tx2xmf': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'x4gqbhns': {
      'en': 'Following',
      'ar': 'التالي',
    },
    'ovs14rcm': {
      'en': 'All',
      'ar': 'الكل',
    },
    '0ilbyaqs': {
      'en': 'Casual Designer ',
      'ar': 'مصمم غير رسمي',
    },
    'cykz9jxn': {
      'en': 'Best Rated',
      'ar': '',
    },
    'lqv3gp0o': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Designer
  {
    'drxdtdyq': {
      'en': 'Designers Hub ',
      'ar': 'مركز المصممين',
    },
    'byvhcrrq': {
      'en': 'Follow',
      'ar': 'يتبع',
    },
    'jjj17hgu': {
      'en': 'Unfollow',
      'ar': 'إلغاء المتابعة',
    },
    'vl2fumil': {
      'en': 'Are you sure?',
      'ar': 'هل أنت متأكد؟',
    },
    'h1hkw04g': {
      'en': 'you want to unfollow this Designer?',
      'ar': 'هل تريد إلغاء متابعة هذا المصمم؟',
    },
    'gg5n7w4r': {
      'en': 'More Details',
      'ar': 'مزيد من التفاصيل',
    },
    'u219692s': {
      'en': 'Brief Bio :',
      'ar': 'نبذة مختصرة:',
    },
    '5kcv2ntv': {
      'en': 'Design Styles / Themes :',
      'ar': 'أساليب / ثيمات التصميم:',
    },
    '1tcwvfkg': {
      'en': 'Portfolio/Website Link',
      'ar': 'رابط المعرض / الموقع الإلكتروني',
    },
    'wk5wmrhr': {
      'en': 'Exclusive ',
      'ar': 'حصري',
    },
    '0tz8kaef': {
      'en': 'Collections',
      'ar': 'مجموعات',
    },
    't5j8jbzp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DesignerConsult
  {
    'fcbwmwrm': {
      'en': 'Designer Consult',
      'ar': '',
    },
    'b7nc39oj': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '46kivsg5': {
      'en': 'Find Consult',
      'ar': '',
    },
    'ffm1clg6': {
      'en': 'Semi albarah',
      'ar': 'ملابس غير رسمية',
    },
    'u1xjgg0t': {
      'en':
          'Designer consultant helping you choose the perfect outfit for any occasion with style and confidence. ',
      'ar':
          'ستشارية أزياء تساعدك في اختيار الإطلالة المثالية لأي مناسبة بثقة وأناقة.',
    },
    '92zxbf4x': {
      'en': 'Semi albarah',
      'ar': 'ملابس غير رسمية',
    },
    'bkji465m': {
      'en':
          'Designer consultant helping you choose the perfect outfit for any occasion with style and confidence. ',
      'ar':
          'ستشارية أزياء تساعدك في اختيار الإطلالة المثالية لأي مناسبة بثقة وأناقة.',
    },
    'ujfnqgx8': {
      'en': 'Semi albarah',
      'ar': 'ملابس غير رسمية',
    },
    't9cvvgtv': {
      'en':
          'Designer consultant helping you choose the perfect outfit for any occasion with style and confidence. ',
      'ar':
          'ستشارية أزياء تساعدك في اختيار الإطلالة المثالية لأي مناسبة بثقة وأناقة.',
    },
    'lt5o1b49': {
      'en': 'Your Bookings',
      'ar': 'حجوزاتك',
    },
    'q73cfi1w': {
      'en': 'Semi albarah',
      'ar': 'ملابس غير رسمية',
    },
    'llt8mgcj': {
      'en': '12:00 PM',
      'ar': '',
    },
    'nocr2xz4': {
      'en': '7th Nov, 2024',
      'ar': '',
    },
    'o0b5b46j': {
      'en': 'Enter waiting room',
      'ar': '',
    },
    '1gfpmct0': {
      'en': 'Semi albarah ',
      'ar': 'ملابس غير رسمية',
    },
    'wultpjbv': {
      'en': '12:00 PM',
      'ar': '',
    },
    '90qur1re': {
      'en': '7th Nov, 2024',
      'ar': '',
    },
    'kw4gtzyy': {
      'en': 'Enter waiting room',
      'ar': 'دخول غرفة الانتظار',
    },
    'd4wsc18y': {
      'en': 'Semi albarah',
      'ar': 'ملابس غير رسمية',
    },
    'uo60uicv': {
      'en': '12:00 PM',
      'ar': '',
    },
    'ggnwow05': {
      'en': '7th Nov, 2024',
      'ar': '',
    },
    'h6102kct': {
      'en': 'Enter waiting room',
      'ar': 'دخول غرفة الانتظار',
    },
    '4dpdu6ac': {
      'en': 'Semi albarah',
      'ar': 'ملابس غير رسمية',
    },
    '8tekttr9': {
      'en': '12:00 PM',
      'ar': '',
    },
    'kyiy9iog': {
      'en': '7th Nov, 2024',
      'ar': '',
    },
    '25onh3ev': {
      'en': 'Enter waiting room',
      'ar': 'دخول غرفة الانتظار',
    },
    'iz9acqdi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DesignerConsultDetails
  {
    'sdp1zjqu': {
      'en': 'Designer Consult',
      'ar': '',
    },
    'kj7b9wkl': {
      'en': '10 KD ',
      'ar': '',
    },
    'f9xlz1m2': {
      'en': '/ ',
      'ar': '',
    },
    '05blpn8x': {
      'en': 'hour',
      'ar': '',
    },
    'sto9noft': {
      'en': '146 ',
      'ar': '',
    },
    '508nrbkb': {
      'en': 'Consultations',
      'ar': '',
    },
    'aef3bd0s': {
      'en': ' Yrs ',
      'ar': '',
    },
    'g88jh6lv': {
      'en': 'Experience ',
      'ar': 'الخبرة',
    },
    'gy7vzo18': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    'a70rtkrw': {
      'en': 'Select Date',
      'ar': 'اختر التاريخ',
    },
    '462orx1t': {
      'en': 'Select Slot',
      'ar': 'اختر الموعد',
    },
    '9a93jlh4': {
      'en': '11:00 PM',
      'ar': '',
    },
    'igkuqne8': {
      'en': '11:00 PM',
      'ar': '',
    },
    'rdwcabcl': {
      'en': '12:00 AM',
      'ar': '',
    },
    'fluc0gut': {
      'en': '01:00 AM',
      'ar': '',
    },
    '9w0b3zh1': {
      'en': 'Preferred Consult Method ',
      'ar': '',
    },
    '1xwdn0pm': {
      'en': 'Zoom Meeting',
      'ar': 'اجتماع عبر زوم',
    },
    'uomf0bq2': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    'mzmvdinr': {
      'en': 'Option 1',
      'ar': '',
    },
    'mgv3s1yn': {
      'en': 'Option 2',
      'ar': 'الخيار 2',
    },
    'jge8y91b': {
      'en': 'Option 3',
      'ar': '',
    },
    'v56lopki': {
      'en': 'Book Appointment',
      'ar': 'احجز الموعد',
    },
    'wmyz0xvx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DesignerBookingComplete
  {
    'sd8ec3vp': {
      'en': 'Booking Complete',
      'ar': 'اكتمل الحجز',
    },
    'nc2z3kli': {
      'en': 'Thank You!',
      'ar': 'شكرًا لك!',
    },
    'ygkt2r99': {
      'en': 'Your Consult #BE12345 has been booked\nsuccessfully.',
      'ar': 'تم حجز استشارتك رقم BE12345 بنجاح.',
    },
    'foz94hap': {
      'en': 'We will send you an email to ',
      'ar': 'سنرسل إليك بريدًا إلكترونيًا على',
    },
    'e2xbjwos': {
      'en': 'johndoe@gmail.com ',
      'ar': 'johndoe@gmail.com',
    },
    '1lj4o8q7': {
      'en': 'with your booking details and invoice. ',
      'ar': 'متضمّنًا تفاصيل الحجز والفاتورة.',
    },
    'am6utgak': {
      'en': 'Time booked: ',
      'ar': '',
    },
    'jzr557r6': {
      'en': 'Tuesday, 03rd Dec 2024',
      'ar': '',
    },
    '4maajag8': {
      'en': ' | ',
      'ar': '',
    },
    'yyw70g61': {
      'en': '14:16 AST',
      'ar': '',
    },
    'a6vmulw8': {
      'en': 'See Bookings',
      'ar': 'عرض الحجوزات',
    },
    'gvtvc2vd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Creators
  {
    '445mldjb': {
      'en': 'Creators Hub ',
      'ar': 'منصة المبدعين',
    },
    '3nwbgzd9': {
      'en': 'Our ',
      'ar': 'مبدعونا',
    },
    'rdnyp0u0': {
      'en': 'Creators ',
      'ar': 'صناع المحتوى',
    },
    'ifa42y0z': {
      'en':
          'Browse through our featured Creators who bring you the latest styles and trends. Follow them to see curated selections and exclusive recommendations.',
      'ar':
          'تصفّح أبرز المبدعين لدينا الذين يقدّمون لك أحدث الأساليب والاتجاهات. تابعهم لرؤية مختارات منسّقة وتوصيات حصرية.\n',
    },
    'bzkrlgow': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '7kut8vgw': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'nst7p0t9': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'uxdp9stf': {
      'en': 'Following',
      'ar': 'المتابَعون',
    },
    'sf23yl78': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'fnkxbtam': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'fi7ekjly': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'wts05ndc': {
      'en': 'Best Rated',
      'ar': '',
    },
    'styqnzvy': {
      'en': 'No creator found!',
      'ar': 'لا يوجد شيء هنا حتى الآن!',
    },
    'xuy0818g': {
      'en':
          'Looks like there’s no data to show right now. Start exploring and discover amazing creators.',
      'ar':
          'يبدو أنه لا توجد بيانات لعرضها حاليًا. ابدأ الاستكشاف واكتشف مبدعين رائعين.',
    },
    'usfnod9k': {
      'en': 'Explore Creators',
      'ar': 'استكشف المبدعين',
    },
    'm43elsih': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
    '75z6xv4q': {
      'en': 'All',
      'ar': 'الكل',
    },
    'x5vul0f5': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'pbpj0bvc': {
      'en': 'Following',
      'ar': 'المتابَعون',
    },
    'nhlfa8f2': {
      'en': 'All',
      'ar': 'الكل',
    },
    's6jdef0m': {
      'en': 'All',
      'ar': 'الكل',
    },
    'nm949foq': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    '32fvo7ax': {
      'en': 'Following',
      'ar': 'المتابَعون',
    },
    'p79dc6ka': {
      'en': '',
      'ar': 'الجميع',
    },
    'sjbxzl97': {
      'en': 'Best Rated',
      'ar': '',
    },
    'pllmesie': {
      'en': 'Posts',
      'ar': 'دعامات',
    },
    '7ys9w1c3': {
      'en': 'Creator',
      'ar': '',
    },
  },
  // Creators-Individual
  {
    '0wohg4qc': {
      'en': 'Creators Hub ',
      'ar': 'مركز المبدعين',
    },
    'y87vjodx': {
      'en': 'Follow',
      'ar': 'يتبع',
    },
    'jeynp5el': {
      'en': 'Unfollow',
      'ar': 'إلغاء المتابعة',
    },
    'sosxaqkw': {
      'en': 'Are you sure?',
      'ar': 'هل أنت متأكد؟',
    },
    '1qdwfjk6': {
      'en': 'you want to unfollow this Creator?',
      'ar': 'هل تريد إلغاء متابعة هذا المنشئ؟',
    },
    'gyl6vmyq': {
      'en': 'Followers',
      'ar': 'المتابعون',
    },
    'a1sk801n': {
      'en': 'Followers',
      'ar': 'المتابعون',
    },
    'nazgvax1': {
      'en': 'Followers',
      'ar': 'المتابعون',
    },
    'obr2wm4b': {
      'en': 'Followers',
      'ar': 'المتابعون',
    },
    '40s2v8o9': {
      'en': 'Promotions',
      'ar': 'العروض الترويجية',
    },
    '8s50b6dh': {
      'en': 'Posts',
      'ar': 'دعامات',
    },
    't66jpo77': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Profile
  {
    '86ett282': {
      'en': 'Account',
      'ar': 'الحساب',
    },
    'jg8ajmo6': {
      'en': 'Collab Ready',
      'ar': 'جاهز للتعاون',
    },
    'gfbvdetm': {
      'en': 'ID',
      'ar': '',
    },
    'svbitsx5': {
      'en': 'AZYAA258746',
      'ar': '',
    },
    'q24km225': {
      'en': 'Creator',
      'ar': 'صانع محتوى',
    },
    'm1i75heh': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    '25cnqhhk': {
      'en': 'Become a \nDesigner',
      'ar': 'كن مصممًا',
    },
    'nx47r3kc': {
      'en': 'Become a \nCreator',
      'ar': 'كن مبدعًا',
    },
    'x45fgxa4': {
      'en': 'Creators',
      'ar': 'المبدعين',
    },
    'rdbxo1pm': {
      'en': ' Space',
      'ar': 'فضاء',
    },
    'qcus2z7s': {
      'en':
          'Unlock your full potential! Manage commissions, affiliates, and exclusive perk all in one place.',
      'ar':
          'اطلق العنان لإمكاناتك! أدِر العمولات، وروابط التسويق، والمزايا الحصرية في مكان واحد.',
    },
    'sw61lnwx': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
    },
    'lle2ffa0': {
      'en': 'English',
      'ar': 'English',
    },
    '4hskyp1k': {
      'en': 'العربية',
      'ar': 'العربية',
    },
    'lzh5teob': {
      'en': 'My Addresses',
      'ar': 'عناويني',
    },
    '3vv9j51q': {
      'en': 'My Orders',
      'ar': 'طلباتي',
    },
    'e7q8uxgt': {
      'en': 'Virtual Try on',
      'ar': 'تجربة افتراضية',
    },
    'ziyfhbfv': {
      'en': 'Azyaa Rewards & Loyalty Coupons',
      'ar': 'مكافآت وكوبونات ولاء أزيا',
    },
    'rq4qnntx': {
      'en': 'Gift Card & Wallet',
      'ar': 'بطاقة هدايا ومحفظة',
    },
    'bvmjlqn7': {
      'en': 'Coming Soon',
      'ar': 'قريباً',
    },
    'w06nnfwu': {
      'en': 'VIP Membership',
      'ar': 'عضوية كبار الشخصيات',
    },
    'cjxzjl2r': {
      'en': 'FAQ & Help Center',
      'ar': 'الأسئلة الشائعة ومركز المساعدة',
    },
    '5kouqtpy': {
      'en': 'Stylist Consultation',
      'ar': 'استشارة منسق أزياء',
    },
    'abqhukds': {
      'en': 'Coming Soon',
      'ar': 'قريباً',
    },
    'alpa60s4': {
      'en': 'Logout from my account',
      'ar': 'تسجيل الخروج من حسابى الشخصى',
    },
    '0cimvdys': {
      'en': 'Made for design enthusiast ',
      'ar': 'مصمّم لعشّاق التصميم',
    },
    '7qo2n8e5': {
      'en': 'Built with ',
      'ar': 'Built with ',
    },
    'h806huy0': {
      'en': '❤️ ',
      'ar': '❤️ ',
    },
    'wyneymyg': {
      'en': 'by ',
      'ar': 'by ',
    },
    '07wxar7o': {
      'en': 'websiteK ',
      'ar': 'websiteK ',
    },
    'mildlvar': {
      'en': 'Account',
      'ar': 'الملف الشخصى',
    },
  },
  // Profile-Edit
  {
    'sfc3x43s': {
      'en': 'Edit Profile ',
      'ar': 'تعديل الملف الشخصي',
    },
    'wa4e6hxr': {
      'en': 'My Info',
      'ar': 'معلوماتي',
    },
    '17ex7jyd': {
      'en': 'ADD PICTURE',
      'ar': 'أضف صورة',
    },
    '9lq6ut6i': {
      'en': 'First Name ',
      'ar': 'الاسم الأول',
    },
    'u2uzlj5h': {
      'en': '*',
      'ar': '*',
    },
    'lgrc85ie': {
      'en': 'Name *',
      'ar': '',
    },
    'w1k12a26': {
      'en': 'Enter your name',
      'ar': 'أدخل اسمك',
    },
    'dn59j0oi': {
      'en': 'Last Name ',
      'ar': 'اسم العائلة',
    },
    '6tbihkix': {
      'en': '*',
      'ar': '*',
    },
    'p7f4fa3m': {
      'en': 'Name *',
      'ar': '',
    },
    'fbue2crf': {
      'en': 'Enter your last name',
      'ar': 'أدخل اسمك الأخير',
    },
    'wyuodekp': {
      'en': 'Gender ',
      'ar': 'النوع',
    },
    'ggwpmab5': {
      'en': '*',
      'ar': '',
    },
    'a9135idf': {
      'en': 'Date of Birth*',
      'ar': '',
    },
    'xql7ubwn': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    'qosmere7': {
      'en': 'Date of Birth ',
      'ar': 'تاريخ الميلاد',
    },
    '9otv2ro5': {
      'en': '*',
      'ar': '*',
    },
    'ujkqk2n4': {
      'en': 'Date of Birth*',
      'ar': '',
    },
    'mgi777ny': {
      'en': 'Email ID ',
      'ar': 'معرف البريد الإلكتروني',
    },
    'lsk7va62': {
      'en': '*',
      'ar': '*',
    },
    'e7s9apnx': {
      'en': 'Email ID *',
      'ar': '',
    },
    's8qesk9c': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'sy4b1rk5': {
      'en': 'Mobile Number ',
      'ar': 'رقم الهاتف المحمول',
    },
    'wubtiy6j': {
      'en': '*',
      'ar': '*',
    },
    'nua9gydv': {
      'en': 'Phone Number *',
      'ar': 'أدخل رقم جوالك',
    },
    'bz8x3el6': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    '85rz6rwb': {
      'en': 'Alternate Number',
      'ar': 'الرقم البديل',
    },
    'avfglf9z': {
      'en': 'Alternate Number *',
      'ar': 'الرقم البديل',
    },
    'q4juw6k4': {
      'en': 'Enter your alternate number',
      'ar': 'الرقم البديل',
    },
    '7n8a14jb': {
      'en': 'Please enter first name',
      'ar': 'يرجى ادخال الاسم الاول',
    },
    '2v5rjwil': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'nvunjvhu': {
      'en': 'Please enter last name',
      'ar': 'الرجاء إدخال الاسم الأخير',
    },
    'wh6wyg0c': {
      'en': 'Invalid input',
      'ar': 'إدخال غير صالح',
    },
    'v01v5138': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'w51wdtel': {
      'en': 'Please provide a valid email',
      'ar': '',
    },
    'mmj9zfwd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xrufxojj': {
      'en': 'Please enter mobile number',
      'ar': '',
    },
    'h6xbl2xh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'mubrjipz': {
      'en': 'Enter your alternate number ',
      'ar': '',
    },
    'lmoe8vc2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't6ybbhtm': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'evsqz781': {
      'en': 'Measurement',
      'ar': 'القياسات',
    },
    'x19qr632': {
      'en': 'Add a New body Measurement',
      'ar': 'إضافة قياس جسم جديد',
    },
    'jx0t3jk9': {
      'en': 'Default',
      'ar': 'ديافول',
    },
    'cixngg7l': {
      'en': 'Height : ',
      'ar': 'ارتفاع : ',
    },
    '4ef1so7l': {
      'en': ' , ',
      'ar': '',
    },
    '2fieiwvl': {
      'en': 'Weight : ',
      'ar': 'وزن : ',
    },
    '1d9dvbfl': {
      'en': 'Hello World',
      'ar': '',
    },
    'konmxsal': {
      'en': 'Preferred Styles',
      'ar': 'الأنماط المفضلة',
    },
    '7bo8ucwy': {
      'en': 'Choose Your Style Preferences ',
      'ar': 'اختر تفضيلات أسلوبك',
    },
    'itlifrkm': {
      'en':
          'Select your favorite styles to personalize your shopping experience. We\'ll recommend outfits tailored just for you!',
      'ar':
          'اختر أنماطك المفضّلة لتخصيص تجربة التسوّق. سنوصي بإطلالات تناسبك تمامًا!',
    },
    'j65nopia': {
      'en': 'Save Styles',
      'ar': 'حفظ الأنماط',
    },
    'b4d3djo0': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'rop3sbaz': {
      'en': 'Logout from my account',
      'ar': 'تسجيل الخروج من حسابى الشخصى',
    },
    'mk6b88h0': {
      'en': 'Delete my account',
      'ar': 'حذف حسابي',
    },
    't00wctkm': {
      'en':
          'You will not be able to access your personal data including your old orders, saved address, payment methods etc.\n\nYour Personal Information, Usage Data, Connected Data will be deleted.',
      'ar':
          'لن تتمكن من الوصول إلى بياناتك الشخصية بما في ذلك الطلبات السابقة، والعناوين المحفوظة، وطرق الدفع، وغير ذلك.\n',
    },
    'd8o59cvx': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Welcome
  {
    'zs9ela05': {
      'en': 'Welcome to the shop ',
      'ar': 'مرحبا بكم في المتجر',
    },
    '9ux886iv': {
      'en': 'of luxury, ',
      'ar': 'ذو طابع فاخر ',
    },
    '7fa8gwk8': {
      'en': 'Azyaa',
      'ar': 'أزيا',
    },
    'rokieuvq': {
      'en': 'Let’s get your desired look with',
      'ar': 'لنُساعدك في الوصول إلى إطلالتك المنشودة',
    },
    'd24l0oui': {
      'en': 'our unique collections.',
      'ar': 'من خلال مجموعاتنا الفريدة.',
    },
    'tf54ymx0': {
      'en': 'English',
      'ar': '',
    },
    '4934t6f4': {
      'en': 'Arabic',
      'ar': '',
    },
    'f4dt9vw6': {
      'en': 'Let’s Begin',
      'ar': 'لنبدأ',
    },
    'xqwqv4i3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Register_Verification
  {
    'k0a45xfu': {
      'en': 'Verify your email',
      'ar': 'تحقّق من بريدك الإلكتروني',
    },
    '6sxef4ql': {
      'en':
          'Enter the 6-digit code sent to your email to continue your purchase.',
      'ar':
          'أدخل الرمز المكون من 6 أرقام المرسل إلى بريدك الإلكتروني لمواصلة عملية الشراء.',
    },
    '8vgrr7go': {
      'en': 'Verify and Continue',
      'ar': 'التحقق والاستمرار',
    },
    '6oj3abpc': {
      'en': 'Resend code in ',
      'ar': 'إعادة إرسال الرمز خلال',
    },
    'c6dv47eo': {
      'en': ' sec',
      'ar': 'ثانية',
    },
    'z8qtieqr': {
      'en': 'Resend OTP',
      'ar': 'إعادة إرسال رمز التحقق',
    },
    '1goj1rqc': {
      'en': 'Already have an account ? ',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    'e83ltvlz': {
      'en': 'Login',
      'ar': 'تسجيل الخروج',
    },
    '9c3zprex': {
      'en': 'Please enter valid code',
      'ar': 'يرجى إدخال رمز صالح',
    },
    '5wh7s2qc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Product
  {
    '54vo9rtg': {
      'en': 'Product',
      'ar': 'المنتج',
    },
    '86m6pgqo': {
      'en': 'Virtual Try on',
      'ar': 'التجربة الافتراضية',
    },
    '2qf7mxmd': {
      'en': 'Delivery charges excluded',
      'ar': 'لا تشمل رسوم التوصيل.',
    },
    'vhv11107': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    '8bv30j7e': {
      'en': 'Measurement',
      'ar': 'القياسات',
    },
    'k38a6iee': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    'o016908b': {
      'en': '* Returns Not Applicable for This Item',
      'ar': 'ا يمكن إرجاع هذا المنتج*',
    },
    '1c45r1ma': {
      'en': 'Tags',
      'ar': 'الوسوم',
    },
    'j2k1n981': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'cviiz2g7': {
      'en': 'Follow',
      'ar': 'متابعة',
    },
    'ceibnxuw': {
      'en': 'Follow',
      'ar': 'متابعة',
    },
    'wliy4nun': {
      'en': 'Unfollow',
      'ar': 'إلغاء المتابعة',
    },
    '0czkwi6a': {
      'en': 'Are you sure?',
      'ar': 'هل أنت متأكد؟',
    },
    '0kacteio': {
      'en': 'you want to unfollow this Designer?',
      'ar': 'هل تريد إلغاء متابعة هذا المصمم؟',
    },
    'cx6klrgv': {
      'en': 'Ratings and reviews',
      'ar': 'التقييمات والمراجعات',
    },
    '4ac9zw03': {
      'en': '5',
      'ar': '5',
    },
    'r4v5h7q2': {
      'en': '50%',
      'ar': '',
    },
    'pr363qtm': {
      'en': '4',
      'ar': '4',
    },
    'qtzmypb0': {
      'en': '50%',
      'ar': '',
    },
    'bzrylz3v': {
      'en': '3',
      'ar': '3',
    },
    'b9j2bnt4': {
      'en': '50%',
      'ar': '',
    },
    'j9q10jum': {
      'en': '2',
      'ar': '2',
    },
    'duu27h8j': {
      'en': '50%',
      'ar': '',
    },
    'fy1f1t7o': {
      'en': '1',
      'ar': '1',
    },
    'csozl64b': {
      'en': '50%',
      'ar': '',
    },
    '35s0i4pq': {
      'en': 'View More',
      'ar': 'عرض المزيد',
    },
    'o2g1qvgb': {
      'en': 'Bought ',
      'ar': 'مُشترى',
    },
    'e4fbjx4h': {
      'en': 'With',
      'ar': 'مع',
    },
    '91z1janp': {
      'en': 'Recommended for ',
      'ar': 'تم عرضه',
    },
    'n9u3bocu': {
      'en': 'You',
      'ar': ' حديثاً',
    },
    'vz37nhn5': {
      'en': 'Promote',
      'ar': 'يرقي',
    },
    'h05ej0tu': {
      'en': 'See Insights',
      'ar': '',
    },
    'dggmi9tv': {
      'en': 'Notify me!',
      'ar': 'أبلغني!',
    },
    'sm50rzpt': {
      'en': 'Promote',
      'ar': 'يرقي',
    },
    'a56vsja7': {
      'en': 'See Insights',
      'ar': '',
    },
    '3nfqta0i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s1-GiftCards
  {
    '1480vk6i': {
      'en': 'Gift Card & Wallet',
      'ar': '',
    },
    'ubt8qyi8': {
      'en': 'Gift Cards',
      'ar': '',
    },
    'btbwd687': {
      'en': 'Azyaa ',
      'ar': '',
    },
    '2w7egovc': {
      'en': 'eGift Card',
      'ar': 'بطاقة هدايا إلكترونية',
    },
    '4g0426ic': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '7c3hakda': {
      'en': '120 KD',
      'ar': '',
    },
    '35mokuzp': {
      'en': 'Azyaa ',
      'ar': '',
    },
    'go9ti5d4': {
      'en': 'eGift Card',
      'ar': 'بطاقة هدايا إلكترونية',
    },
    '3le9y8el': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'avhpun6p': {
      'en': '120 KD',
      'ar': '',
    },
    '27ywcgly': {
      'en': 'Azyaa ',
      'ar': '',
    },
    'edjvob97': {
      'en': 'eGift Card',
      'ar': 'بطاقة هدايا إلكترونية',
    },
    'jpwppmph': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'qtxkfjl3': {
      'en': '120 KD',
      'ar': '',
    },
    'fso4xks0': {
      'en': 'Azyaa ',
      'ar': '',
    },
    'qwickq5f': {
      'en': 'eGift Card',
      'ar': 'بطاقة هدايا إلكترونية',
    },
    'up4d1fus': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '5cpgdiik': {
      'en': '120 KD',
      'ar': '',
    },
    's5upn479': {
      'en': 'Azyaa ',
      'ar': '',
    },
    'liua6enn': {
      'en': 'eGift Card',
      'ar': 'بطاقة هدايا إلكترونية',
    },
    'cu93lrid': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '62d70c9h': {
      'en': '120 KD',
      'ar': '',
    },
    'blgppkzn': {
      'en': 'Azyaa ',
      'ar': '',
    },
    'ezhclr8y': {
      'en': 'eGift Card',
      'ar': 'بطاقة هدايا إلكترونية',
    },
    'adv7sykg': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '4xxp8z0v': {
      'en': '120 KD',
      'ar': '',
    },
    'utjqy9it': {
      'en': 'Wallet',
      'ar': 'المحفظة',
    },
    'ckt00pas': {
      'en': 'Available Balance',
      'ar': '',
    },
    '2u2795vj': {
      'en': '548 KD',
      'ar': '',
    },
    'giynoezk': {
      'en': 'Redeem Gift card',
      'ar': '',
    },
    'zoxpebaz': {
      'en': 'Recent ',
      'ar': 'العمليات',
    },
    '1009r7sh': {
      'en': 'Transaction',
      'ar': 'الحديثة',
    },
    '7mkhpvv7': {
      'en': 'All',
      'ar': 'الكل',
    },
    'qzde79lk': {
      'en': 'Credit History',
      'ar': 'سجل الإيداع',
    },
    'twpnsz0m': {
      'en': 'Debit History',
      'ar': '',
    },
    'hb6fpjdm': {
      'en': 'Gift card redeemed to wallet',
      'ar': '',
    },
    'ehgsea9m': {
      'en': 'Date : ',
      'ar': '',
    },
    'qi4d3lqp': {
      'en': '08 Nov, 2024',
      'ar': '',
    },
    'tnszzls9': {
      'en': 'Trxn ID : ',
      'ar': '',
    },
    't1lxns8j': {
      'en': 'ICICIKETAKIH7882778',
      'ar': '',
    },
    '4fyb4a7z': {
      'en': '+',
      'ar': '',
    },
    '0xfoampo': {
      'en': '250 KWD',
      'ar': '',
    },
    'pzp9nnbf': {
      'en': 'Gift card redeemed to wallet',
      'ar': '',
    },
    'ih5lc903': {
      'en': 'Date : ',
      'ar': '',
    },
    'mkxh3e27': {
      'en': '08 Nov, 2024',
      'ar': '',
    },
    '4f29533m': {
      'en': 'Trxn ID : ',
      'ar': '',
    },
    'o797va8d': {
      'en': 'ICICIKETAKIH7882778',
      'ar': '',
    },
    'rat8kwcx': {
      'en': '-',
      'ar': '',
    },
    'i28qrspu': {
      'en': '250 KWD',
      'ar': '',
    },
    '2tn01z2t': {
      'en': 'Create a Gift Card',
      'ar': '',
    },
    'llahokuu': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // s2-CreateaGiftCards
  {
    'pi5r9kut': {
      'en': 'Create a Gift Card',
      'ar': '',
    },
    'ywry4z0g': {
      'en': 'Make Every',
      'ar': 'اجعل كل',
    },
    'tgm0bw99': {
      'en': ' Occasion Special!',
      'ar': 'مناسبة مميّزة!\n',
    },
    'vallmih0': {
      'en': 'Send a personalized eGift card \nperfect for any occasion!',
      'ar': '',
    },
    '90thsm1v': {
      'en': 'eGift Card Price:',
      'ar': '',
    },
    '9zce3y1a': {
      'en': '20 KWD',
      'ar': '',
    },
    '2l2yc5o3': {
      'en': '80 KWD',
      'ar': '',
    },
    'kyy5qwy1': {
      'en': '70 KWD',
      'ar': '',
    },
    'v2lkipyd': {
      'en': '10 KWD',
      'ar': '',
    },
    'f2jmwh7p': {
      'en': '30 KWD',
      'ar': '',
    },
    '7gwhh861': {
      'en': '25 KWD',
      'ar': '',
    },
    'y3otm5gx': {
      'en': 'All',
      'ar': 'الكل\n',
    },
    '2qksozvz': {
      'en': 'Recipient Name ',
      'ar': '',
    },
    '4dm18f66': {
      'en': '*',
      'ar': '',
    },
    'n1v87xhq': {
      'en': 'Name *',
      'ar': 'الاسم\n',
    },
    'be4jennw': {
      'en': 'Enter Recipient Name',
      'ar': '',
    },
    'cta13q75': {
      'en': 'Recipient Phone Number ',
      'ar': '',
    },
    '37194wow': {
      'en': '*',
      'ar': '',
    },
    '0kaygycx': {
      'en': 'Name *',
      'ar': '',
    },
    '6w0bw34q': {
      'en': 'KW',
      'ar': '',
    },
    'cm2k8hcf': {
      'en': 'Enter phone number',
      'ar': '',
    },
    '9z5j8vx8': {
      'en': 'Message ',
      'ar': '',
    },
    'qx5l0kc3': {
      'en': '*',
      'ar': '',
    },
    'p2wed8ek': {
      'en': 'Name *',
      'ar': '',
    },
    'q0299tr0': {
      'en': 'Write your message here',
      'ar': '',
    },
    '5o2dutiw': {
      'en': 'Add to Bag',
      'ar': '',
    },
    '9ofhrrf0': {
      'en': 'Home',
      'ar': 'الرئيسية\n',
    },
  },
  // s3-GiftCardcustomamount
  {
    '91mraocn': {
      'en': 'Create a Gift Card',
      'ar': '',
    },
    'w826gs8u': {
      'en': 'Make Every',
      'ar': '',
    },
    'uuhl54co': {
      'en': ' Occasion Special!',
      'ar': '',
    },
    '4v7ecne4': {
      'en': 'Send a personalized eGift card \nperfect for any occasion!',
      'ar': '',
    },
    '97sxczgk': {
      'en': 'Choose or Enter the Amount ',
      'ar': '',
    },
    'ng1fbjpv': {
      'en': '*',
      'ar': '',
    },
    'ul0obxw2': {
      'en': 'Name *',
      'ar': 'الاسم *\n',
    },
    'pu57bpt7': {
      'en': 'Enter an amount (e.g., 50 KWD)',
      'ar': '',
    },
    '7so8xaao': {
      'en': 'Recipient Name ',
      'ar': '',
    },
    'wm00ayci': {
      'en': '*',
      'ar': '',
    },
    '27jyik0g': {
      'en': 'Name *',
      'ar': 'الاسم *\n',
    },
    'jnb3nyyf': {
      'en': 'Enter Recipient Name',
      'ar': '',
    },
    'kars7t5f': {
      'en': 'Recipient Phone Number ',
      'ar': '',
    },
    'bpwijhgz': {
      'en': '*',
      'ar': '',
    },
    'pqd4u4hn': {
      'en': 'Name *',
      'ar': 'الاسم *\n',
    },
    '3dpbrr7v': {
      'en': 'KW',
      'ar': '',
    },
    '9vg72fgk': {
      'en': 'Enter phone number',
      'ar': '',
    },
    'c8thi34h': {
      'en': 'Message ',
      'ar': '',
    },
    'l5yk8g7x': {
      'en': '*',
      'ar': '',
    },
    'vbptjvpd': {
      'en': 'Name *',
      'ar': '',
    },
    'q2ep8fbj': {
      'en': 'Write your message here',
      'ar': '',
    },
    '67vht9vu': {
      'en': 'Add  to Bag',
      'ar': '',
    },
    'yc62iqa0': {
      'en': 'Home',
      'ar': 'الرئيسية\n',
    },
  },
  // Phone
  {
    'q62fzdp0': {
      'en': 'Phone',
      'ar': 'الهاتف',
    },
    'bvfgbu54': {
      'en': 'Please select...',
      'ar': 'يرجى التحديد...\n',
    },
    '4w0yk5w9': {
      'en': 'Search...',
      'ar': 'بحث…\n',
    },
    '0x50acbx': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم جوالك\n',
    },
    'fjuv54hn': {
      'en': 'Get OTP',
      'ar': 'احصل على رمز التحقق\n',
    },
    'wv2sht0a': {
      'en': 'By continuing you agree ',
      'ar': 'بالمتابعة فإنك توافق على ',
    },
    'b25w6t4a': {
      'en': 'Terms of Services ',
      'ar': 'شروط الخدمة ',
    },
    'ai23awpj': {
      'en': '& ',
      'ar': 'و ',
    },
    'lg2cw4ee': {
      'en': 'Privacy Policy ',
      'ar': 'سياسة الخصوصية ',
    },
    'jnflpsmp': {
      'en': 'Already have an account ? ',
      'ar': 'لديك حساب بالفعل؟ ',
    },
    'f5mgkgtl': {
      'en': 'Login',
      'ar': 'تسجيل الخروج',
    },
    '4gzjut67': {
      'en': 'Please enter mobile number',
      'ar': 'يرجى إدخال رقم الجوال\n',
    },
    'au7ph3e4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة .\n',
    },
    'r14wmj0c': {
      'en': 'Home',
      'ar': 'الرئيسية\n',
    },
  },
  // Phone_Verification
  {
    '8aw7bzfi': {
      'en': 'Verify Your Mobile Number',
      'ar': 'التحقق من رقم هاتفك المحمول',
    },
    '4yn9k72d': {
      'en': 'Verify and Continue',
      'ar': 'التحقق والاستمرار',
    },
    'z514bll0': {
      'en': 'Resend code in ',
      'ar': 'إعادة إرسال الرمز في',
    },
    'wesm9xkz': {
      'en': ' sec',
      'ar': 'ثانية',
    },
    'cbrvwkwf': {
      'en': 'Resend OTP',
      'ar': 'إعادة إرسال OTP',
    },
    'orxznqxy': {
      'en': 'Already have an account ? ',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    'td9o0y0i': {
      'en': 'Login',
      'ar': 'تسجيل الخروج',
    },
    'exzlk6xc': {
      'en': 'Please enter valid code',
      'ar': 'الرجاء إدخال رمز صالح',
    },
    '6nv1i0ea': {
      'en': 'Home',
      'ar': 'الرئيسية\n',
    },
  },
  // Cart
  {
    '31smc32z': {
      'en': 'Total',
      'ar': 'الإجمالي\n',
    },
    '1n9dib45': {
      'en': 'Continue Shopping',
      'ar': 'الدفع',
    },
    'zf8tes1m': {
      'en': 'Checkout',
      'ar': 'إتمام الشراء\n',
    },
    'iknnzi9o': {
      'en': 'Bag',
      'ar': 'الحقيبة',
    },
    '1n7yy5xa': {
      'en': 'Home',
      'ar': 'الرئيسية\n',
    },
  },
  // s4-RedeemGiftCard
  {
    'r16bj9vm': {
      'en': 'Create a Gift Card',
      'ar': 'إنشاء بطاقة هدايا\n',
    },
    'hed9khh1': {
      'en': 'Stylish Choices Await!',
      'ar': 'خيارات أنيقة بانتظارك!',
    },
    '1s106zkm': {
      'en':
          'Use your wallet balance to buy this elegant dress and redefine your wardrobe.',
      'ar': 'استخدم رصيد محفظتك لشراء هذا الفستان الأنيق وتجديد إطلالتك.',
    },
    '3z484ovk': {
      'en': 'Shop Now',
      'ar': 'تسوّق الآن',
    },
    'ujho000y': {
      'en': 'Redeem Gift card ',
      'ar': 'استرداد بطاقة الهدايا',
    },
    '6rlku0v5': {
      'en': '*',
      'ar': '*',
    },
    'zgaxi12l': {
      'en': 'Name *',
      'ar': '*الاسم',
    },
    'fow2cvwa': {
      'en': 'Enter redeem code',
      'ar': 'أدخل رمز الاسترداد',
    },
    '18b3m4hz': {
      'en': 'Redeem',
      'ar': 'استرداد',
    },
    'vhhhqsx2': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Wishlist
  {
    '1b6wj01j': {
      'en': 'Wishlist',
      'ar': 'قائمة الرغبات',
    },
    'yk2lq0g9': {
      'en': 'Wishlist',
      'ar': 'قائمة الرغبات',
    },
    'hcvpn5cd': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'jx9cl3jd': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    'qd54v23b': {
      'en': 'Creator',
      'ar': 'الخالق',
    },
    'k2ml04ao': {
      'en': 'Product',
      'ar': 'منتج',
    },
    '6xm2684z': {
      'en': 'Product',
      'ar': 'الجميع',
    },
    'ioyocihf': {
      'en': 'Shared',
      'ar': 'مشترك',
    },
    'e3i4msgu': {
      'en': 'Viewed',
      'ar': 'تمت المشاهدة',
    },
    '9wt3ilyc': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '94jmk331': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    '3r9xst70': {
      'en': 'Creator',
      'ar': 'الخالق',
    },
    '33zgir4b': {
      'en': 'Product',
      'ar': 'منتج',
    },
    '7q0r80pj': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'a5wzcdd8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Checkout
  {
    'w0kp1et9': {
      'en': 'You’re just',
      'ar': 'الرئيسية',
    },
    'vxnsc3py': {
      'en': ' 2 KD ',
      'ar': '',
    },
    '5rxdgsyh': {
      'en': 'away from',
      'ar': 'أنت على بُعد',
    },
    '7jp8rejq': {
      'en': 'Free Delivery!',
      'ar': 'التوصيل مجانى!',
    },
    'v93kird2': {
      'en': 'add more product',
      'ar': 'أضف المزيد من المنتجات',
    },
    'ms8eb647': {
      'en': 'Ship to',
      'ar': 'الشحن إلى',
    },
    '1585wblc': {
      'en': 'Default',
      'ar': 'افتراضي',
    },
    'r4odwaxm': {
      'en': 'Billing info same as shipping info',
      'ar': 'معلومات الفوترة مماثلة لمعلومات الشحن',
    },
    'uc0201nn': {
      'en': 'Billing info same as shipping info',
      'ar': 'معلومات الفوترة مماثلة لمعلومات الشحن',
    },
    'k2geadvd': {
      'en': 'add new address',
      'ar': 'إضافة عنوان جديد',
    },
    'xwbwuxle': {
      'en': 'Delivery Method',
      'ar': 'طريقة التوصيل',
    },
    '2wum6bq5': {
      'en': 'Standard Delivery ',
      'ar': 'توصيل عادي',
    },
    'wt9qklyr': {
      'en': 'Arrives by Thursday, Nov 28',
      'ar': '',
    },
    'vylvinyu': {
      'en': '120 KD',
      'ar': '',
    },
    'ujbyasgn': {
      'en': 'Payment Method',
      'ar': '',
    },
    'dcljyjxi': {
      'en': 'All transactions are secured and encrypted',
      'ar': 'جميع المعاملات مؤمّنة ومشفّرة',
    },
    '6mk211e7': {
      'en': 'MyFatoorah',
      'ar': '',
    },
    'ef891ajw': {
      'en': ' Credit/Debit Card, Gpay, Apple pay & More',
      'ar': 'بطاقة ائتمان/خصم، GPay، Apple Pay والمزيد',
    },
    'ydfryfv3': {
      'en': 'Wallet Balance: 12 KD',
      'ar': '',
    },
    'phdbwm7r': {
      'en': 'Discount code or Gift card',
      'ar': 'رمز الخصم أو بطاقة الهدايا',
    },
    'i19n5w9w': {
      'en': 'Apply',
      'ar': 'تطبيق',
    },
    'zpnhfiwv': {
      'en': 'Apply Coupon',
      'ar': 'تطبيق القسيمة',
    },
    'kggm1pnd': {
      'en': 'Congrats, You saved ',
      'ar': 'مبروك لقد قمت بالحفظ',
    },
    'fcioe5wd': {
      'en': ' KD!',
      'ar': '',
    },
    'doucsv5q': {
      'en': 'Apply Coupon',
      'ar': 'تطبيق القسيمة',
    },
    'i0x8ncax': {
      'en': 'Coupon : ',
      'ar': 'قسيمة :',
    },
    'oxhcy8u9': {
      'en': ' applied',
      'ar': 'مُطبَّق',
    },
    'g76rqamx': {
      'en': 'Coupon AZYAA5 applied',
      'ar': 'تطبيق القسيمة',
    },
    '1avj7z6h': {
      'en': 'Remove',
      'ar': 'إزالة',
    },
    'e4u1z2bx': {
      'en': 'Subtotal',
      'ar': 'الإجمالي الجزئي',
    },
    '4t0pvodj': {
      'en': 'Shipping',
      'ar': 'الشحن',
    },
    'aj52gbwl': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'vfygyvwx': {
      'en': 'Proceed to Pay',
      'ar': 'المتابعة للدفع',
    },
    'hbdvewi0': {
      'en': 'Review & Pay',
      'ar': 'المراجعة والدفع',
    },
    'csh00ovt': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // s1-Rewards
  {
    'kn26df6y': {
      'en': 'Rewards & Coupons',
      'ar': '',
    },
    '4db9ce10': {
      'en': 'Rewards',
      'ar': 'المكافآت والقسائم',
    },
    'm20cciee': {
      'en': '50%',
      'ar': '',
    },
    'gzytzppv': {
      'en': 'You’re at the ',
      'ar': 'المكافئات',
    },
    'hxbvz11e': {
      'en': 'Gold Level ',
      'ar': 'أنت في',
    },
    'g3nwynyn': {
      'en': 'Enjoy 2x points on every purchase and exclusive perks!',
      'ar': 'استمتع بنقاط مضاعفة 2x على كل عملية شراء ومزايا حصرية!',
    },
    'ecnplc3q': {
      'en': 'Your Progress to the ',
      'ar': 'تقدّمك نحو',
    },
    '5irp50ou': {
      'en': 'Next Level',
      'ar': 'المستوى التالي',
    },
    'jfrmu6ei': {
      'en': 'Silver',
      'ar': 'فضّي',
    },
    'ddwm60vk': {
      'en': '75 ',
      'ar': '',
    },
    'ckirdfz7': {
      'en': '/',
      'ar': '',
    },
    'tniya02m': {
      'en': '100',
      'ar': '',
    },
    '3unxll9e': {
      'en': 'Gold',
      'ar': '',
    },
    '0uq1n688': {
      'en': '75 ',
      'ar': '',
    },
    'gvif0ka7': {
      'en': '/',
      'ar': '',
    },
    '6epzriff': {
      'en': '100',
      'ar': '',
    },
    'ptcdgtpq': {
      'en': 'Silver',
      'ar': '',
    },
    'mw131fa7': {
      'en': '75 ',
      'ar': '',
    },
    'cjlle37v': {
      'en': '/',
      'ar': '',
    },
    'tvo60b5f': {
      'en': '100',
      'ar': '',
    },
    'g32ejsz8': {
      'en': 'Unlock Platinum to enjoy 3x points, VIP membership, & more!',
      'ar':
          'افتح مستوى البلاتين للاستمتاع بنقاط ثلاثية 3x، وعضوية كبار الشخصيات، والمزيد!',
    },
    'jy86f5mp': {
      'en': 'Know Your ',
      'ar': 'اعرف ما يناسبك',
    },
    '5c6pdnzt': {
      'en': 'Levels',
      'ar': 'المستويات',
    },
    'b7g0hlxx': {
      'en':
          '• \tEarn 1 Point for every 1 KD spent. \n• \tFree shipping on orders above 20 KD.\n• \tBirthday Reward: 50 Bonus Points.',
      'ar':
          '-كسب نقطة واحدة مقابل كل 1 دينار كويتي -يتم إنفاقه   شحن مجاني على الطلبات التي تفوق 20 دينار كويتي',
    },
    'ssayqaz4': {
      'en':
          '•\t Earn 2x Points on every purchase.\n•  Priority access to new collections.\n•\t 10% discount on selected items.',
      'ar': '',
    },
    'cqqtbuom': {
      'en':
          '•\tEarn 3x Points on every purchase.\n•\tComplimentary 6-month VIP Membership. \n•\t15% discount on all items.',
      'ar': '',
    },
    'dzgkuhme': {
      'en': 'Shop Now to Earn More Points',
      'ar': '',
    },
    't8k8yhsu': {
      'en': 'Loyalty coupons',
      'ar': '',
    },
    'ojf86sdy': {
      'en': 'adidas',
      'ar': '',
    },
    '2c6k5jfk': {
      'en': '30% off in your next\nsupply purchase',
      'ar': '',
    },
    'hcq6f95q': {
      'en': '30',
      'ar': '',
    },
    '5jj0g412': {
      'en': '%',
      'ar': '',
    },
    'wevr96eh': {
      'en': '30%',
      'ar': '',
    },
    'z8p2dlvq': {
      'en': 'Discount',
      'ar': '',
    },
    '5ccv0fro': {
      'en': 'Valid till Mar 2025',
      'ar': '',
    },
    'g2ko0tdn': {
      'en': 'adidas',
      'ar': '',
    },
    'bwrgoa2x': {
      'en': '30% off in your next\nsupply purchase',
      'ar': '',
    },
    'liwq6z5s': {
      'en': '30',
      'ar': '',
    },
    'vuwsw2b9': {
      'en': '%',
      'ar': '',
    },
    'fq0p2ob9': {
      'en': '30%',
      'ar': '',
    },
    'nsbtddvx': {
      'en': 'Discount',
      'ar': '',
    },
    '022p198q': {
      'en': 'Valid till Mar 2025',
      'ar': '',
    },
    '8xm8tk6g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Membership
  {
    'fqsndz0u': {
      'en': 'Elevate Your Wardrobe',
      'ar': 'ارتقِ بخزانة ملابسك',
    },
    'dw8bptx5': {
      'en':
          'Join our VIP Membership for exclusive designs, early access, and personalized perks tailored just for you!\"',
      'ar':
          'انضم إلى عضوية كبار الشخصيات VIP للحصول على تصاميم حصرية، ووصول مبكر، ومزايا مخصّصة لك!',
    },
    'r0uai2oo': {
      'en': 'Unlock Exclusive Style with ',
      'ar': 'افتح النمط الحصري مع',
    },
    'ix5ekutp': {
      'en': 'VIP Membership',
      'ar': 'عضوية كبار الشخصيات VIP',
    },
    'b3usmmeg': {
      'en': 'Join VIP Membership',
      'ar': 'تنضم لعضوية VIP؟',
    },
    '898pa51z': {
      'en': 'Why ',
      'ar': 'لماذا',
    },
    'j31hdwu7': {
      'en': 'Join VIP?',
      'ar': 'تنضم  VIP؟',
    },
    'nenidabv': {
      'en': 'Exclusive Fashion Access ',
      'ar': 'الوصول الحصري للأزياء',
    },
    'xqa4lv2y': {
      'en': 'Get access to collections created exclusively for VIP members.',
      'ar':
          'احصل على إمكانية الوصول إلى المجموعات التي تم إنشاؤها حصريًا لأعضاء VIP.',
    },
    '0m4p4vy8': {
      'en': 'Personalized Custom Designs',
      'ar': 'تصاميم مخصّصة',
    },
    'fsnytewf': {
      'en': 'Request outfits tailored to your style and preferences.',
      'ar': 'اطلب ملابس مصممة خصيصًا لتناسب أسلوبك وتفضيلاتك.',
    },
    'wa5f8wgb': {
      'en': 'Early Access to Collections ',
      'ar': 'الوصول المبكر إلى المجموعات',
    },
    'u10051uq': {
      'en': 'Get first access to new trends and collections.',
      'ar': 'احصل على أول إمكانية الوصول إلى الاتجاهات والمجموعات الجديدة.',
    },
    'zbekqk0h': {
      'en': 'VIP Discounts & Offers ',
      'ar': 'خصومات وعروض VIP',
    },
    'jrpcm02g': {
      'en': 'Enjoy special member-only discounts and promotions.',
      'ar': 'استمتع بخصومات وعروض خاصة للأعضاء فقط.',
    },
    '2y7kior1': {
      'en': 'VIP Membership',
      'ar': 'عضوية كبار الشخصيات',
    },
    'heklu2tv': {
      'en': 'Shop',
      'ar': 'تسوّق',
    },
  },
  // s2-CouponDetails
  {
    'np3rv0yl': {
      'en': 'Rewards & Coupons',
      'ar': '',
    },
    'dl4ueryk': {
      'en': 'adidas',
      'ar': '',
    },
    '07bmox8k': {
      'en': '30% off in your next\nsupply purchase',
      'ar': '',
    },
    'ruqk904m': {
      'en': '30',
      'ar': '',
    },
    't87sp30x': {
      'en': '%',
      'ar': '',
    },
    'yt59zxah': {
      'en': '30%',
      'ar': '',
    },
    'wic7arhw': {
      'en': 'Discount',
      'ar': '',
    },
    '0lox1r5u': {
      'en': 'BUY ONE GET ONE FREE',
      'ar': '',
    },
    'mgn7e4jx': {
      'en': 'Redeem',
      'ar': '',
    },
    'y04jltw0': {
      'en': 'Valid till Mar 2025',
      'ar': '',
    },
    'nendkb6c': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Success
  {
    'jyikzrtk': {
      'en': 'Order Placed',
      'ar': 'تم تأكيد الطلب',
    },
    'onuba3yr': {
      'en': 'Thank You!',
      'ar': 'شكرًا لك!',
    },
    '3xhcoksv': {
      'en': 'Thank you for choosing our membership',
      'ar': 'شكرًا لاختيارك عضويتنا',
    },
    '0i1v9rcz': {
      'en': 'You are just',
      'ar': 'أنت على خطوة من',
    },
    'i5vgqgah': {
      'en': ' 13 points ',
      'ar': '',
    },
    'v7abtd85': {
      'en': 'away from unlocking exclusive Gold Membership benefits!',
      'ar': 'خطوات قليلة من الحصول على مزايا عضوية الذهب الحصرية!',
    },
    'tclag606': {
      'en': 'Shipping',
      'ar': 'الشحن',
    },
    'qzh647by': {
      'en': 'Billing',
      'ar': 'الفوترة',
    },
    'l0xj38oi': {
      'en': 'Same as shipping information',
      'ar': 'مماثلة لمعلومات الشحن',
    },
    'oug4rigx': {
      'en': 'Order Items',
      'ar': 'عناصر الطلب',
    },
    'uq39jb29': {
      'en': '1 Custom Made dress will be delivered within 2 weeks',
      'ar': '',
    },
    '86cj5c03': {
      'en': 'Order Summary',
      'ar': 'ملخّص الطلب',
    },
    '6f22n6jx': {
      'en': 'Subtotal',
      'ar': 'الإجمالي الفرعي',
    },
    'pc9m7pph': {
      'en': 'Shipping',
      'ar': 'الشحن',
    },
    '4yoboyzl': {
      'en': '119.9 KD',
      'ar': '',
    },
    'muz6lmbj': {
      'en': 'Wallet',
      'ar': 'المحفظة',
    },
    'irx5drcu': {
      'en': '119.9 KD',
      'ar': '',
    },
    'irvp994w': {
      'en': 'Total',
      'ar': 'الإجمالي',
    },
    'x2gdxx0y': {
      'en': 'Back to Shopping',
      'ar': 'العودة للتسوّق',
    },
    'tztygp3u': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Membership-Plan
  {
    '1gn3p6t6': {
      'en': 'Become a ',
      'ar': 'كن',
    },
    '01rjnix1': {
      'en': 'VIP Member Today!',
      'ar': 'عضو VIP اليوم!',
    },
    '153sdazi': {
      'en': 'Unlock',
      'ar': 'فتح',
    },
    'aps1nvzw': {
      'en': 'Exclusive Perks:',
      'ar': 'مزايا حصرية:',
    },
    'j7zjseni': {
      'en': 'Exclusive Fashion Access',
      'ar': 'وصول حصري للأزياء',
    },
    'nyn3zgyv': {
      'en': 'Shop from collections crafted exclusively for VIPs.',
      'ar': 'تسوّق من مجموعات مصمّمة خصيصًا لأعضاء VIP.',
    },
    'atf3af1r': {
      'en': 'Personalized Custom Designs',
      'ar': 'تصاميم مخصّصة حسب الطلب',
    },
    't3mac5kb': {
      'en': 'Let us create bespoke outfits tailored to your unique style.',
      'ar': 'دعونا نصنع لك ملابس مصممة خصيصًا لتناسب أسلوبك الفريد.',
    },
    '8cde9pcq': {
      'en': 'Early Access to Collections',
      'ar': 'وصول مبكر للمجموعات',
    },
    '5r71dlru': {
      'en': 'Get first access to new trends and collections.',
      'ar': 'احصل على أول إمكانية الوصول إلى الاتجاهات والمجموعات الجديدة.',
    },
    '8syrf7vm': {
      'en': 'Exclusive Discounts',
      'ar': 'خصومات حصرية',
    },
    'ji529a4w': {
      'en': 'Enjoy special member-only discounts and promotions.',
      'ar': 'استمتع بخصومات خاصة بأعضاء VIP فقط.',
    },
    'gyen4k25': {
      'en': 'VIP Support',
      'ar': 'دعم كبار العملاء VIP',
    },
    'z275i1bp': {
      'en': 'Enjoy priority customer service for a seamless experience.',
      'ar': 'استمتع بأولوية في خدمة العملاء لتجربة سلسة.',
    },
    'hd2xaop0': {
      'en': 'Choose ',
      'ar': 'يختار',
    },
    'h94gm0q8': {
      'en': 'Your Plan',
      'ar': '',
    },
    'cpja9pjq': {
      'en': 'subscribed',
      'ar': '',
    },
    'mppo2bn0': {
      'en': '- Access to products.',
      'ar': '- الوصول إلى المنتجات.',
    },
    '1z9osfez': {
      'en': '- Discounts.',
      'ar': '- خصومات.',
    },
    'x6z0k3ef': {
      'en': '- Free shipping.',
      'ar': '-شحن مجاني.',
    },
    'gv8n7bk3': {
      'en': '- Premium support.',
      'ar': '- دعم مميز.',
    },
    '5iu2v9ll': {
      'en': 'Join VIP Membership',
      'ar': 'انضم إلى عضوية كبار العملاء VIP',
    },
    'l3qfuzxk': {
      'en': '100% secure payments. Cancel anytime.',
      'ar': 'مدفوعات آمنة 100%. يمكنك الإلغاء في أي وقت.',
    },
    'wud10e4k': {
      'en': 'By subscribing to a membership plan, you agree to our ',
      'ar': 'بالاشتراك في خطة العضوية، فإنك توافق على',
    },
    'dg91ieam': {
      'en': 'Terms and Conditions ',
      'ar': 'الشروط والأحكام',
    },
    'oaissac6': {
      'en': 'and ',
      'ar': 'و',
    },
    '0nyunuew': {
      'en': 'Privacy Policy.',
      'ar': 'سياسة الخصوصية.',
    },
    'm67q4z56': {
      'en': 'VIP Membership',
      'ar': 'عضوية كبار الشخصيات',
    },
    '9fha0fsh': {
      'en': 'Shop',
      'ar': '',
    },
  },
  // Designer-Form
  {
    'mvrqg6r4': {
      'en': 'Designer Form',
      'ar': 'نموذج المصمّم',
    },
    '84xj802m': {
      'en': 'Bring Your Designs to Life',
      'ar': 'نجسد تصميمك على أرض الواقع ',
    },
    '10d13it0': {
      'en':
          'Showcase your creativity and connect with fashion-forward shoppers.',
      'ar': 'اعرض إبداعاتك وتواصل مع متسوّقين يعشقون الأزياء.',
    },
    'aetp2ybb': {
      'en': 'Profile Setup',
      'ar': 'إعداد الملف الشخصي',
    },
    'rf5yiceb': {
      'en': 'Upload Your Best Picture / Brand Logo ',
      'ar': 'حمِّل أفضل صورة لك / شعار علامتك',
    },
    'w3fwkspu': {
      'en': '',
      'ar': '',
    },
    '5t9qz8wz': {
      'en': 'Name *',
      'ar': 'الاسم *',
    },
    'kseik5bb': {
      'en': 'it will be displayed in your profile',
      'ar': 'سيتم عرضه في ملفك الشخصي',
    },
    '247cpekv': {
      'en': 'Full Name / Brand Name ',
      'ar': 'الاسم الكامل / اسم العلامة التجارية',
    },
    '9lo5gc5w': {
      'en': '*',
      'ar': '',
    },
    'fk07mrjn': {
      'en': 'Name *',
      'ar': '',
    },
    'e3ql09z0': {
      'en': 'Enter your name / brand name',
      'ar': 'أدخل اسمك / اسم علامتك التجارية',
    },
    'mzoll0ww': {
      'en': 'Individual',
      'ar': 'فردي',
    },
    'gp6g5rt9': {
      'en': 'Licensed ',
      'ar': 'حاصل على ترخيص',
    },
    's3g5dqbj': {
      'en': 'Not licensed ',
      'ar': 'غير مرخص',
    },
    '6x3oz4ln': {
      'en': 'Not licensed ',
      'ar': '',
    },
    'o85zjzy7': {
      'en': 'Email ID ',
      'ar': 'معرف البريد الإلكتروني',
    },
    '4qjax7sk': {
      'en': '*',
      'ar': '',
    },
    'l3z9x5ar': {
      'en': 'Email ID *',
      'ar': '',
    },
    'xne5heek': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'ohp0m0y0': {
      'en': 'Alternative Email ID ',
      'ar': 'بريد إلكتروني بديل',
    },
    'uaueyh37': {
      'en': 'Email ID *',
      'ar': '',
    },
    'ub9yg00c': {
      'en': 'Enter your alternative  email',
      'ar': 'أدخل بريدك الإلكتروني البديل',
    },
    'vr4euv3q': {
      'en': 'Mobile Number ',
      'ar': 'رقم الجوال',
    },
    'ptii8s6l': {
      'en': '*',
      'ar': '',
    },
    'd29tnwxr': {
      'en': 'Phone Number *',
      'ar': '',
    },
    'r66pzkgj': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    'bt6qebq6': {
      'en': 'Alternative Mobile Number ',
      'ar': 'رقم جوال بديل',
    },
    't88sjm1m': {
      'en': 'Phone Number *',
      'ar': '',
    },
    'f0nvi8g5': {
      'en': 'Please select country code...',
      'ar': 'يرجى اختيار رمز الدولة.',
    },
    '5zoi2ah9': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'as0itim7': {
      'en': 'Enter your alternative number',
      'ar': 'أدخل رقمك البديل',
    },
    'mu56z6jc': {
      'en': 'Portfolio/Website Link ',
      'ar': 'رابط المعرض / الموقع',
    },
    'tz59guk5': {
      'en': '*',
      'ar': '',
    },
    '88jqa8le': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    'idt3beif': {
      'en': 'Paster your Portfolio/Website Link ',
      'ar': 'ألصق رابط محفظتك/موقعك الإلكتروني',
    },
    '12cxm2sq': {
      'en': 'Professional Insights',
      'ar': 'رؤى مهنية',
    },
    'xzn1e8sh': {
      'en': 'Tell Us About Yourself /  Brand ',
      'ar': 'أخبرنا عن نفسك / العلامة التجارية',
    },
    'uzi1qfqg': {
      'en': '*',
      'ar': '',
    },
    'l1g9t1nt': {
      'en': 'Name *',
      'ar': '',
    },
    'p3omb385': {
      'en': 'Brief Bio',
      'ar': 'نبذة مختصرة',
    },
    'bvoi6qpx': {
      'en': 'Design Style/Theme ',
      'ar': 'أسلوب / ثيم التصميم',
    },
    'mccuiu8r': {
      'en': '*',
      'ar': '',
    },
    'ahxn5s23': {
      'en': 'Name *',
      'ar': '',
    },
    'e2gnexrn': {
      'en': '',
      'ar': '',
    },
    's03fn1uh': {
      'en': 'Select Category...',
      'ar': 'اختر الفئة...',
    },
    'qdv1bl4i': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'vpg957ke': {
      'en': 'Classic Style',
      'ar': '',
    },
    'tj3hirv7': {
      'en': 'Casual Style',
      'ar': '',
    },
    'dcoainuh': {
      'en': 'Sporty Style',
      'ar': '',
    },
    '0jbdjyjh': {
      'en': 'New Style',
      'ar': '',
    },
    'z47f3tdl': {
      'en': 'Style Style',
      'ar': '',
    },
    '96gwvows': {
      'en': 'Years of Experience in Designing ',
      'ar': 'سنوات الخبرة في التصميم',
    },
    'dwnqq4zz': {
      'en': '*',
      'ar': '',
    },
    'gb08tl78': {
      'en': 'Email ID *',
      'ar': '',
    },
    'zuft309y': {
      'en': 'Year of experience',
      'ar': 'سنة الخبرة',
    },
    '535vboox': {
      'en': 'Production Capabilities ',
      'ar': 'القدرة الإنتاجية',
    },
    'tp104gzy': {
      'en': '*',
      'ar': '',
    },
    'zovs6vq7': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    'e1r8wqwi': {
      'en': 'Pieces per month',
      'ar': 'قطع في الشهر',
    },
    'wvoiutfy': {
      'en': 'Availability for Custom Orders',
      'ar': 'التوفر للطلبات المخصصة',
    },
    'a2moln4r': {
      'en': 'Additional Information',
      'ar': 'معلومات إضافية',
    },
    '5vdwuuqz': {
      'en': 'Location / City ',
      'ar': 'الموقع / المدينة',
    },
    '3sfdp7gr': {
      'en': '*',
      'ar': '',
    },
    'arakbyh4': {
      'en': 'Name *',
      'ar': '',
    },
    '59py6hmx': {
      'en': 'Enter your Location / City',
      'ar': 'أدخل موقعك / مدينتك',
    },
    'nrosu855': {
      'en': 'References or Testimonials Link ',
      'ar': 'رابط المراجع أو الشهادات',
    },
    'v83ssrwh': {
      'en': '',
      'ar': '',
    },
    '85pucme4': {
      'en': 'Email ID *',
      'ar': '',
    },
    '5xc0768j': {
      'en': 'Paste link here',
      'ar': 'ألصق الرابط هنا',
    },
    'du63h5cm': {
      'en': 'Availability for Events/Collaborations',
      'ar': 'التوفر للفعاليات / التعاونات',
    },
    'rwohljkl': {
      'en': 'Agree to Terms & Conditions',
      'ar': 'الموافقة على الشروط والأحكام',
    },
    'nurp26mv': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '3xninvl3': {
      'en': 'Please enter name / brand',
      'ar': 'الرجاء إدخال الاسم / العلامة التجارية',
    },
    'rj70c0v7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1sg6fn87': {
      'en': 'Please provide a valid email ',
      'ar': '',
    },
    'al1a5kye': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l5jrqn50': {
      'en': 'Please provide a valid email',
      'ar': '',
    },
    'ymzxx5a6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '69psz4j0': {
      'en': 'Please enter phone number',
      'ar': '',
    },
    'wedu92lp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'aivossgr': {
      'en': 'Please enter phone number',
      'ar': '',
    },
    'o7svf54o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3tvpo4e6': {
      'en': 'Please provide portfolio / website link',
      'ar': 'يرجى تقديم رابط لمحفظة أعمالك / موقعك الإلكتروني',
    },
    'obwxd4fv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'iito5zro': {
      'en': 'Please enter brief bio',
      'ar': 'الرجاء إدخال السيرة الذاتية المختصرة',
    },
    '8nzomqd6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1sinmrr7': {
      'en': 'Please enter year of experience',
      'ar': 'يرجى إدخال سنوات الخبرة',
    },
    'chcjkpep': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'tyai15fr': {
      'en': 'Please add production capacity/month',
      'ar': 'يرجى إضافة الطاقة الإنتاجية/شهريًا',
    },
    'nub1elea': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l45a7krt': {
      'en': 'Please enter location / city ',
      'ar': 'الرجاء إدخال الموقع / المدينة',
    },
    'bv31grz5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vp9xoxm2': {
      'en': 'Please paste link ',
      'ar': '',
    },
    'nuq8qzy1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Designer-Portofolio
  {
    '3kr7gcc3': {
      'en': 'Designer Form',
      'ar': 'نموذج المصمم',
    },
    'j2rvg63g': {
      'en': 'Sample Designs',
      'ar': 'نماذج تصاميم',
    },
    'yudld50r': {
      'en': 'Upload your best designs to get more chances of \napproval',
      'ar': 'حمّل أفضل تصاميمك لزيادة فرص الموافقة',
    },
    'h3986n5b': {
      'en': 'Upload your designs ',
      'ar': 'حمّل تصاميمك',
    },
    'qc9dqr2j': {
      'en': 'Name *',
      'ar': '',
    },
    '5g98dik9': {
      'en': 'You can upload upto 5 designs in PDF or Image',
      'ar': 'يمكنك رفع ما يصل إلى 5 تصاميم بصيغة PDF أو صور',
    },
    'awuks81r': {
      'en': 'Upload Photo / PDF',
      'ar': 'رفع صورة / ملف PDF',
    },
    '334jvr13': {
      'en': '4.2 MB',
      'ar': '',
    },
    'tzor9aj7': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'j7rudwuv': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Designer-FormUpload
  {
    'c4s5tkwg': {
      'en': 'Designer Form',
      'ar': 'نموذج المصمم',
    },
    'nuju3mqt': {
      'en': 'Identity Verification',
      'ar': 'التحقق من هوية المصمم',
    },
    'dq7jn3zx': {
      'en':
          'Secure your account and unlock exclusive Desginer \nbenefits by verifying your identity.',
      'ar':
          'قم بتأمين حسابك والحصول على مزايا المصمّم الحصرية عبر توثيق هويتك.',
    },
    'vnu4i3ia': {
      'en': 'Government ID ',
      'ar': 'هوية حكومية',
    },
    '2aq7wsv6': {
      'en': 'Name *',
      'ar': '',
    },
    'bn3h2e8x': {
      'en': 'Civil ID, Passport or Driver’s License',
      'ar': 'البطاقة المدنية أو جواز السفر أو رخصة القيادة',
    },
    's2cy169i': {
      'en': 'Company License',
      'ar': 'هوية حكومية',
    },
    '2eyzvrnl': {
      'en': 'Name *',
      'ar': '',
    },
    'goz7flp8': {
      'en': 'Selfie ',
      'ar': 'صورة شخصية للتحقق',
    },
    '0sy0qwk9': {
      'en': ' (Optional)',
      'ar': '',
    },
    'vpx31aty': {
      'en': 'Name *',
      'ar': '',
    },
    '1g02xvp2': {
      'en': 'Your data is securely encrypted and used for verification only.',
      'ar': 'يتم تشفير بياناتك وحمايتها واستخدامها فقط لأغراض التحقق.',
    },
    'sfcy749c': {
      'en': 'Upload and Submit',
      'ar': 'رفع وإرسال',
    },
    '8yezhh34': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Designer-FormSuccess
  {
    'n0lge7j6': {
      'en': 'Thank you for applying!',
      'ar': 'شكرًا لتقديمك الطلب!',
    },
    'xx1amcc3': {
      'en':
          'We\'ve received your application to become a designer. Our team will review your details, and you\'ll be notified via email & in-app once approved.',
      'ar':
          'لقد استلمنا طلبك لتصبح مصمّمًا. سيقوم فريقنا بمراجعة بياناتك، وسيتم إشعارك عبر البريد الإلكتروني وفي التطبيق عند الموافقة',
    },
    'hemg0zvm': {
      'en': 'Turn on notification',
      'ar': 'تفعيل الإشعارات',
    },
    '856gxe8f': {
      'en': 'Done',
      'ar': 'تم',
    },
    'f06i2sxq': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Creator-Form
  {
    'cr4dh4ua': {
      'en': 'Creators Form',
      'ar': 'نموذج المبدعين',
    },
    'liwkivga': {
      'en': 'Earn Rewards, Inspire Followers',
      'ar': 'اربح المكافآت وألهم المتابعين',
    },
    'gm2akv8a': {
      'en':
          'Join our Creators community and share your style with a wider audience.',
      'ar': 'انضم إلى مجتمع المبدعين وشارك أسلوبك مع جمهور أوسع',
    },
    '6uhc5ikc': {
      'en': 'Profile Setup',
      'ar': 'إعداد الملف الشخصي',
    },
    '1n88mapr': {
      'en': 'Upload Your Best Picture ',
      'ar': 'حمّل أفضل صورة لك',
    },
    'yztyut2b': {
      'en': 'Name *',
      'ar': '',
    },
    'stol9iv3': {
      'en': 'it will be displayed in your profile',
      'ar': 'ستُعرَض في ملفك الشخصي',
    },
    'tru487jm': {
      'en': 'Full Name / UserName',
      'ar': 'الاسم الكامل / اسم المستخدم',
    },
    'bpb7d2q1': {
      'en': '*',
      'ar': '',
    },
    'yoeyfjph': {
      'en': 'Name *',
      'ar': '',
    },
    '3aacznxu': {
      'en': 'Enter your name',
      'ar': 'أدخل اسمك',
    },
    '1tk6l2h3': {
      'en': 'Email ID ',
      'ar': 'معرف البريد الإلكتروني',
    },
    'i7g8t2kx': {
      'en': '*',
      'ar': '',
    },
    '6mybdi8d': {
      'en': 'Email ID *',
      'ar': '',
    },
    'lgsdbiw2': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'd4luwqas': {
      'en': 'Alternative Email ID ',
      'ar': 'معرف البريد الإلكتروني البديل',
    },
    '4z2uml3x': {
      'en': 'Email ID *',
      'ar': '',
    },
    'ashje1oy': {
      'en': 'Enter your alternative email',
      'ar': 'أدخل بريدك الإلكتروني البديل',
    },
    'qfpyzrln': {
      'en': 'Mobile Number ',
      'ar': '',
    },
    'w8nk8ryn': {
      'en': '*',
      'ar': '',
    },
    'pb7840ik': {
      'en': 'Phone Number *',
      'ar': '',
    },
    '2ofcjd3y': {
      'en': 'Please select country code...',
      'ar': 'يرجى اختيار رمز الدولة.',
    },
    'wojyeoy5': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '2glsnikn': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم جوالك',
    },
    'knz7z0mw': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    '51rwzu84': {
      'en': 'Alternative Mobile Number ',
      'ar': 'رقم جوال بديل',
    },
    'mxn25xnn': {
      'en': 'Phone Number *',
      'ar': '',
    },
    '6mzt3inm': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    'e15wymr8': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'dydeg1of': {
      'en': 'Enter your alternative number',
      'ar': 'أدخل رقمك البديل',
    },
    'islelwf9': {
      'en': 'Add thumbnail images',
      'ar': 'أضف صورًا مصغّرة',
    },
    'e18zrblt': {
      'en': 'Upload Here Your Best Picture ',
      'ar': 'حمّل هنا أفضل صورة لك',
    },
    '3uthsgqn': {
      'en': 'Name *',
      'ar': '',
    },
    'sj2rpv4g': {
      'en': 'it will be displayed in your profile',
      'ar': 'ستُعرَض في ملفك الشخصي',
    },
    '6kckz97x': {
      'en': 'Upload Photo',
      'ar': 'رفع صورة',
    },
    'np1d0az1': {
      'en': 'Remove all',
      'ar': 'إزالة الكل',
    },
    'na9f55l4': {
      'en': 'Professional Insights',
      'ar': 'رؤى مهنية',
    },
    'ecih0ire': {
      'en': 'Tell Us About Yourself (Optional)',
      'ar': 'أخبرنا عن نفسك',
    },
    's8jgkogt': {
      'en': 'Name *',
      'ar': '',
    },
    'fnpqyvvn': {
      'en': 'Brief Bio',
      'ar': 'نبذة مختصرة',
    },
    '2y4hkme3': {
      'en': 'Location / Area',
      'ar': 'الموقع / المنطقة',
    },
    'yij66h8p': {
      'en': '*',
      'ar': '',
    },
    'mwqjdoyv': {
      'en': 'Email ID *',
      'ar': '',
    },
    'ay2d8vvk': {
      'en': 'e.g., Kuwait city',
      'ar': 'على سبيل المثال، 5 سنوات',
    },
    'l3wjbzsf': {
      'en': 'Primary Content Niche ',
      'ar': 'مجال المحتوى الأساسي',
    },
    'tqzior0h': {
      'en': '*',
      'ar': '',
    },
    'afmxs1ct': {
      'en': 'Name *',
      'ar': '',
    },
    '6lnya9kr': {
      'en': '',
      'ar': '',
    },
    'yzqb6t1l': {
      'en': 'Select Category...',
      'ar': 'اختر الفئة...',
    },
    'a2h2czk9': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'de6suzx7': {
      'en': 'Classic Style',
      'ar': '',
    },
    '1bi0hl2d': {
      'en': 'Casual Style',
      'ar': '',
    },
    'plpt06pe': {
      'en': 'Sporty Style',
      'ar': '',
    },
    'vu5z4mmw': {
      'en': 'New Style',
      'ar': '',
    },
    'pndrs9mi': {
      'en': 'Style Style',
      'ar': '',
    },
    'ticqm80j': {
      'en': 'Years of Experience in Content Creation ',
      'ar': 'سنوات الخبرة في صناعة المحتوى',
    },
    'ajnriwr7': {
      'en': '*',
      'ar': '',
    },
    'digpiezq': {
      'en': 'Email ID *',
      'ar': '',
    },
    'jwkh10a4': {
      'en': 'e.g., 5 Years',
      'ar': 'مثلًا: 5 سنوات',
    },
    '0oyjcg4e': {
      'en': 'Engagement Rate ',
      'ar': 'معدل التفاعل',
    },
    '2sxq0alz': {
      'en': '*',
      'ar': '',
    },
    'djhztb4a': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    '7ip5ywi1': {
      'en': 'e.g., 78%',
      'ar': 'مثلًا: 78%',
    },
    'tk27wrfb': {
      'en': 'Preferred Promotion Style ',
      'ar': 'أسلوب الترويج المفضل',
    },
    '7sfr1jt4': {
      'en': '*',
      'ar': '',
    },
    'fof2ptpf': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    'l0b9xal3': {
      'en': 'e.g., Dancing, Review, GRWM or ASMR',
      'ar': 'مثلًا: رقص، مراجعة، GRWM أو ASMR',
    },
    '2dku8x1t': {
      'en': 'Portfolio or Website Link ',
      'ar': 'رابط المعرض أو الموقع',
    },
    'knjhflhb': {
      'en': '',
      'ar': '',
    },
    'jcoit5dv': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    '31djy6nt': {
      'en': 'Paste link here...',
      'ar': 'ألصق الرابط هنا...',
    },
    '16fbie04': {
      'en': 'Social Media Presence',
      'ar': 'التواجد على وسائل التواصل',
    },
    'whgb5bvw': {
      'en': 'Paste link here not the username',
      'ar': 'ألصق الرابط هنا وليس اسم المستخدم',
    },
    'eo0c2wmp': {
      'en': 'Instagram Profile (Optional)',
      'ar': 'الملف الشخصي على إنستغرام',
    },
    'vgsy987u': {
      'en': 'Name *',
      'ar': '',
    },
    'j451h2dh': {
      'en': 'Paste link here...',
      'ar': 'ألصق الرابط هنا...',
    },
    '9hxrla3g': {
      'en': 'Instagram Profile Followers ',
      'ar': 'عدد متابعي حساب إنستغرام',
    },
    'xdkjbdb8': {
      'en': 'Name *',
      'ar': '',
    },
    'kkzqw990': {
      'en': 'e.g 80k',
      'ar': 'مثلًا 80k',
    },
    't6toa9e4': {
      'en': 'TikTok Handle (Optional)',
      'ar': 'حساب تيك توك',
    },
    'o3y5y5lr': {
      'en': 'Name *',
      'ar': '',
    },
    'r1jjv602': {
      'en': 'Paste link here...',
      'ar': 'ألصق الرابط هنا...',
    },
    'er71oqsk': {
      'en': 'TikTok Profile Followers ',
      'ar': 'عدد متابعي حساب تيك توك',
    },
    'w39r40fu': {
      'en': '*',
      'ar': '',
    },
    '7jdbo63w': {
      'en': 'Name *',
      'ar': '',
    },
    'kp7kmgig': {
      'en': 'e.g 80k',
      'ar': 'مثلًا 80k',
    },
    'w3y0qeh6': {
      'en': 'Facebook Profile (Optional)',
      'ar': 'حساب فيسبوك',
    },
    '7z1e5rin': {
      'en': '',
      'ar': '',
    },
    '72cf9cmp': {
      'en': 'Name *',
      'ar': '',
    },
    '61vu7jhw': {
      'en': 'Paste link here...',
      'ar': 'ألصق الرابط هنا...',
    },
    's6mej905': {
      'en': 'Facebook Profile Followers ',
      'ar': 'عدد متابعي حساب فيسبوك',
    },
    '9v6og5y5': {
      'en': '',
      'ar': '',
    },
    'u3snhvh5': {
      'en': 'Name *',
      'ar': '',
    },
    'twjnbhp2': {
      'en': 'e.g 80k',
      'ar': 'مثلًا 80k',
    },
    '0x7s1dr8': {
      'en': 'Youtube Channel(Optional)',
      'ar': 'قناة يوتيوب',
    },
    'gb0i1lx9': {
      'en': '',
      'ar': '',
    },
    'q4lvmq1d': {
      'en': 'Name *',
      'ar': '',
    },
    'r7495awt': {
      'en': 'Paste link here...',
      'ar': 'ألصق الرابط هنا...',
    },
    '0egtu6bv': {
      'en': 'Youtube Profile Followers ',
      'ar': 'عدد متابعي قناة يوتيوب',
    },
    'r7sac0jk': {
      'en': '',
      'ar': '',
    },
    'qdlbdvid': {
      'en': 'Name *',
      'ar': '',
    },
    '6klj34ij': {
      'en': 'e.g 80k',
      'ar': 'مثلًا 80k',
    },
    '51dnt5g3': {
      'en': 'Other Profile (Optional)',
      'ar': 'حساب آخر',
    },
    'ma6q30uz': {
      'en': 'Name *',
      'ar': '',
    },
    'zdapc34r': {
      'en': 'Paste link here...',
      'ar': 'ألصق الرابط هنا...',
    },
    'h3z3v95l': {
      'en': 'Open to Brand Collaborations',
      'ar': 'مستعد للتعاون مع العلامات التجارية',
    },
    'uc37gdwf': {
      'en': 'Agree to Terms & Conditions',
      'ar': 'الموافقة على الشروط والأحكام',
    },
    'q4l2ixnn': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '0le351ff': {
      'en': 'Please enter full name/username',
      'ar': 'الرجاء إدخال الاسم الكامل/اسم المستخدم',
    },
    'ppivy3e2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1zdxi0ai': {
      'en': 'Please provide a valid email',
      'ar': 'يرجى تقديم بريد إلكتروني صحيح',
    },
    '6zqkykjt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'v2zz2sva': {
      'en': 'Please provide a valid email',
      'ar': '',
    },
    'wwt977eq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4qkr0sl6': {
      'en': 'Enter your mobile number is required',
      'ar': '',
    },
    '1as59bje': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'v3oevowr': {
      'en': 'Please enter mobile  number',
      'ar': 'الرجاء إدخال رقم الجوال',
    },
    'quj4xy1w': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xgjyaisj': {
      'en': 'Please enter alternative  number',
      'ar': '',
    },
    '0f2blcei': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ip6v4oyg': {
      'en': 'Please enter brief bio',
      'ar': '',
    },
    '56dqgwwf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '14lsrlok': {
      'en': 'e.g., Kuwait city is required',
      'ar': '',
    },
    '2flfgswz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j3kenw11': {
      'en': 'Please enter years of experience',
      'ar': 'يرجى إدخال سنوات الخبرة',
    },
    '9jrbibpt': {
      'en': 'Invalid format',
      'ar': '',
    },
    'nwqzu26e': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bxb8sfvf': {
      'en': 'Please enter engagement rate',
      'ar': '',
    },
    'ntd5fuc2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0h97vb5p': {
      'en': 'Please enter preferred promotion style',
      'ar': 'يرجى إدخال نمط الترويج المفضل',
    },
    'ncgkth3u': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'm01qrnuz': {
      'en': 'Please enter portfolio/website link',
      'ar': '',
    },
    'fyf8f3ta': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mv4ahmrx': {
      'en': 'Please paste instagram link',
      'ar': '',
    },
    'g10arac3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1k6cgf7z': {
      'en': 'Instagram profile followers is required',
      'ar': '',
    },
    'jp6h5wtr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gy9yoqcj': {
      'en': 'Please paste tik tok link',
      'ar': '',
    },
    'acjsdiuc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nl4w9lqj': {
      'en': 'Tiktok profile followers count is required',
      'ar': '',
    },
    'e8xywpai': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'g6hi1pc6': {
      'en': 'Facebook profile is required',
      'ar': '',
    },
    '2j2exzl5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qwun96ue': {
      'en': 'Please enter facebook followers count',
      'ar': '',
    },
    '5k6rzivb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'utrfumi9': {
      'en': 'youtube_channel is required',
      'ar': '',
    },
    '6majq89c': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'p7f25w6b': {
      'en': 'youtube_profile_followers is required',
      'ar': '',
    },
    'lt9q55fs': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kst2l5ew': {
      'en': 'Please enter other profile',
      'ar': '',
    },
    'g5w7mace': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'brjr9weo': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Creator-FormUpload
  {
    'c8oo55xu': {
      'en': 'Creators Form',
      'ar': 'نموذج المبدعين',
    },
    '0sa1ns5a': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    'ppkff0go': {
      'en':
          'Secure your account and unlock exclusive creator \nbenefits by verifying your identity.',
      'ar': 'قم بتأمين حسابك والحصول على مزايا المبدع الحصرية عبر توثيق هويتك.',
    },
    'iy0lvjjs': {
      'en': 'Government ID ',
      'ar': 'هوية حكومية',
    },
    'h4asy8vv': {
      'en': 'Name *',
      'ar': '',
    },
    'u9pk1tgb': {
      'en': 'Passport, Driver’s License, or Civil ID',
      'ar': 'جواز سفر، رخصة قيادة، أو بطاقة مدنية',
    },
    'cja4qygh': {
      'en': 'Selfie for Verification',
      'ar': 'صورة شخصية للتحقق',
    },
    '27mq2it0': {
      'en': 'Name *',
      'ar': '',
    },
    'jsizc3fa': {
      'en': 'Your data is securely encrypted and used for verification only.',
      'ar': 'بياناتك مُشفّرة ومحمية وتُستخدم فقط لأغراض التحقق.',
    },
    'p4m59cah': {
      'en': 'Upload and Submit',
      'ar': 'رفع وإرسال',
    },
    'uilrp7uf': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Creator-FormSuccess
  {
    'tfh41jgr': {
      'en': 'Thank you for applying!',
      'ar': 'شكراً لتقديمك الطلب!',
    },
    '40ncbqy3': {
      'en':
          'We\'ve received your application to become a creator. Our team will review your details, and you\'ll be notified via email & in-app once approved.',
      'ar':
          'لقد استلمنا طلبك لتصبح مصمّمًا. سيقوم فريقنا بمراجعة بياناتك، وسيتم إشعارك عبر البريد الإلكتروني وفي التطبيق عند الموافقة.',
    },
    'ay0kbhdl': {
      'en': 'Turn on notification',
      'ar': '',
    },
    'l32gaesn': {
      'en': 'Done',
      'ar': 'تم',
    },
    't9oj3lbr': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // Orders
  {
    '1qicorvl': {
      'en': 'My Order',
      'ar': 'طلباتي',
    },
    'ns8yln7s': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    '7v6rqa01': {
      'en': 'All',
      'ar': 'الكل',
    },
    'd9x21h83': {
      'en': 'Custom made',
      'ar': 'مخصص لك ',
    },
    'o9hyj2kw': {
      'en': 'Ready made',
      'ar': 'جاهز',
    },
    'fk49c5nn': {
      'en': 'All',
      'ar': 'الكل',
    },
    '8vbsw1cx': {
      'en': 'No orders yet?',
      'ar': 'ا توجد طلبات بعد؟',
    },
    '8aljt83k': {
      'en': 'Your next great find is just a tap away',
      'ar': 'اكتشافك القادم على بُعد ضغطة واحدة',
    },
    'lt2u26xa': {
      'en': 'let’s go shopping',
      'ar': 'لنذهب إلى التسوّق',
    },
    'wuxoqzmr': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'm02ugwea': {
      'en': 'All',
      'ar': '',
    },
    '21ai0hma': {
      'en': 'Custom made',
      'ar': '',
    },
    '2yzpg8em': {
      'en': 'Ready made',
      'ar': '',
    },
    'zde13dl9': {
      'en': 'All',
      'ar': '',
    },
    'j0psxktr': {
      'en': 'No orders yet?',
      'ar': 'لا توجد طلبات حتى الآن؟',
    },
    'm1atg8tj': {
      'en': 'Your next great find is just a tap away',
      'ar': 'اكتشافك الرائع التالي على بُعد نقرة واحدة فقط',
    },
    'ku3fkzcg': {
      'en': 'let’s go shopping',
      'ar': 'هيا بنا نتسوق',
    },
    '75gjfw2c': {
      'en': 'Cancelled',
      'ar': 'ملغى',
    },
    'us6hw7m4': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'lq7x5u11': {
      'en': 'Custom made',
      'ar': 'مصنوع بطريقة مخصصة',
    },
    '3riwbxuo': {
      'en': 'Ready made',
      'ar': 'جاهز',
    },
    'azzy5cn9': {
      'en': 'All',
      'ar': 'الكل',
    },
    'ogy2y8be': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Payment
  {
    '8wjiaaoe': {
      'en': 'Copy & Paste',
      'ar': 'نسخ ولصق',
    },
    '8kti0npy': {
      'en': 'Processing Payment...',
      'ar': 'جارٍ معالجة الدفع...',
    },
    'xwaamgnw': {
      'en': 'back',
      'ar': 'عودة',
    },
    'q0guk5x2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Orders_Details
  {
    'i4otgxr6': {
      'en': 'Order Details',
      'ar': 'تفاصيل الطلب',
    },
    'sbwztqps': {
      'en': 'Payment Mode : ',
      'ar': 'طريقة الدفع :',
    },
    'qs1wxjs4': {
      'en': 'Hello World',
      'ar': '',
    },
    'jbrbcfgl': {
      'en': 'Hello World',
      'ar': '',
    },
    'zwd8q3zn': {
      'en': 'Hello World',
      'ar': '',
    },
    'i89cnofr': {
      'en': 'Order ID : ',
      'ar': 'رقم الطلب:',
    },
    '9sziq8ts': {
      'en': 'Hello World',
      'ar': '',
    },
    'ref0lgvo': {
      'en': 'Order item details ',
      'ar': 'تفاصيل عنصر الطلب',
    },
    'zp11a3v3': {
      'en': ' Items  ',
      'ar': '',
    },
    'tr9miqam': {
      'en': '|  ',
      'ar': '',
    },
    '0uyhe3o2': {
      'en': 'How was the dress?',
      'ar': '',
    },
    'ka9l2y9n': {
      'en': 'Congrats! you earned  ',
      'ar': '',
    },
    '7xpcqnqg': {
      'en': ' Points',
      'ar': '',
    },
    '1vgtsm6i': {
      'en': 'Order Tracking',
      'ar': '',
    },
    'e0qhy0m1': {
      'en': 'Order Placed',
      'ar': '',
    },
    'cx0jbfkp': {
      'en': 'Order Placed',
      'ar': '',
    },
    't91f5rjf': {
      'en': '11:15 AM, ',
      'ar': '',
    },
    'h4y0i6fc': {
      'en': ' 07 Nov, 2024',
      'ar': '',
    },
    '7yiyimdm': {
      'en': ' ',
      'ar': '',
    },
    'w9fvzqc6': {
      'en': 'Order Placed',
      'ar': '',
    },
    'rcnid8mj': {
      'en': '11:15 AM, ',
      'ar': '',
    },
    'lbon6y2u': {
      'en': ' 07 Nov, 2024',
      'ar': '',
    },
    '5hxzf30e': {
      'en': ' ',
      'ar': '',
    },
    '46hd6avh': {
      'en': 'Show more',
      'ar': '',
    },
    '0l52oi83': {
      'en': 'Open Tracking Link',
      'ar': '',
    },
    'i89mmr0m': {
      'en': 'Share',
      'ar': '',
    },
    'wn7lu5gh': {
      'en': 'Return Product',
      'ar': 'إرجاع المنتج',
    },
    'peaxs664': {
      'en': 'View Invoice',
      'ar': '',
    },
    'd4k3l51o': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    'uiq0r5k0': {
      'en': 'Subtotal',
      'ar': 'الإجمالي الفرعي',
    },
    't58msgt6': {
      'en': 'Shipping',
      'ar': 'الشحن',
    },
    'yvio1578': {
      'en': 'Wallet',
      'ar': 'المحفظة',
    },
    'rl1mgbt2': {
      'en': 'Total',
      'ar': 'الإجمالي',
    },
    'ih7mg9uh': {
      'en': 'Back to Shop',
      'ar': 'العودة إلى المتجر',
    },
    '7krfbwnc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Failed
  {
    'hb6kchi6': {
      'en': 'Failed!',
      'ar': 'فشل!',
    },
    '6kmjdw7n': {
      'en': 'Your Purchase was unsuccessful',
      'ar': 'عملية الشراء لم تكتمل',
    },
    'zmwkls70': {
      'en': 'Continue',
      'ar': 'متابعة',
    },
    'wnrk2y0i': {
      'en': 'Payment Failed',
      'ar': 'فشل الدفع',
    },
    'xr0su6k7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Verify
  {
    'sd2nqg1k': {
      'en': 'Verifying payment....\ndon\'t close the app',
      'ar': 'جارٍ التحقق من الدفع...\nلا تغلق التطبيق',
    },
    '2cwdbql1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s4-ChooseRefundMethod
  {
    'lqjg41br': {
      'en': 'Return Order',
      'ar': '',
    },
    'nn02oob1': {
      'en': 'Ordered on ',
      'ar': '',
    },
    'rki00r23': {
      'en': '9th Nov 2024',
      'ar': '',
    },
    '9p77kb3m': {
      'en': 'Hello World',
      'ar': '',
    },
    'wvtyug0x': {
      'en': 'Order ID ',
      'ar': '',
    },
    'f5ja8qzc': {
      'en': '0991899',
      'ar': '',
    },
    'woziy7m9': {
      'en': 'Hello World',
      'ar': '',
    },
    'en5krsbs': {
      'en': 'Choose Refund Method',
      'ar': '',
    },
    'tm3k3lg0': {
      'en': 'Wallet Refund',
      'ar': '',
    },
    'y2qy0w7b': {
      'en': 'Bank Refund',
      'ar': '',
    },
    'gkyv98om': {
      'en': 'Note:',
      'ar': '',
    },
    'l8i3qwcj': {
      'en':
          'Wallet Refund: The refund will be credited to your shop app wallet for future purchases.',
      'ar': '',
    },
    'dk17v9le': {
      'en':
          'Bank Refund: The refund will be processed to your original payment method (bank/card) within 3-5 business days after return confirmation.',
      'ar': '',
    },
    '9fmret03': {
      'en': 'Submit',
      'ar': '',
    },
    'rphcfr4m': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OrderReturnSubmit
  {
    'tw0q414m': {
      'en': 'Return request submitted successfully!',
      'ar': 'تم إرسال طلب الإرجاع بنجاح!',
    },
    'w66uafrr': {
      'en':
          'Your return has been successfully submitted, and we appreciate your patience as we process it.\n\nKeep an eye on your notifications for updates!',
      'ar':
          'تم استلام طلب الإرجاع بنجاح، ونقدّر صبرك أثناء معالجة الطلب. تابع إشعاراتك لمزيد من التحديثات!\n',
    },
    '4wgyblmq': {
      'en': 'Turn on notification',
      'ar': '',
    },
    'nw0z0hlk': {
      'en': 'Back to Shopping',
      'ar': 'العودة للتسوّق',
    },
    'r4nbp7lr': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // CreatorSpace
  {
    '1lu6wr0l': {
      'en': 'Creator Space',
      'ar': '',
    },
    '0h2ntrdp': {
      'en': 'Earn 20% Extra Commission',
      'ar': '',
    },
    'rvoyuq7o': {
      'en': 'on every product you promote this week! Don’t miss out',
      'ar': '',
    },
    'epbl86a4': {
      'en': 'add new promotion',
      'ar': '',
    },
    'r92fnahz': {
      'en': 'Earn 20% Extra Commission Earn 20% Extra Commission',
      'ar': 'اكسب عمولة إضافية 20%',
    },
    'he7kqznf': {
      'en':
          'on every product you promote this week! \nDon’t miss out on every product you promote this week! \nDon’t miss out',
      'ar': 'على كل منتج تروّج له هذا الأسبوع!\nلا تفوّت الفرصة\"',
    },
    'bvlzl0u7': {
      'en': 'Earn 20% Extra Commission Earn 20% Extra Commission',
      'ar': 'اكسب عمولة إضافية 20%',
    },
    'qtmlhoqx': {
      'en':
          'on every product you promote this week! \nDon’t miss out on every product you promote this week! \nDon’t miss out',
      'ar': 'على كل منتج تروّج له هذا الأسبوع!\nلا تفوّت الفرصة\"',
    },
    'u92is2uy': {
      'en': 'ID: ',
      'ar': 'المعرّف:',
    },
    'vrtga1ao': {
      'en': 'ID: AZYAA258746',
      'ar': 'المعرّف: AZYAA258746',
    },
    'ub1yozh4': {
      'en': 'add new promotion',
      'ar': 'أضف ترويجًا جديدًا',
    },
    'u1nt4lvc': {
      'en': 'Wallet balance',
      'ar': 'رصيد المحفظة',
    },
    'o2bnmjwq': {
      'en': '120 ',
      'ar': '',
    },
    'pjzej05c': {
      'en': 'KD',
      'ar': '',
    },
    'v6fh0451': {
      'en': 'Hello World',
      'ar': '',
    },
    '3jk37ydi': {
      'en': 'Quick Stats',
      'ar': 'إحصائيات سريعة',
    },
    'ngvhywgk': {
      'en': 'Hello World',
      'ar': '',
    },
    'fcisxitb': {
      'en': 'Total Promotions',
      'ar': 'إجمالي العروض الترويجية',
    },
    'leb2kzhj': {
      'en': 'Hello World',
      'ar': '',
    },
    'd5rve141': {
      'en': 'Custom Promotions',
      'ar': 'الترويجات المخصّصة',
    },
    'rs0hn87r': {
      'en': ' KD',
      'ar': '',
    },
    'qxbkhlz7': {
      'en': 'Hello World',
      'ar': '',
    },
    'iehf7uyc': {
      'en': 'Earned commission',
      'ar': 'العمولة المكتسبة',
    },
    '0kfbhc1f': {
      'en': 'Recently ',
      'ar': 'مؤخرًا',
    },
    'ztcuu6kz': {
      'en': 'Promoted',
      'ar': 'تم الترويج له',
    },
    'q9pp9okk': {
      'en': 'View More',
      'ar': '',
    },
    'abxrtio7': {
      'en': 'Inspiration ',
      'ar': 'الإلهام',
    },
    'tm0bx0ad': {
      'en': 'Centre',
      'ar': 'مركز',
    },
    'bowbofsl': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s2-CreatorWallet
  {
    'nbawwq23': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
    },
    'a2n4hzrn': {
      'en': 'Available Balance',
      'ar': 'الرصيد المتاح',
    },
    'turcj6uo': {
      'en': ' KD',
      'ar': '',
    },
    'ab15gsmw': {
      'en': 'Hello World',
      'ar': '',
    },
    'l66bvb7j': {
      'en': 'Total Earnings',
      'ar': 'إجمالي الأرباح',
    },
    '4jaokhff': {
      'en': 'Hello World',
      'ar': '',
    },
    'ri594qtl': {
      'en': 'Withdrawals',
      'ar': 'المسحوبات',
    },
    'yp84s1uf': {
      'en': 'Hello World',
      'ar': '',
    },
    '6i71bp55': {
      'en': 'Recent ',
      'ar': 'أحدث',
    },
    'rwmaml98': {
      'en': 'Transaction',
      'ar': 'العمليات',
    },
    't6fq8ad1': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    '0qkziktr': {
      'en': 'Search...',
      'ar': '',
    },
    'r38jj8bf': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    '6tpha8sl': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    '4gtsp677': {
      'en': 'This Year',
      'ar': 'هذه السنة',
    },
    'aeqc9pt8': {
      'en': 'This week',
      'ar': 'هذا الاسبوع',
    },
    '32fcwfc1': {
      'en': ' Sold',
      'ar': '',
    },
    '51jwwv9r': {
      'en': 'Price : ',
      'ar': '',
    },
    '8oypvhkw': {
      'en': ' KD',
      'ar': '',
    },
    'ejjnxfys': {
      'en': ' KWD',
      'ar': '',
    },
    '00tt6vop': {
      'en': '100 KWD',
      'ar': '',
    },
    'n2n12nvr': {
      'en': 'This month',
      'ar': 'هذا الشهر',
    },
    '12wqxpsi': {
      'en': '02 ',
      'ar': '',
    },
    'yraw29qw': {
      'en': 'Sold',
      'ar': '',
    },
    'mugdzbn8': {
      'en': 'Price : ',
      'ar': '',
    },
    '4o8k01ye': {
      'en': ' KD',
      'ar': '',
    },
    '2xct75oi': {
      'en': 'Last month',
      'ar': 'الشهر الماضي',
    },
    'enwpdbzt': {
      'en': ' Sold',
      'ar': '',
    },
    'aov0vjs2': {
      'en': 'Price : ',
      'ar': '',
    },
    'hjuxdkvj': {
      'en': ' KD',
      'ar': '',
    },
    'l8lvqo9i': {
      'en': ' KWD',
      'ar': '',
    },
    'cksvgwlt': {
      'en': '100 KWD',
      'ar': '',
    },
    't4hs8r4g': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // s3-QuickStats
  {
    '2ageag64': {
      'en': 'Recent Transactions',
      'ar': 'إحصائيات سريعة',
    },
    'fevp8qh8': {
      'en': 'Hello World',
      'ar': '',
    },
    '0eiyqxi5': {
      'en': 'Promoted Products sales',
      'ar': 'مبيعات المنتجات المروجة',
    },
    '5pzyzgxc': {
      'en': '400 ',
      'ar': '',
    },
    'r5ta3fva': {
      'en': 'Hello World',
      'ar': '',
    },
    '9kfyit4s': {
      'en': 'Total Earnings',
      'ar': 'إجمالي الأرباح',
    },
    '6zys7q66': {
      'en': '40 ',
      'ar': '',
    },
    'g0kqe70m': {
      'en': 'Hello World',
      'ar': '',
    },
    'dipaswjo': {
      'en': 'Total Withdrawals',
      'ar': 'إجمالي السحوبات',
    },
    'emxdq7qp': {
      'en': '20',
      'ar': '',
    },
    'm8r2ioc5': {
      'en': 'Hello World',
      'ar': '',
    },
    'fby5hq09': {
      'en': 'Available Balance',
      'ar': 'الرصيد المتاح',
    },
    '4yuaogdv': {
      'en': 'Recent ',
      'ar': 'حديث',
    },
    'udgg11b8': {
      'en': 'Transaction',
      'ar': 'عملية',
    },
    'aygshyj8': {
      'en': 'This Month',
      'ar': 'هذا الشهر',
    },
    'o17gvxyl': {
      'en': 'Search...',
      'ar': '',
    },
    'ammx6b2y': {
      'en': 'Classic',
      'ar': 'كلاسيك',
    },
    'pto2tx8w': {
      'en': 'Casual',
      'ar': 'كاجوال',
    },
    'v6krqv12': {
      'en': 'Sporty',
      'ar': 'رياضي',
    },
    'qq4v7yzl': {
      'en': 'This week',
      'ar': 'هذا الاسبوع',
    },
    '9uru58by': {
      'en': ' Sold',
      'ar': '',
    },
    'f7ssah3m': {
      'en': 'Price : ',
      'ar': '',
    },
    'q64syy9u': {
      'en': ' KD',
      'ar': '',
    },
    '8qylu8gb': {
      'en': 'This month',
      'ar': 'هذا الشهر',
    },
    'eqyf8se3': {
      'en': ' Sold',
      'ar': '',
    },
    'izp9zqhr': {
      'en': 'Price : ',
      'ar': '',
    },
    'ty64ohwa': {
      'en': 'KD',
      'ar': '',
    },
    'ixxof6w1': {
      'en': ' KWD',
      'ar': '',
    },
    '38ksebj9': {
      'en': '100 KWD',
      'ar': '',
    },
    'clz1eb9m': {
      'en': 'Last month',
      'ar': 'الشهر الماضي',
    },
    '3gpfy7jb': {
      'en': 'Sold',
      'ar': '',
    },
    '2e6vedt1': {
      'en': 'Price : ',
      'ar': '',
    },
    'chh8m85p': {
      'en': 'KD',
      'ar': '',
    },
    '81a0u6y4': {
      'en': ' KWD',
      'ar': '',
    },
    'hz4w5wtr': {
      'en': '100 KWD',
      'ar': '',
    },
    'xnaeprwp': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // PromotedProductsListing
  {
    'da74xi4d': {
      'en': 'Promoted Products ',
      'ar': 'المنتجات المروجة',
    },
    'txlm2hys': {
      'en': 'This ',
      'ar': 'هذا',
    },
    '3fh5vsva': {
      'en': 'Week',
      'ar': 'أسبوع',
    },
    'rjfansko': {
      'en': 'Yesterday ',
      'ar': '',
    },
    '6mdxrzrf': {
      'en': '03 ',
      'ar': '',
    },
    'af99su2g': {
      'en': 'Products',
      'ar': '',
    },
    'bpkvjrft': {
      'en': 'Yesterday ',
      'ar': '',
    },
    'or26dsa1': {
      'en': 'This ',
      'ar': 'هذا',
    },
    '710s24j8': {
      'en': 'Month',
      'ar': 'شهر',
    },
    'wr5alnh6': {
      'en': 'Yesterday ',
      'ar': '',
    },
    'tkvwge53': {
      'en': '03 ',
      'ar': '',
    },
    'o7p2k7qa': {
      'en': 'Products',
      'ar': '',
    },
    'yp6ynp2r': {
      'en': 'Yesterday ',
      'ar': '',
    },
    'wmnsjneu': {
      'en': 'Last ',
      'ar': 'آخر',
    },
    'h9edxv5a': {
      'en': 'Month',
      'ar': 'شهر',
    },
    'kwag5htp': {
      'en': 'Yesterday ',
      'ar': '',
    },
    '5kml75p6': {
      'en': '03 ',
      'ar': '',
    },
    'zarzsjlv': {
      'en': 'Products',
      'ar': '',
    },
    'iygmhwwt': {
      'en': 'Yesterday ',
      'ar': '',
    },
    '5syx2iou': {
      'en': 'Pervious ',
      'ar': 'السابقة',
    },
    't3vsdis3': {
      'en': 'Months',
      'ar': 'شهور',
    },
    'qiydyxfc': {
      'en': 'Yesterday ',
      'ar': '',
    },
    'dbikhpmg': {
      'en': '03 ',
      'ar': '',
    },
    'heuhp8me': {
      'en': 'Products',
      'ar': '',
    },
    'mq8323v3': {
      'en': 'Yesterday ',
      'ar': '',
    },
    'jne8i3qe': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // s5-Promotiondetails
  {
    'fvwof7iq': {
      'en': 'Promoted Products ',
      'ar': 'المنتجات المروَّجة',
    },
    '4nsa1z61': {
      'en': 'ID : ',
      'ar': 'المعرّف:',
    },
    'gylio5op': {
      'en': 'Edit Promotion',
      'ar': 'تعديل الترويج',
    },
    'eu0hf0g2': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    '7jigzw6w': {
      'en': 'Affiliated Link',
      'ar': 'الرابط التابع',
    },
    'k8io9svj': {
      'en': 'Copy',
      'ar': 'ينسخ',
    },
    'kl443qu3': {
      'en': 'Total Sales',
      'ar': 'إجمالي المبيعات',
    },
    'ou5ys9p2': {
      'en': ' Orders',
      'ar': 'الطلبات',
    },
    '0dwl7vs8': {
      'en': 'Hello World',
      'ar': '',
    },
    'fzum1lon': {
      'en': 'Total Commission',
      'ar': 'إجمالي العمولة',
    },
    '3ig0l9tm': {
      'en': ' KD',
      'ar': '',
    },
    'f9rjs5cl': {
      'en': 'Hello World',
      'ar': '',
    },
    '5qlygcfg': {
      'en': 'Recent ',
      'ar': 'حديث',
    },
    'ajdyykc4': {
      'en': 'Transaction',
      'ar': 'عملية',
    },
    '1qbr5tlc': {
      'en': 'Last 5 transacation',
      'ar': 'آخر 5 معاملات',
    },
    '26r2n4iv': {
      'en': ' Sold',
      'ar': '',
    },
    'pfr3ata3': {
      'en': 'Price : ',
      'ar': '',
    },
    '4v99p9op': {
      'en': '119.9 KD ',
      'ar': '',
    },
    '65imzj5b': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // s6-Pre-ApprovedCreatePromotion
  {
    'qpv5a6tv': {
      'en': 'Create Promotion',
      'ar': 'انشئ عرضاً ترويجياً',
    },
    'vt31c0dn': {
      'en': 'Create Your Style',
      'ar': '',
    },
    '6l7lxlmh': {
      'en': 'Select items & upload your looks',
      'ar': '',
    },
    '7w0fmey0': {
      'en': 'Select your items',
      'ar': '',
    },
    'tof4vefu': {
      'en': 'Select items & upload your looks',
      'ar': '',
    },
    'e3uvfovg': {
      'en': 'Instantly use Azyaa’s ready-to-use images (no approval needed).',
      'ar': '',
    },
    'es5fah37': {
      'en': 'Primary',
      'ar': '',
    },
    'ntetqh93': {
      'en': 'Secondary',
      'ar': '',
    },
    'm5uwfcez': {
      'en': 'Add Caption',
      'ar': '',
    },
    '2tj4i93k': {
      'en': 'Add Caption',
      'ar': '',
    },
    'ywfuw51a': {
      'en': 'Promotion',
      'ar': '',
    },
    'yc2gyb7t': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // s7-SelectedDress
  {
    '7o7vtqo0': {
      'en': 'Your Selected Items',
      'ar': '',
    },
    '5ig5nprd': {
      'en': 'Enter Code',
      'ar': '',
    },
    'cu3ay7zd': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'xcayy623': {
      'en': 'EBG-001',
      'ar': '',
    },
    't2syjfmz': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'g2l0gx3h': {
      'en': 'EBG-001',
      'ar': '',
    },
    'u2fjhw04': {
      'en': 'Add',
      'ar': '',
    },
    'birweb0m': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // CreatePromotionCustom
  {
    'kcaa1iig': {
      'en': 'Create Promotion',
      'ar': 'إنشاء العروض الترويجية',
    },
    'bdn455mv': {
      'en': 'Promotion Caption ',
      'ar': 'عنوان ترويجي',
    },
    '09a5j88f': {
      'en': '*',
      'ar': '',
    },
    'n92mqgzl': {
      'en': 'Name *',
      'ar': '',
    },
    'chnfirip': {
      'en': 'e.g., Designer dress',
      'ar': 'على سبيل المثال، فستان مصمم',
    },
    'tvti4vt1': {
      'en': 'Tell Us About Your Dress',
      'ar': 'أخبرنا عن فستانك',
    },
    'ihsrjmyp': {
      'en': 'Name *',
      'ar': '',
    },
    'giuehfh2': {
      'en': 'Brief Info',
      'ar': 'معلومات مختصرة',
    },
    'dwmi0o05': {
      'en': 'Add products you want to promote',
      'ar': 'أضف المنتجات التي تريد الترويج لها',
    },
    '7mhfik6p': {
      'en': 'Select the product that you have purchased to make a',
      'ar': 'اختر المنتج الذي اشتريته لإنشاء',
    },
    'iqmuzf89': {
      'en': ' promotion',
      'ar': 'ترويج',
    },
    'u5l67zmj': {
      'en': 'Select Product',
      'ar': 'اختر المنتج',
    },
    'ri91cxnb': {
      'en': 'Remove all',
      'ar': 'إزالة الكل',
    },
    'mwmij76i': {
      'en': 'Add Photos of the Dress',
      'ar': 'أضف صورًا للفستان',
    },
    'b24fu42y': {
      'en': 'upload appropriate pictures that follows our ',
      'ar': 'قم برفع صور مناسبة تتوافق مع',
    },
    '16raleq4': {
      'en': 'Guidelines ',
      'ar': '',
    },
    '0yihe8wd': {
      'en': '& ',
      'ar': '',
    },
    'dwu8arbm': {
      'en': 'Policy ',
      'ar': '',
    },
    '43r9xgjo': {
      'en': 'Upload Primary Photo',
      'ar': 'رفع الصورة الأساسية',
    },
    'm0lmy7x6': {
      'en': 'Remove',
      'ar': 'إزالة',
    },
    'ut35fmj8': {
      'en': 'Add Videos',
      'ar': 'إضافة مقاطع فيديو',
    },
    '9cedo5xv': {
      'en': 'Add Secondary Photos',
      'ar': 'إضافة صور ثانوية',
    },
    '1heef6ac': {
      'en': 'Remove all',
      'ar': 'إزالة الكل',
    },
    'wte8nw4b': {
      'en': 'Submit for Review',
      'ar': 'إرسال للمراجعة',
    },
    'vwfuyszj': {
      'en': 'Promotion caption is required',
      'ar': 'يجب إدخال وصف للإعلان',
    },
    'o2ezdze3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8ov7takb': {
      'en': 'Brief Info is required',
      'ar': '',
    },
    'gbtmekt1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fztbzpin': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // CreatorsPromotion-SubmittedSuccesfully
  {
    'dayhnj8j': {
      'en': '🎉 Submission Received!',
      'ar': '🎉 تم استلام الطلب!',
    },
    'mbiakj67': {
      'en':
          'Thank you for sharing your style! Our team will review your submission, and you’ll be notified once it’s approved. Stay stylish! ✨',
      'ar':
          'شكرًا لمشاركتك أسلوبك! سيقوم فريقنا بمراجعة مشاركتك، وسيتم إشعارك عند الموافقة. ابقَ متألّقًا! ✨',
    },
    'imrwimdf': {
      'en': 'Turn on notification',
      'ar': 'تشغيل الإشعارات',
    },
    'giw2yxkr': {
      'en': 'Done',
      'ar': 'تم',
    },
    '4e6aqfrp': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // s1-FAQ-Contactus
  {
    'kd0t44nj': {
      'en': 'Help Center',
      'ar': '',
    },
    'f9nmuhvj': {
      'en': 'FAQ',
      'ar': '',
    },
    'bv4h8gb5': {
      'en': 'General',
      'ar': '',
    },
    'ktf5ffda': {
      'en': 'Orders',
      'ar': '',
    },
    '8wty5r04': {
      'en': 'Payments',
      'ar': '',
    },
    '7hz5kmk9': {
      'en': 'Returns ',
      'ar': '',
    },
    'slyu5mb0': {
      'en': '20 KWD',
      'ar': '',
    },
    'o2cobvkc': {
      'en': '80 KWD',
      'ar': '',
    },
    'd321npeu': {
      'en': '70 KWD',
      'ar': '',
    },
    '8i0votp4': {
      'en': '10 KWD',
      'ar': '',
    },
    'nu510enw': {
      'en': '30 KWD',
      'ar': '',
    },
    'm0t2jg3c': {
      'en': '25 KWD',
      'ar': '',
    },
    'o53a4lku': {
      'en': 'How can I update my account information?',
      'ar': '',
    },
    'g3t567il': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    'vi5rjrs4': {
      'en': 'How do I track my order?',
      'ar': '',
    },
    '2hmkkq5g': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    'wnjmqqry': {
      'en': 'Can I modify or cancel my order after                 placing it?',
      'ar': '',
    },
    'abn1tzba': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    'yc6y93yj': {
      'en': 'What should I do if I receive the wrong item?',
      'ar': '',
    },
    'zy0nozdk': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    '0t7ajhos': {
      'en': 'Is my payment information secure?',
      'ar': '',
    },
    '9jadipb5': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    'ovx5gmmt': {
      'en': 'What is your return policy?',
      'ar': '',
    },
    '4yu1d9my': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    'x67jiz0d': {
      'en': 'How long does it take to process a refund?',
      'ar': '',
    },
    'zn89c7mi': {
      'en':
          'How can I update my account information?\nGo to “Profile” and select “Edit Profile” to update your information, such as email, phone number, and address.',
      'ar': '',
    },
    'sdovryn4': {
      'en': 'Contact Us',
      'ar': '',
    },
    'xgevzjqk': {
      'en': 'Customer Services',
      'ar': '',
    },
    'mgzarrvs': {
      'en': 'WhatsApp',
      'ar': '',
    },
    'efygy52c': {
      'en': 'Website',
      'ar': '',
    },
    'i83n7udd': {
      'en': 'Account',
      'ar': '',
    },
  },
  // Forgot-password
  {
    'g0z3rztv': {
      'en': 'Password Reset',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'xgonm6mk': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
    },
    'r66b2c27': {
      'en': 'Email ',
      'ar': 'بريد إلكتروني',
    },
    'y6zwf08c': {
      'en': '*',
      'ar': '*',
    },
    'p47uiujo': {
      'en': 'Name *',
      'ar': '',
    },
    '8r86b5v4': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'g84emnx3': {
      'en': 'Send',
      'ar': 'يرسل',
    },
    '0w4nsyoq': {
      'en': 'Please provide a valid email ',
      'ar': 'يرجى تقديم بريد إلكتروني صالح',
    },
    'kkzsruba': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5cvzhtpp': {
      'en': 'Please enter password',
      'ar': '',
    },
    'i5adyekb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'v640bfv0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s8-CustomUploadsCreatePromotionbc
  {
    '01k3kv1c': {
      'en': 'Create Promotion',
      'ar': 'إنشاء العروض الترويجية',
    },
    'o4ebwfrq': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // test_list
  {
    'mjxmgkmu': {
      'en': 'Order Details',
      'ar': '',
    },
    'w37w5itc': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '7pnjco5h': {
      'en': 'EBG-001',
      'ar': '',
    },
    '9lvsjv3x': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'ebokbm50': {
      'en': 'EBG-001',
      'ar': '',
    },
    'czwq32w5': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '08p4h199': {
      'en': 'EBG-001',
      'ar': '',
    },
    'd5849g7e': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'yhu702g3': {
      'en': 'EBG-001',
      'ar': '',
    },
    'uiomodg3': {
      'en': 'Designer Dress',
      'ar': '',
    },
    '0xi02jfg': {
      'en': 'EBG-001',
      'ar': '',
    },
    'uben3nzr': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'hhlpk9ur': {
      'en': 'EBG-001',
      'ar': '',
    },
    '58z0ehoe': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'w4zjh3cr': {
      'en': 'EBG-001',
      'ar': '',
    },
    '0b2d6y8n': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'fd2lwzst': {
      'en': 'EBG-001',
      'ar': '',
    },
    'jqjxkej5': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'c6kj0gko': {
      'en': 'EBG-001',
      'ar': '',
    },
    '2p84wx2w': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'ie200ria': {
      'en': 'EBG-001',
      'ar': '',
    },
    'bm440p1t': {
      'en': 'Back',
      'ar': '',
    },
    '5yehuoic': {
      'en': 'Page Title',
      'ar': '',
    },
    'srellreq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CreatorSpacetestpage
  {
    'hvry0nkl': {
      'en': 'Creator Space',
      'ar': '',
    },
    'w5s85wy8': {
      'en': 'Earn 20% Extra Commission',
      'ar': '',
    },
    'trak2167': {
      'en': 'on every product you promote this week! Don’t miss out',
      'ar': '',
    },
    'esaaedib': {
      'en': 'add new promotion',
      'ar': '',
    },
    '5xl4o1w0': {
      'en': 'Earn 20% Extra Commission',
      'ar': '',
    },
    'f6er9g44': {
      'en': 'on every product you promote this week! Don’t miss out.',
      'ar': '',
    },
    'xng30v66': {
      'en': 'Earn 20% Extra Commission',
      'ar': '',
    },
    'zy0578k6': {
      'en': 'on every product you promote this week! Don’t miss out.',
      'ar': '',
    },
    'w5s3dz66': {
      'en': 'Earn 20% Extra Commission',
      'ar': '',
    },
    'flq02hfb': {
      'en': 'on every product you promote this week! Don’t miss out.',
      'ar': '',
    },
    'n7mfhn97': {
      'en': 'Creator Space',
      'ar': '',
    },
    'jc1dc0ci': {
      'en': 'add new promotion',
      'ar': '',
    },
    'crr1npo3': {
      'en': 'Wallet balance',
      'ar': '',
    },
    'st304ila': {
      'en': '120 ',
      'ar': '',
    },
    'xuknb0r2': {
      'en': 'KD',
      'ar': '',
    },
    'z5l74pah': {
      'en': 'Hello World',
      'ar': '',
    },
    '6dq6vzbw': {
      'en': 'Quick Stats',
      'ar': '',
    },
    'ksfr4i9k': {
      'en': 'Hello World',
      'ar': '',
    },
    'oh81swht': {
      'en': 'Total Promotions',
      'ar': '',
    },
    'ccde8pqe': {
      'en': ' KD',
      'ar': '',
    },
    'txfrdned': {
      'en': 'Hello World',
      'ar': '',
    },
    'rc7sdbvt': {
      'en': 'Earned commission',
      'ar': '',
    },
    'vh3zoeld': {
      'en': 'Recently ',
      'ar': '',
    },
    '2r9v6g78': {
      'en': 'Promoted',
      'ar': '',
    },
    '06r96mta': {
      'en': 'View More',
      'ar': '',
    },
    'r1jnsali': {
      'en': 'Inspiration ',
      'ar': '',
    },
    'dbsaoadc': {
      'en': 'Centre',
      'ar': '',
    },
    'roci7bh8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Creators-IndividualPromo
  {
    '7l8juwqq': {
      'en': 'Creators Hub ',
      'ar': 'مجتمع المبدعين',
    },
    '94vg1rgm': {
      'en': 'Promo code : ',
      'ar': 'كود خصم:',
    },
    'qmeqb9zk': {
      'en': 'Caption',
      'ar': 'التعليق',
    },
    'jwr42f9w': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    'ohezrg6m': {
      'en': 'Curated in this post',
      'ar': 'منسّق في هذا المنشور',
    },
    'ppjzbh70': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Profile-EditTEMP
  {
    '429fc951': {
      'en': 'Edit Profile ',
      'ar': 'تعديل الملف الشخصي',
    },
    'c33v5k1l': {
      'en': 'My Info',
      'ar': 'معلوماتي',
    },
    'c2ill00b': {
      'en': 'ADD PICTURE',
      'ar': '',
    },
    'dxja8fyp': {
      'en': 'First Name ',
      'ar': 'الاسم الأول',
    },
    '7010akvs': {
      'en': '*',
      'ar': '',
    },
    'vrzit4cc': {
      'en': 'Name *',
      'ar': '',
    },
    'fad3nsos': {
      'en': 'Enter your name',
      'ar': 'أدخل اسمك',
    },
    '60vw1omd': {
      'en': 'Last Name ',
      'ar': 'اسم العائلة',
    },
    'm4alqw1g': {
      'en': '*',
      'ar': '',
    },
    'nkds9kvu': {
      'en': 'Name *',
      'ar': '',
    },
    'bfbkyrrj': {
      'en': 'Enter your name',
      'ar': 'أدخل اسمك',
    },
    'g6l6mnt8': {
      'en': 'Gender ',
      'ar': 'جنس',
    },
    'dww2ub81': {
      'en': '*',
      'ar': '',
    },
    'optyl219': {
      'en': 'Date of Birth*',
      'ar': '',
    },
    'r7tp9inm': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    '4yqwjn12': {
      'en': 'Date of Birth ',
      'ar': 'تاريخ الميلاد',
    },
    '2gcjx4mr': {
      'en': '*',
      'ar': '',
    },
    'kch9wh4u': {
      'en': 'Date of Birth*',
      'ar': '',
    },
    'fld0s6i3': {
      'en': 'Email ID ',
      'ar': 'معرف البريد الإلكتروني',
    },
    'rrggfuva': {
      'en': '*',
      'ar': '',
    },
    'n4mwc3zf': {
      'en': 'Email ID *',
      'ar': '',
    },
    'cvn0dmv6': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '8agqlam6': {
      'en': 'Mobile Number ',
      'ar': 'رقم الهاتف المحمول',
    },
    '9028xecy': {
      'en': '*',
      'ar': '',
    },
    'quu9wwxn': {
      'en': 'Phone Number *',
      'ar': '',
    },
    '921s5gff': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    'q0b9t9n4': {
      'en': 'Alternate Number ',
      'ar': 'رقم بديل',
    },
    'zl74ksgw': {
      'en': 'Alternate Number *',
      'ar': '',
    },
    'cf6zfxol': {
      'en': 'Enter your alternate number',
      'ar': 'أدخل رقمك البديل',
    },
    'jiu8zufu': {
      'en': 'Please enter first name',
      'ar': '',
    },
    'vi14nkm1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '864a0tkx': {
      'en': 'Please enter last name',
      'ar': '',
    },
    '4xoetuya': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'u4yg77en': {
      'en': 'Please provide a valid email',
      'ar': '',
    },
    'u8h971x4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lxyo4w0p': {
      'en': 'Please enter mobile number',
      'ar': '',
    },
    'zweq3029': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nd39kwq3': {
      'en': 'Enter your alternate number ',
      'ar': '',
    },
    'ib592wa0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    's8y8qsm1': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'c4i4y297': {
      'en': 'Preferred Styles',
      'ar': 'الأنماط المفضلة',
    },
    '27g95lys': {
      'en': 'Choose Your Style Preferences ',
      'ar': 'اختر تفضيلات أسلوبك',
    },
    'wtcfl2o7': {
      'en':
          'Select your favorite styles to personalize your shopping experience. We\'ll recommend outfits tailored just for you!',
      'ar':
          'اختر إطلالاتك المفضلة لتخصيص تجربة تسوقك. سنقترح عليك أزياءً مصممة خصيصًا لك!',
    },
    '6p7n4ivj': {
      'en': 'Save Styles',
      'ar': '',
    },
    'onpudwyd': {
      'en': 'Body Measurement',
      'ar': 'قياس الجسم',
    },
    'hade6qdv': {
      'en': 'Add a New body Measurement',
      'ar': 'إضافة قياس جديد للجسم',
    },
    'osb3tu8v': {
      'en': 'Height : ',
      'ar': 'ارتفاع :',
    },
    'bndjh2zt': {
      'en': ' , ',
      'ar': '',
    },
    'dfupune3': {
      'en': 'Weight : ',
      'ar': 'وزن :',
    },
    's8c4yyrg': {
      'en': 'Hello World',
      'ar': '',
    },
    'ppbeoma7': {
      'en': 'Deafult',
      'ar': 'ديافول',
    },
    '4bjwjo0k': {
      'en': 'My Address',
      'ar': 'عنواني',
    },
    'kam3qnu4': {
      'en': 'Add a New Address',
      'ar': 'إضافة عنوان جديد',
    },
    '7rnxnwvw': {
      'en': ' (',
      'ar': '',
    },
    'owedi1d5': {
      'en': '), ',
      'ar': '',
    },
    'spy48cbb': {
      'en': 'John Doe ',
      'ar': '',
    },
    'xrcwelty': {
      'en': ', ',
      'ar': '',
    },
    'x44wy26r': {
      'en': ', ',
      'ar': '',
    },
    '8ypr0rgf': {
      'en': 'Hello World',
      'ar': '',
    },
    '5oblb9nx': {
      'en': 'Deafult',
      'ar': 'ديافول',
    },
    'ns3ke8wn': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'i2o0h265': {
      'en': 'Logout from my account',
      'ar': 'تسجيل الخروج من حسابي',
    },
    'jt50gx49': {
      'en': 'Delete my account',
      'ar': '',
    },
    'd2xltoa9': {
      'en':
          'You will not be able to access your personal data including your old orders, saved address, payment methods etc.',
      'ar': '',
    },
    'fmfddae6': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Address
  {
    'ua8ylzdj': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'ka9uqgyv': {
      'en': 'Add a New Address',
      'ar': 'إضافة عنوان جديد',
    },
    'zrx9iw4j': {
      'en': ', ',
      'ar': '',
    },
    '4qtjbhoj': {
      'en': 'John Doe ',
      'ar': '',
    },
    'gjy3pr26': {
      'en': ', ',
      'ar': '',
    },
    'zhlpy6e3': {
      'en': ', ',
      'ar': '',
    },
    'lbqesnqh': {
      'en': 'Hello World',
      'ar': '',
    },
    'p3ujg3pk': {
      'en': 'Deafult',
      'ar': 'ديافول',
    },
    'e28vmo3d': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Measurement
  {
    'g3ddhxqf': {
      'en': 'Body Measurement',
      'ar': 'تعديل الملف الشخصي',
    },
    '74kkmpb4': {
      'en': 'Add a New body Measurement',
      'ar': 'إضافة قياسات جديدة للجسم .',
    },
    'qcfwg21y': {
      'en': 'Height : ',
      'ar': 'الطول.',
    },
    'g2lwsf2n': {
      'en': ' , ',
      'ar': '',
    },
    'tnlrgzrx': {
      'en': 'Weight : ',
      'ar': 'الوزن:',
    },
    'psyvort4': {
      'en': 'Hello World',
      'ar': '',
    },
    '5guadokm': {
      'en': 'Deafult',
      'ar': 'ديافول',
    },
    '5laqa6u7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ComingSoon
  {
    'l3325mjy': {
      'en': 'Coming Soon...',
      'ar': 'تعديل الملف الشخصي',
    },
    'j0d3nkrb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Stores-List
  {
    'gxpfxdk5': {
      'en': 'Stores Hub ',
      'ar': 'المتاجر',
    },
    'hrbrnf38': {
      'en': 'Confusion while selecting \ndresses?',
      'ar': 'هل تشعرين بالحيرة حين تختارين الفساتين؟',
    },
    '2vaeir2v': {
      'en': 'Consult Now',
      'ar': 'استشر الآن',
    },
    '6yucnqof': {
      'en': 'Our ',
      'ar': 'ملكنا',
    },
    'jf1gysah': {
      'en': 'Designers',
      'ar': '',
    },
    'xkqar160': {
      'en':
          'Discover collections from our talented designers, bringing unique and exclusive fashion to you. Follow your favorites to stay updated on their latest creations.',
      'ar':
          'اكتشفي مجموعات مصممينا الموهوبين، الذين يقدمون لكِ أزياءً فريدة وحصرية. تابعي مصمميكِ المفضلين لتبقى على اطلاع بأحدث إبداعاتهم.',
    },
    'izrn4w41': {
      'en': 'Confusion while \nselecting dresses?',
      'ar': 'هل تشعرين بالحيرة حين تختارين الفساتين؟',
    },
    '631hfqft': {
      'en': 'Consult Now',
      'ar': 'استشر الآن',
    },
    'aibnfycg': {
      'en': 'All',
      'ar': 'الكل',
    },
    '5urltqi8': {
      'en': 'Discover',
      'ar': 'يكتشف',
    },
    'otd0s83z': {
      'en': 'Following',
      'ar': 'التالي',
    },
    'xnk3pfnb': {
      'en': 'All',
      'ar': 'الكل',
    },
    '07yicerj': {
      'en': 'Best Rated',
      'ar': '',
    },
    'nqydvlrb': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // VirtualTryOn
  {
    'qwrm4duf': {
      'en': 'You have not yet tried Virtual Try On Feature',
      'ar': 'لم تقم بتجربة ميزة التجربة الافتراضية بعد',
    },
    'bq2lxqjc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TEST
  {
    'qf42p87r': {
      'en': 'Back',
      'ar': '',
    },
    'ecxr7nk3': {
      'en': 'Page Title',
      'ar': '',
    },
    'duvbftzu': {
      'en': 'Wohoo! your outfit is ready',
      'ar': '',
    },
    '4p1nn5jl': {
      'en': 'You can find all your Try ons in account section later',
      'ar': '',
    },
    'x3lct0tl': {
      'en': 'View other dress',
      'ar': 'الدفع',
    },
    '0hpt774y': {
      'en': 'Share',
      'ar': 'الدفع',
    },
    'yit4e1yu': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VirtualTryOn_Slides
  {
    'vovoo1fb': {
      'en': 'Close',
      'ar': 'يغلق',
    },
    'lwztzudc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // VirtualTryOnCopy
  {
    '95dio177': {
      'en': 'Share',
      'ar': '',
    },
    'mt0jqeoz': {
      'en': 'Download',
      'ar': '',
    },
    '9fp9sizl': {
      'en': 'Delete',
      'ar': '',
    },
    'w5m5b1kp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Waitlist_Secret
  {
    'ichekjt6': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'p3er7u3r': {
      'en': '*',
      'ar': '*',
    },
    'lfx41vxx': {
      'en': 'Name *',
      'ar': '',
    },
    'aq9x9vdg': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    '5kq3xawz': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'e6a6qys6': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    'nlr52y1a': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'ntknyooc': {
      'en': '*',
      'ar': '*',
    },
    'jdl1r36s': {
      'en': 'Name *',
      'ar': '',
    },
    'ppm62ed6': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '1qgmnrsb': {
      'en': 'Enter Your Invitation Code',
      'ar': 'أدخل رمز الدعوة الخاص بك',
    },
    'mwen93vf': {
      'en': 'Already have a code? Enter it below to unlock exclusive access.',
      'ar': 'هل لديك رمز بالفعل؟ أدخله أدناه لفتح الوصول الحصري.',
    },
    'e4fnfvfp': {
      'en': 'Activate Access',
      'ar': 'يرسل',
    },
    '5bany6gw': {
      'en': 'PIN code is required',
      'ar': '',
    },
    'oj5wftwe': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Terms
  {
    '1yl0msha': {
      'en': '1. Agreement to Terms',
      'ar': '1ـ الموافقة على الشروط',
    },
    'ne75sod9': {
      'en':
          'By accessing or using our App, you agree to be bound by these Terms and Conditions and our Privacy Policy. If you do not agree to these Terms and Conditions, you may not use the App.',
      'ar':
          'باستخدامك تطبيقنا أو وصولك إليه، فإنك توافق على الالتزام بهذه الشروط والأحكام وسياسة الخصوصية الخاصة بنا. في حال عدم موافقتك على هذه الشروط والأحكام، لا يجوز لك استخدام التطبيق',
    },
    'sa06e5kf': {
      'en': '2. Changes to Terms',
      'ar': '2ـتغييرات على الشروط',
    },
    'a1bgaoiu': {
      'en':
          'We reserve the right to modify these Terms and Conditions at any time, in our sole discretion. If we do so, we will notify you by posting the updated terms on the App. It is your responsibility to review these Terms and Conditions periodically.',
      'ar':
          'قد نشارك المعلومات التي جمعناها عنك في مواقف معيّنة. قد يتم الإفصاح عن معلوماتك على النحو التالي:',
    },
    'dwme0lal': {
      'en': '3. User Representations',
      'ar': '3ـ إقرارات المستخدم',
    },
    'd9ki5hvk': {
      'en': 'By using the App, you represent and warrant that:',
      'ar': 'عند استخدام التطبيق، فإنك تقر وتضمن ما يلي',
    },
    'mafxix2h': {
      'en':
          '• All registration information you submit will be true, accurate, current, and complete.\n• You will maintain the accuracy of such information and promptly update such registration information as necessary.\n• You have the legal capacity and you agree to comply with these Terms and Conditions.\n• You are not a minor in the jurisdiction in which you reside.\n• You will not access the App through automated or non-human means, whether through a bot, script, or otherwise.\n• You will not use the App for any illegal or unauthorized purpose.\n• Your use of the App will not violate any applicable law or regulation.',
      'ar':
          '• جميع معلومات التسجيل التي تقدمها صحيحة ودقيقة وحديثة وكاملة.\n• تتعهد بالحفاظ على دقة هذه المعلومات وتحديث بيانات التسجيل فور حدوث أي تغيير.\n• تتمتع بالأهلية القانونية الكاملة، وتوافق على الالتزام بهذه الشروط والأحكام.\n• لست قاصرًا وفقًا للقوانين المعمول بها في جهة إقامتك.\n• تتعهد بعدم الوصول إلى التطبيق أو استخدامه بوسائل آلية أو غير بشرية، بما في ذلك الروبوتات أو البرامج النصية أو أي وسائل مشابهة.\n• تتعهد بعدم استخدام التطبيق لأي أغراض غير قانونية أو غير مصرح بها.\n• لن يؤدي استخدامك للتطبيق إلى مخالفة أي قانون أو لائحة أو تشريع معمول به.',
    },
    'klzqvdh5': {
      'en': '4. Prohibited Activities',
      'ar': '4ـالأنشطة المحظورة',
    },
    '1zc4nqzb': {
      'en':
          'You may not access or use the App for any purpose other than that for which we make the App available. The App may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us.\n\nAs a user of the App, you agree not to:',
      'ar':
          'إلى التطبيق أو استخدامه لأي غرض غير الغرض الذي نوفره من أجله. لا يجوز استخدام التطبيق في أي أغراض تجارية باستثناء تلك التي نعتمدها أو نوافق عليها تحديدًا.\n\nبصفتك مستخدمًا للتطبيق، فإنك توافق على عدم:\")',
    },
    'jwmm81ex': {
      'en':
          '• Systematically retrieve data or other content from the App to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us.\n• Make any unauthorized use of the App, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses.\n• Use the App to advertise or offer to sell goods and services.\n• Circumvent, disable, or otherwise interfere with security-related features of the App, including features that prevent or restrict the use or copying of any Content or enforce limitations on the use of the App and/or the Content contained therein.\n• Engage in unauthorized framing of or linking to the App.\n• Trick, defraud, or mislead us and other users, especially in any attempt to learn sensitive account information such as user passwords.\n• Make improper use of our support services or submit false reports of abuse or misconduct.\nEngage in any automated use of the system, such as using scripts to send comments or messages, or using any data mining, robots, or similar data gathering and extraction tools.\n• Interfere with, disrupt, or create an undue burden on the App or the networks or services connected to the App.\n• Attempt to impersonate another user or person or use the username of another user.\n• Use the App as part of any effort to compete with us or otherwise use the App and/or the Content for any revenue-generating endeavor or commercial enterprise.\n• Decipher, decompile, disassemble, or reverse engineer any of the software comprising or in any way making up a part of the App.\n• Attempt to bypass any measures of the App designed to prevent or restrict access to the App, or any portion of the App.\n• Harass, annoy, intimidate, or threaten any of our employees or agents engaged in providing any portion of the App to you.\n• Delete the copyright or other proprietary rights notice from any Content.\n• Copy or adapt the App’s software, including but not limited to Flash, PHP, HTML, JavaScript, or other code.\n• Upload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material that interferes with any party’s uninterrupted use and enjoyment of the App or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the App.\n• Upload or transmit (or attempt to upload or to transmit) any material that acts as a passive or active information collection or transmission mechanism, including without limitation, clear graphics interchange formats (“gifs”), 1×1 pixels, web bugs, cookies, or other similar devices (sometimes referred to as “spyware” or “passive collection mechanisms” or “pcms”).\n• Except as may be the result of standard search engine or Internet browser usage, use, launch, develop, or distribute any automated system, including without limitation, any spider, robot, cheat utility, scraper, or offline reader that accesses the App, or using or launching any unauthorized script or other software.\n• Disparage, tarnish, or otherwise harm, in our opinion, us and/or the App.\n• Use the App in a manner inconsistent with any applicable laws or regulations.',
      'ar':
          '• استخدام التطبيق كجزء من أي محاولة للتنافس معنا أو لأي غرض تجاري أو تحقيق إيرادات باستخدام التطبيق و/أو المحتوى.\n• فك تشفير أو تفكيك أو إعادة هندسة أي جزء من البرنامج الذي يشكل التطبيق.\n• محاولة تجاوز أي إجراءات حماية في التطبيق مصممة لمنع أو تقييد الوصول إلى التطبيق أو أي جزء منه.\n• مضايقة أو تهديد أي من موظفينا أو وكلائنا المشاركين في تقديم أي جزء من التطبيق لك.\n• حذف إشعارات حقوق النشر أو حقوق الملكية من أي محتوى.\n• نسخ أو تعديل برنامج التطبيق، بما في ذلك على سبيل المثال لا الحصر Flash أو PHP أو HTML أو JavaScript أو أي كود آخر.\n• تحميل أو نقل (أو محاولة تحميل أو نقل) فيروسات أو أحصنة طروادة أو أي مواد تعيق الاستخدام السلس للتطبيق أو تؤثر على وظائفه أو صيانته.\n• تحميل أو نقل (أو محاولة تحميل أو نقل) أي مواد تعمل كآلية لجمع أو نقل المعلومات بشكل نشط أو سلبي، بما في ذلك، على سبيل المثال لا الحصر، صور GIF، بكسل 1×1، برامج تتبع الويب، الكوكيز أو أجهزة مشابهة (المعروفة أحيانًا باسم \"برمجيات تجسس\" أو \"آليات جمع سلبي\").\n• باستثناء ما قد ينتج عن استخدام محركات البحث أو متصفحات الإنترنت العادية، استخدام أو تشغيل أو تطوير أو توزيع أي نظام آلي، بما في ذلك أي روبوت أو أداة غش أو أداة استخراج بيانات أو قارئ غير متصل بالإنترنت يصل إلى التطبيق، أو استخدام أو تشغيل أي سكريبت أو برنامج غير مصرح به.\n• التشهير بنا أو الإضرار بسمعتنا أو سمعة التطبيق بأي شكل نراه ضارًا.\n• استخدام التطبيق بطريقة غير متوافقة مع أي قوانين أو لوائح سارية.• استرجاع البيانات أو المحتوى من التطبيق بشكل منهجي لإنشاء أو تجميع، بشكل مباشر أو غير مباشر، مجموعة أو قاعدة بيانات أو دليل، دون الحصول على إذن كتابي منا.',
    },
    'fohtelii': {
      'en': '5. User Generated Contributions',
      'ar': '5. مساهمات المستخدم',
    },
    '0ub6g1dd': {
      'en':
          'The App may invite you to chat, contribute to, or participate in blogs, message boards, online forums, and other functionality, and may provide you with the opportunity to create, submit, post, display, transmit, perform, publish, distribute, or broadcast content and materials to us or on the App, including but not limited to text, writings, video, audio, photographs, graphics, comments, suggestions, or personal information or other material (collectively, \"Contributions\"). Contributions may be viewable by other users of the App and through third-party websites.\n\nWhen you create or make available any Contributions, you thereby represent and warrant that:',
      'ar':
          'قد يدعوك التطبيق للدردشة أو المساهمة أو المشاركة في المدونات ولوحات الرسائل والمنتديات الإلكترونية وغيرها من الوظائف، وقد يتيح لك فرصة إنشاء محتوى ومواد، أو إرسالها، أو نشرها، أو عرضها، أو بثها، أو بثها، أو بثها، أو توزيعها، أو بثها إلينا أو على التطبيق، بما في ذلك على سبيل المثال لا الحصر، النصوص، والكتابات، والفيديوهات، والمقاطع الصوتية، والصور، والرسومات، والتعليقات، والاقتراحات، أو المعلومات الشخصية، أو غيرها من المواد (يُشار إليها مجتمعةً باسم \"المساهمات\"). قد يتمكن مستخدمو التطبيق الآخرون، ومن خلال مواقع الجهات الخارجية، من الاطلاع على هذه المساهمات.\n\nعند إنشاء أو إتاحة أي مساهمات، فإنك تُقر وتضمن ما يلي:',
    },
    '38x29bhk': {
      'en':
          '• The creation, distribution, transmission, public display, or performance, and the accessing, downloading, or copying of your Contributions do not and will not infringe the proprietary rights, including but not limited to the copyright, patent, trademark, trade secret, or moral rights of any third party.\n• You are the creator and owner of or have the necessary licenses, rights, consents, releases, and permissions to use and to authorize us, the App, and other users of the App to use your Contributions in any manner contemplated by the App and these Terms and Conditions.\n• You have the written consent, release, and/or permission of each and every identifiable individual person in your Contributions to use the name or likeness of each and every such identifiable individual person to enable inclusion and use of your Contributions in any manner contemplated by the App and these Terms and Conditions.\n• Your Contributions are not false, inaccurate, or misleading.\n• Your Contributions are not unsolicited or unauthorized advertising, promotional materials, pyramid schemes, chain letters, spam, mass mailings, or other forms of solicitation.\n• Your Contributions are not obscene, lewd, lascivious, filthy, violent, harassing, libelous, slanderous, or otherwise objectionable (as determined by us).\n• Your Contributions do not ridicule, mock, disparage, intimidate, or abuse anyone.\n• Your Contributions are not used to harass or threaten (in the legal sense of those terms) any other person and to promote violence against a specific person or class of people.\n• Your Contributions do not violate any applicable law, regulation, or rule.\n• Your Contributions do not violate the privacy or publicity rights of any third party.\n• Your Contributions do not contain any material that solicits personal information from anyone under the age of 18 or exploits people under the age of 18 in a sexual or violent manner.\n• Your Contributions do not violate any federal or state law concerning child pornography, or otherwise intended to protect the health or well-being of minors.\n• Your Contributions do not include any offensive comments that are connected to race, national origin, gender, sexual preference, or physical handicap.\n• Your Contributions do not otherwise violate, or link to material that violates, any provision of these Terms and Conditions, or any applicable law or regulation.\n\nAny use of the App in violation of the foregoing violates these Terms and Conditions and may result in, among other things, termination or suspension of your rights to use the App.',
      'ar':
          '• إن إنشاء مساهماتك، أو توزيعها، أو إرسالها، أو عرضها للعامة، أو أدائها، أو الوصول إليها، أو تنزيلها، أو نسخها، لا ينتهك ولن ينتهك حقوق الملكية، بما في ذلك على سبيل المثال لا الحصر، حقوق النشر، أو براءات الاختراع، أو العلامات التجارية، أو الأسرار التجارية، أو الحقوق المعنوية لأي طرف ثالث.\n\n• أنت المنشئ والمالك، أو لديك التراخيص والحقوق والموافقات والإصدارات والأذونات اللازمة لاستخدام مساهماتك، وتفويضنا نحن، والتطبيق، ومستخدمي التطبيق الآخرين، باستخدامها بأي طريقة ينص عليها التطبيق وهذه الشروط والأحكام.\n\n• لديك موافقة كتابية، وإصدار، و/أو إذن من كل شخص يمكن تحديد هويته في مساهماتك، لاستخدام اسم أو صورة كل شخص يمكن تحديد هويته لتمكين إدراج واستخدام مساهماتك بأي طريقة ينص عليها التطبيق وهذه الشروط والأحكام.\n\n• مساهماتك ليست زائفة، أو غير دقيقة، أو مضللة.\n• مساهماتك ليست إعلانات أو مواد ترويجية غير مرغوب فيها أو غير مصرح بها، أو مخططات تسويق هرمية، أو رسائل متسلسلة، أو بريدًا عشوائيًا، أو رسائل بريدية جماعية، أو أي شكل آخر من أشكال الترويج.\n• مساهماتك ليست بذيئة، أو فاحشة، أو فاضحة، أو بذيئة، أو عنيفة، أو مضايقة، أو تشهيرية، أو قذفية، أو غير مقبولة بأي شكل آخر (كما نحدده).\n• مساهماتك لا تسخر من أي شخص، أو تسخر منه، أو تنتقص منه، أو ترهبه، أو تسيء إليه.\n• لا تُستخدم مساهماتك لمضايقة أو تهديد أي شخص آخر (بالمعنى القانوني لهذه المصطلحات)، أو للترويج للعنف ضد شخص معين أو فئة معينة من الناس.\n• لا تنتهك مساهماتك أي قانون أو لائحة أو قاعدة سارية.\n• لا تنتهك مساهماتك خصوصية أي طرف ثالث أو حقوق الدعاية له.\n• لا تحتوي مساهماتك على أي مواد تطلب معلومات شخصية من أي شخص يقل عمره عن 18 عامًا أو تستغلهم جنسيًا أو عنيفًا.\n\n• لا تنتهك مساهماتك أي قانون فيدرالي أو قانون ولاية يتعلق بالمواد الإباحية للأطفال، أو يهدف إلى حماية صحة أو سلامة القاصرين.\n\n• لا تتضمن مساهماتك أي تعليقات مسيئة تتعلق بالعرق أو الأصل القومي أو الجنس أو التفضيل الجنسي أو الإعاقة الجسدية.\n\n• لا تنتهك مساهماتك أي بند من بنود هذه الشروط والأحكام، أو أي قانون أو لائحة سارية، أو ترتبط بمواد تنتهكها.\n\nأي استخدام للتطبيق ينتهك ما سبق يُعدّ انتهاكًا لهذه الشروط والأحكام، وقد يؤدي، من بين أمور أخرى، إلى إنهاء أو تعليق حقوقك في استخدام التطبيق.',
    },
    'dcnov6d9': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    'x698assw': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // PrivacyPolicy
  {
    'ol7hpcdo': {
      'en': '1. Introduction',
      'ar': '1ـالمقدمة',
    },
    'dnfsbsr5': {
      'en':
          'Azyaa is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application (the \"App\"). Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the App.',
      'ar':
          'تلتزم أزيا بحماية خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمع معلوماتك واستخدامها والإفصاح عنها وحمايتها عند استخدامك تطبيقنا للهواتف المحمولة (\"التطبيق\"). يُرجى قراءة سياسة الخصوصية هذه بعناية. في حال عدم موافقتك على شروط سياسة الخصوصية هذه، يُرجى عدم استخدام التطبيق.',
    },
    'w2knt0hg': {
      'en': '2. Information We Collect',
      'ar': '2ـ المعلومات التي نجمعها ',
    },
    'fc6wgqbr': {
      'en':
          'We may collect information about you in a variety of ways. The information we may collect via the App includes:',
      'ar':
          'قد نجمع معلومات عنك بطرق متنوعة. تشمل المعلومات التي قد نجمعها عبر التطبيق ما يلي',
    },
    '3f1edkyd': {
      'en': 'Personal Data: ',
      'ar': 'البيانات الشخصية:',
    },
    'y7uqhho3': {
      'en':
          'Personally identifiable information, such as your name, shipping address, email address, and telephone number, and demographic information, such as your age, gender, hometown, and interests, that you voluntarily give to us when you register with the App or when you choose to participate in various activities related to the App.',
      'ar':
          'المعلومات الشخصية القابلة للتعريف، مثل اسمك وعنوان الشحن وعنوان البريد الإلكتروني ورقم الهاتف، والمعلومات الديموغرافية، مثل عمرك وجنسك ومسقط رأسك واهتماماتك، التي تقدمها لنا طواعية عند التسجيل في التطبيق أو عندما تختار المشاركة في أنشطة مختلفة متعلقة بالتطبيق.',
    },
    'csg4w8v6': {
      'en': 'Derivative Data: ',
      'ar': 'البيانات المشتقة:',
    },
    '3zr8sgz5': {
      'en':
          'Information our servers automatically collect when you access the App, such as your IP address, your browser type, your operating system, your access times, and the pages you have viewed directly before and after accessing the App.',
      'ar':
          'المعلومات التي تجمعها خوادمنا تلقائيًا عند استخدامك للموقع، مثل عنوان IP الخاص بك، ونوع المتصفح، ونظام التشغيل، وأوقات الدخول، والصفحات التي قمت بزيارتها قبل وبعد تصفح الموقع.',
    },
    'x3cl4svk': {
      'en': 'Financial Data: ',
      'ar': 'البيانات المالية:',
    },
    '35h97cx6': {
      'en':
          'Financial information, such as data related to your payment method (e.g., valid credit card number, card brand, expiration date) that we may collect when you purchase, order, return, exchange, or request information about our services from the App.',
      'ar':
          'المعلومات المالية، مثل البيانات المتعلقة بطريقة الدفع الخاصة بك (على سبيل المثال، رقم بطاقة الائتمان الصالحة، وعلامة البطاقة التجارية، وتاريخ انتهاء الصلاحية) التي قد نجمعها عند الشراء أو الطلب أو الإرجاع أو الاستبدال أو طلب معلومات حول خدماتنا من التطبيق.',
    },
    '4yb0x8rp': {
      'en': 'Mobile Device Data: ',
      'ar': 'بيانات الهاتف المحمول',
    },
    '4mt3qawd': {
      'en':
          'Device information, such as your mobile device ID, model, and manufacturer, and information about the location of your device, if you access the App from a mobile device.',
      'ar':
          'معلومات الجهاز، مثل معرف جهازك المحمول والطراز والشركة المصنعة، ومعلومات حول موقع جهازك، إذا قمت بالوصول إلى التطبيق من جهاز محمول.',
    },
    't8jq0n8q': {
      'en': 'Third-Party Data: ',
      'ar': 'بيانات الطرف الثالث:',
    },
    '15t26qvn': {
      'en':
          'Information from third parties, such as personal information or network friends, if you connect your account to the third party and grant the App permission to access this information.',
      'ar':
          'المعلومات من أطراف ثالثة، مثل المعلومات الشخصية أو أصدقاء الشبكة، إذا قمت بربط حسابك بالطرف الثالث ومنحت التطبيق الإذن بالوصول إلى هذه المعلومات.',
    },
    'ffcdwdb9': {
      'en': '3. Use of Your Information',
      'ar': '3. استخدام معلوماتك',
    },
    'kw5vvbxp': {
      'en':
          'Having accurate information about you permits us to provide you with a smooth, efficient, and customized experience. Specifically, we may use information collected about you via the App to:',
      'ar':
          'إن الحصول على معلومات دقيقة عنك يُمكّننا من تقديم تجربة سلسة وفعّالة ومُخصصة لك. على وجه التحديد، قد نستخدم المعلومات التي نجمعها عنك عبر التطبيق للأغراض التالية:',
    },
    'b0o60att': {
      'en':
          '• Create and manage your account.\n• Process your transactions.\n• Send you a confirmation of your transactions.\n• Provide you with customer support.\n• Send you push notifications regarding your account or the App.\n• Enable user-to-user communications.\n• Fulfill and manage your orders.\n• Request feedback and contact you about your use of the App.\n• Resolve disputes and troubleshoot problems.\n• Prevent fraudulent transactions, monitor against theft, and protect against criminal activity.\n• Generate a personal profile about you to make future visits to the App more personalized.\n• Increase the efficiency and operation of the App.\n• Monitor and analyze usage and trends to improve your experience with the App.\n• Notify you of updates to the App.\n• Perform other business activities as needed.',
      'ar':
          '• إنشاء حسابك وإدارته.\n• معالجة عمليات الشراء والدفع الخاصة بك.\n• إرسال تأكيدات بعمليات الشراء الخاصة بك.\n• تزويدك بخدمة دعم العملاء.\n• إرسال إشعارات فورية تتعلق بحسابك أو باستخدامك للتطبيق.\n• إتاحة التواصل بين المستخدمين عند الحاجة.\n• تنفيذ وإدارة طلباتك.\n• طلب آرائك والتواصل معك بخصوص استخدامك للتطبيق.\n• حل النزاعات ومعالجة المشكلات التقنية أو التشغيلية.\n• منع المعاملات الاحتيالية، ومراقبة أي محاولات سرقة، والحماية من الأنشطة غير القانونية.\n• إنشاء ملف شخصي لك بهدف تخصيص تجربتك وتحسين زياراتك المستقبلية للتطبيق.\n• تحسين كفاءة تشغيل التطبيق وأدائه.\n• مراقبة وتحليل أنماط الاستخدام والاتجاهات بهدف تحسين تجربة التسوق الخاصة بك.\n• إخطارك بأي تحديثات أو تغييرات تطرأ على التطبيق.\n• تنفيذ أي أنشطة تجارية أخرى عند الضرورة.',
    },
    'mjv5q95z': {
      'en': '4. Disclosure of Your Information',
      'ar': '4. الكشف عن معلوماتك',
    },
    '2854jkr3': {
      'en':
          'We may share information we have collected about you in certain situations. Your information may be disclosed as follows:',
      'ar':
          'قد نشارك معلومات جمعناها عنك في حالات معينة. قد يتم الكشف عن معلوماتك على النحو التالي:',
    },
    '50orrpme': {
      'en': '• By Law or to Protect Rights: ',
      'ar': '• بموجب القانون أو لحماية الحقوق:',
    },
    'qm6d7nt0': {
      'en':
          'If we believe the release of information about you is necessary to respond to legal process, to investigate or remedy potential violations of our policies, or to protect the rights, property, and safety of others, we may share your information as permitted or required by any applicable law, rule, or regulation.',
      'ar':
          'إذا اعتقدنا أن إصدار معلومات عنك ضروري للرد على عملية قانونية، أو للتحقيق في الانتهاكات المحتملة لسياساتنا أو علاجها، أو لحماية حقوق الآخرين وممتلكاتهم وسلامتهم، فقد نشارك معلوماتك حسبما يسمح به أو يقتضيه أي قانون أو قاعدة أو لائحة سارية.',
    },
    '6vfwngps': {
      'en': '• Business Transfers: ',
      'ar': '• نقل الأعمال:',
    },
    'ynuymryv': {
      'en':
          'We may share or transfer your information in connection with, or during negotiations of, any merger, sale of company assets, financing, or acquisition of all or a portion of our business to another company.',
      'ar':
          'يجوز لنا مشاركة معلوماتك أو نقلها فيما يتعلق بأي اندماج أو بيع لأصول الشركة أو تمويل أو استحواذ على كل أو جزء من أعمالنا لشركة أخرى أو أثناء التفاوض عليها.',
    },
    '4xckgrdi': {
      'en': '• Third-Party Service Providers: ',
      'ar': '• مقدمو الخدمات من جهات خارجية:',
    },
    '7owrxb45': {
      'en':
          'We may share your information with third parties that perform services for us or on our behalf, including payment processing, data analysis, email delivery, hosting services, customer service, and marketing assistance.',
      'ar':
          'يجوز لنا مشاركة معلوماتك مع أطراف ثالثة تؤدي خدمات لنا أو نيابة عنا، بما في ذلك معالجة الدفع، وتحليل البيانات، وتسليم البريد الإلكتروني، وخدمات الاستضافة، وخدمة العملاء، والمساعدة التسويقية.',
    },
    'zywf5i7k': {
      'en': '• Marketing Communications: ',
      'ar': '• الاتصالات التسويقية:',
    },
    'ff9kfkzx': {
      'en':
          'With your consent, or with an opportunity for you to withdraw consent, we may share your information with third parties for marketing purposes, as permitted by law.',
      'ar':
          'بموافقتك، أو مع إتاحة الفرصة لك لسحب الموافقة، يجوز لنا مشاركة معلوماتك مع أطراف ثالثة لأغراض التسويق، وفقًا لما يسمح به القانون.',
    },
    'rntzkxrk': {
      'en': '• Interactions with Other Users: ',
      'ar': '• التفاعلات مع المستخدمين الآخرين:',
    },
    '0bphtcjd': {
      'en':
          'If you interact with other users of the App, those users may see your name, profile photo, and descriptions of your activity, including sending invitations to other users, chatting with other users, liking posts, and following blogs.',
      'ar':
          'إذا تفاعلت مع مستخدمين آخرين للتطبيق، فقد يرى هؤلاء المستخدمون اسمك وصورة ملفك الشخصي وأوصاف أنشطتك، بما في ذلك إرسال الدعوات إلى مستخدمين آخرين والدردشة مع مستخدمين آخرين والإعجاب بالمنشورات ومتابعة المدونات.',
    },
    'tn2beeks': {
      'en': '• Online Postings: ',
      'ar': '• المنشورات عبر الإنترنت:',
    },
    'a41huw1f': {
      'en':
          'When you post comments, contributions, or other content to the App, your posts may be viewed by all users and may be publicly distributed outside the App in perpetuity.',
      'ar':
          'عندما تنشر تعليقات أو مساهمات أو محتوى آخر على التطبيق، قد يتمكن جميع المستخدمين من مشاهدة منشوراتك وقد يتم توزيعها علنًا خارج التطبيق إلى الأبد.',
    },
    'eym5o6ev': {
      'en': '• Third-Party Advertisers: ',
      'ar': '• المعلنون من جهات خارجية:',
    },
    'k6u5rx8z': {
      'en':
          'We may use third-party advertising companies to serve ads when you visit the App. These companies may use information about your visits to the App and other websites that are contained in web cookies to provide advertisements about goods and services of interest to you.',
      'ar':
          'قد نستعين بشركات إعلانية خارجية لعرض إعلانات عند زيارتك للتطبيق. قد تستخدم هذه الشركات معلومات حول زياراتك للتطبيق ومواقع الويب الأخرى، والمضمنة في ملفات تعريف الارتباط، لعرض إعلانات عن سلع وخدمات تهمك.',
    },
    '5k5j2i05': {
      'en': '5. Security of Your Information',
      'ar': '5ـ أمن معلوماتك',
    },
    'qpkd7s6q': {
      'en':
          'We use administrative, technical, and physical security measures to help protect your personal information. While we have taken reasonable steps to secure the personal information you provide to us, please be aware that despite our efforts, no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against any interception or other type of misuse.',
      'ar':
          'نستخدم إجراءات أمنية إدارية وفنية ومادية لحماية معلوماتك الشخصية. مع أننا اتخذنا خطوات معقولة لتأمين معلوماتك الشخصية التي تقدمها لنا، يُرجى العلم أنه على الرغم من جهودنا، لا توجد إجراءات أمنية مثالية أو غير قابلة للاختراق، ولا يمكن ضمان أي وسيلة لنقل البيانات ضد أي اعتراض أو أي نوع آخر من إساءة الاستخدام.',
    },
    'txhyzzqe': {
      'en': '6. Policy for Children',
      'ar': '6. سياسة الأطفال',
    },
    'ab09jei7': {
      'en':
          'We do not knowingly solicit information from or market to children under the age of 13. If we learn that we have collected personal information from a child under age 13 without verification of parental consent, we will delete that information as quickly as possible. If you believe we might have any information from or about a child under 13, please contact us.',
      'ar':
          'نحن لا نطلب معلومات من الأطفال دون سن الثالثة عشرة عمدًا، ولا نسوق لهم منتجات. إذا علمنا أننا جمعنا معلومات شخصية من طفل دون سن الثالثة عشرة دون التحقق من موافقة والديه، فسنحذفها في أسرع وقت ممكن. إذا كنت تعتقد أننا نمتلك أي معلومات من طفل دون سن الثالثة عشرة أو عنه، يُرجى التواصل معنا.',
    },
    'rbjrigly': {
      'en': '7. Changes to This Privacy Policy',
      'ar': '7. التغييرات على سياسة الخصوصية هذه',
    },
    'd8m7209x': {
      'en':
          'We may update this Privacy Policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal, or regulatory reasons.',
      'ar':
          'يجوز لنا تحديث سياسة الخصوصية هذه من وقت لآخر لتعكس، على سبيل المثال، التغييرات التي تطرأ على ممارساتنا أو لأسباب تشغيلية أو قانونية أو تنظيمية أخرى.',
    },
    'femftds5': {
      'en': '8. Contact Us',
      'ar': '8. اتصل بنا',
    },
    '0iz947an': {
      'en':
          'If you have questions or comments about this Privacy Policy, please contact us at:',
      'ar':
          'إذا كانت لديك أسئلة أو تعليقات حول سياسة الخصوصية هذه، يرجى الاتصال بنا على:',
    },
    'jmlbrcfv': {
      'en': 'Azyaa',
      'ar': 'أزيا',
    },
    'hpgemgwj': {
      'en': 'team@azyaakw.com',
      'ar': 'team@azyaakw.com',
    },
    'at5mly1c': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'vs8zvkbk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Shortlist
  {
    'o87neh7l': {
      'en': 'Shortlist',
      'ar': 'قائمة مختصرة ',
    },
    'qdtafj4j': {
      'en': 'All',
      'ar': 'الكل',
    },
    'zrntmki9': {
      'en': 'Designer',
      'ar': 'مصمّم',
    },
    'atr7b38u': {
      'en': 'Creator',
      'ar': 'المبدعين',
    },
    'n51rftkg': {
      'en': 'Product',
      'ar': 'المنتج',
    },
    'x4cnnj9w': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'fmcvv2hz': {
      'en': 'Nothing here yet! Start adding to your shortlist.',
      'ar': 'لا يوجد شيء هنا بعد! ابدأ بإضافة المزيد إلى قائمتك المختصرة.',
    },
    'q666blv1': {
      'en': 'Go ahead—add your dream picks!',
      'ar': 'تفضل - أضف اختياراتك الحلمية!',
    },
    'f7gafm4z': {
      'en': 'Start adding',
      'ar': 'ابدأ الإضافة',
    },
    'a2lp3e7q': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Waitlist_Form
  {
    '7nwzjr15': {
      'en': 'Join the Waitlist',
      'ar': 'انضم إلى قائمة الانتظار',
    },
    'uxntdqg1': {
      'en':
          'Be the first to know when access opens! Submit your details and we’ll notify you once your spot is confirmed.',
      'ar':
          'كن أول من يعلم عند فتح التسجيل!أرسل بياناتك وسنُعلمك فور تأكيد حجز مقعدك',
    },
    '9ezn0gzt': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'onxjnykm': {
      'en': '*',
      'ar': '*',
    },
    'b9hc3uot': {
      'en': 'Name *',
      'ar': '',
    },
    '26e09g7t': {
      'en': 'Enter your full name',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '7zvzbpb1': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '5bb15vey': {
      'en': '*',
      'ar': '*',
    },
    '0715p686': {
      'en': 'Name *',
      'ar': '',
    },
    'd5re4xd2': {
      'en': 'Kuwait',
      'ar': 'الكويت',
    },
    '7883iwtz': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    '6mzgxizh': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '26gw2itf': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    'xcdew72b': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '7d14qg1l': {
      'en': '*',
      'ar': '*',
    },
    'm5bhjrih': {
      'en': 'Name *',
      'ar': '',
    },
    'yqz7uwc6': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'u0zrje54': {
      'en': 'Join Now & Get Your Spot',
      'ar': 'انضم الآن واحجز مكانك',
    },
    'vlqszub7': {
      'en': 'I have invite code',
      'ar': 'لدي رمز دعوة',
    },
    '8e2ebsih': {
      'en': 'Enter your full name is required',
      'ar': '',
    },
    'dh5pd2je': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lhdbxknp': {
      'en': 'Enter your mobile number is required',
      'ar': '',
    },
    'sgs94a5s': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gnk02zb1': {
      'en': 'Enter your email is required',
      'ar': '',
    },
    'y8hq1k04': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'steo8oea': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Waitlist_Main
  {
    'accaapug': {
      'en': 'Exclusive Access Only',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'lkz5am3o': {
      'en':
          'We’re currently in invite-only mode. If you have an invitation code, enter it below. Or, join the waitlist to request access!',
      'ar':
          'نحن حاليًا في وضع الدعوة فقط. إذا كان لديك رمز دعوة، فأدخله أدناه. أو انضم إلى قائمة الانتظار لطلب الوصول!',
    },
    'gfq9x72j': {
      'en': 'Join Waitlist',
      'ar': 'انضم إلى قائمة الانتظار',
    },
    'ql8fzur4': {
      'en': 'Enter Invitation Code',
      'ar': 'أدخل رمز الدعوة',
    },
    'al0luho8': {
      'en': 'PIN code is required',
      'ar': '',
    },
    'j7xpxoeq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Waitlist_Success
  {
    'pmmpikfd': {
      'en': 'You’re on the Waitlist',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'l1fkjnd8': {
      'en': 'Thanks for registering! Your request is currently being reviewed.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
    },
    'hyaphchh': {
      'en': 'Your waitlist number',
      'ar': '',
    },
    'c7mwq4j5': {
      'en':
          'Check you registered email, if already received an activation code? You can use it below to skip the wait.',
      'ar':
          'تحقّق من بريدك الإلكتروني المسجّل، إذا وصلك رمز تفعيل بالفعل يمكنك استخدامه أدناه لتجاوز فترة الانتظار',
    },
    'ww9iecc6': {
      'en': 'Enter Invitation Code',
      'ar': 'يرسل',
    },
    'bqyllqh4': {
      'en': 'PIN code is required',
      'ar': '',
    },
    'ssmvst9q': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OrderReturn
  {
    'd415dioi': {
      'en': 'Return Request',
      'ar': 'طلب الإرجاع',
    },
    'tdqnlvcv': {
      'en': 'Ordered on ',
      'ar': 'تم الطلب على',
    },
    '2khzy6lf': {
      'en': 'Hello World',
      'ar': '',
    },
    '0wol03zg': {
      'en': 'Order ID ',
      'ar': 'معرف الطلب',
    },
    'lr7vps4i': {
      'en': '- ',
      'ar': '-',
    },
    'c7wlf9ia': {
      'en': 'Hello World',
      'ar': '',
    },
    '7623k0oi': {
      'en': 'Product Details',
      'ar': 'تفاصيل المنتج',
    },
    'koxcw5p8': {
      'en': ' - ',
      'ar': '',
    },
    'sxehytko': {
      'en': ' Items  ',
      'ar': 'العناصر',
    },
    '6slmd41k': {
      'en': '|  ',
      'ar': '|',
    },
    'u65mr1gr': {
      'en': ' KD',
      'ar': 'كيه دي',
    },
    'w7t3id0q': {
      'en': 'Reason for Return',
      'ar': 'سبب الإرجاع',
    },
    'blqjr5ju': {
      'en': 'Size Issue',
      'ar': 'مشكلة في المقاس',
    },
    'fqjkitpr': {
      'en': 'Select Reason for Return',
      'ar': 'حدد سبب الإرجاع',
    },
    'ymoznvu4': {
      'en': 'Search...',
      'ar': '',
    },
    'nxn6xl6u': {
      'en': 'Size Issue',
      'ar': 'مشكلة في المقاس',
    },
    '2l9jqp4t': {
      'en': 'Wrong Item Delivered',
      'ar': 'تم تسليم عنصر خاطئ',
    },
    '9cl7n7cl': {
      'en': 'Defective Item',
      'ar': 'منتج معيوب',
    },
    'w9vonwty': {
      'en': 'Not Satisfied with Quality',
      'ar': 'غير راضٍ عن الجودة',
    },
    '8oihjlj4': {
      'en': 'Others',
      'ar': 'أخرى',
    },
    '2w7b4uwa': {
      'en': 'Additional Comments',
      'ar': 'تعليقات إضافية',
    },
    'f0y8p8lu': {
      'en': 'Anything to mention...',
      'ar': 'أي شيء تود ذكره...',
    },
    'f5kksy09': {
      'en': 'Raise Return Request',
      'ar': 'إرسال طلب الإرجاع',
    },
    'rxllbmz1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TESTheader
  {
    'ykn3fft3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // freePayment
  {
    '1cq5tdoa': {
      'en': 'Order Confirming...',
      'ar': 'جارٍ تأكيد الطلب...',
    },
    'ywmc6gjf': {
      'en': 'back',
      'ar': 'عودة',
    },
    'nv5xtn77': {
      'en': 'Home',
      'ar': '',
    },
  },
  // home-search
  {
    '107zlwf3': {
      'en': 'Search',
      'ar': 'يبحث',
    },
    'gjheybsf': {
      'en': 'Search Products',
      'ar': 'البحث عن المنتجات',
    },
    'lv1vkl1u': {
      'en': 'Choose  ',
      'ar': 'إختيار',
    },
    'p1d9g9xc': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    '94a2o6j0': {
      'en': 'Popular ',
      'ar': 'تم إطلاقه',
    },
    'esx97qss': {
      'en': 'Picks',
      'ar': ' حديثاً',
    },
    'ww3ncggz': {
      'en': ' results',
      'ar': 'نتائج',
    },
    'oie9dnrl': {
      'en': 'Your list looks empty!',
      'ar': 'تبدو قائمتك فارغة!',
    },
    'x6jc2mwj': {
      'en': 'No matching data found for your search.',
      'ar': 'لم يتم العثور على بيانات مطابقة لعملية البحث الخاصة بك.',
    },
    'c1zvaqg0': {
      'en': 'Designer',
      'ar': '',
    },
  },
  // addresstest
  {
    'pyxxgobd': {
      'en': 'Button',
      'ar': '',
    },
    '0yrvnzkp': {
      'en': 'My address',
      'ar': '',
    },
    'r894ambl': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Delete
  {
    'p8ljx6xb': {
      'en': 'Azyaa',
      'ar': 'يرجى تسجيل الدخول',
    },
    'yzhadtyg': {
      'en': 'Add your Email - ID to request your account to delete it.',
      'ar': 'ادخل إلى حسابك للاستمتاع بتجربة سلسة.',
    },
    'nkvjfxdz': {
      'en': 'Email ',
      'ar': 'البريد الإلكتروني',
    },
    'whdcy5vt': {
      'en': '*',
      'ar': '*',
    },
    '2jy6wgwv': {
      'en': 'Name *',
      'ar': 'الاسم',
    },
    '8t954e8y': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'tfb7v781': {
      'en': 'Password ',
      'ar': 'كلمة المرور',
    },
    '7313kofs': {
      'en': '*',
      'ar': '*',
    },
    'lxv62fal': {
      'en': 'Email *',
      'ar': 'البريد الإلكتروني',
    },
    'hxel6kmn': {
      'en': 'Enter your password',
      'ar': 'أدخل كلمة المرور',
    },
    'wq9uda7v': {
      'en': 'Forgot your password?',
      'ar': 'هل نسيت كلمة المرور؟',
    },
    'eysqalxg': {
      'en': 'Name *',
      'ar': '',
    },
    'x2gkixpn': {
      'en': 'Request to Delete account',
      'ar': 'تسجيل الدخول',
    },
    'emgkbn0b': {
      'en': 'By continuing you agree ',
      'ar': 'بالمتابعة فإنك توافق على',
    },
    '86nkny01': {
      'en': 'Terms of Services ',
      'ar': '',
    },
    'hgfodckm': {
      'en': '& ',
      'ar': '',
    },
    'mp7c39ju': {
      'en': 'Privacy Policy ',
      'ar': '',
    },
    'rd0l7aph': {
      'en': 'Please provide a valid email ',
      'ar': 'يرجى تقديم بريد إلكتروني صالح',
    },
    'f5yn3z1t': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0w1n5qze': {
      'en': 'Please enter password',
      'ar': 'الرجاء إدخال كلمة المرور',
    },
    '72p1twi9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5jbk1pfo': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ProductCopy
  {
    '81tz3gdc': {
      'en': 'Product',
      'ar': 'المنتج',
    },
    '4ezk3r96': {
      'en': 'Virtual Try on',
      'ar': 'التجربة الافتراضية',
    },
    'voqpa32h': {
      'en': 'Delivery charges excluded',
      'ar': 'لا تشمل رسوم التوصيل.',
    },
    '51ssvs2g': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    '2c70qs8n': {
      'en': 'Measurement',
      'ar': 'القياسات',
    },
    '6ef5e5vm': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    'q375qgg2': {
      'en': '* Returns Not Applicable for This Item',
      'ar': 'ا يمكن إرجاع هذا المنتج*',
    },
    '4tq6fdad': {
      'en': 'Tags',
      'ar': 'الوسوم',
    },
    '9vhn6ttq': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'a0notyzt': {
      'en': 'Follow',
      'ar': 'متابعة',
    },
    's1k545xj': {
      'en': 'Follow',
      'ar': 'متابعة',
    },
    'g6kfhewy': {
      'en': 'Unfollow',
      'ar': 'إلغاء المتابعة',
    },
    'ppv7l1io': {
      'en': 'Are you sure?',
      'ar': 'هل أنت متأكد؟',
    },
    'rh82yxfw': {
      'en': 'you want to unfollow this Designer?',
      'ar': 'هل تريد إلغاء متابعة هذا المصمم؟',
    },
    'qq2bz27d': {
      'en': 'Ratings and reviews',
      'ar': 'التقييمات والمراجعات',
    },
    '306ghz7b': {
      'en': '5',
      'ar': '5',
    },
    't86zeklm': {
      'en': '50%',
      'ar': '',
    },
    'zy0sf6mo': {
      'en': '4',
      'ar': '4',
    },
    'hs4f3frb': {
      'en': '50%',
      'ar': '',
    },
    'o1zrqylz': {
      'en': '3',
      'ar': '3',
    },
    'sfmabghd': {
      'en': '50%',
      'ar': '',
    },
    '00ejlfm5': {
      'en': '2',
      'ar': '2',
    },
    'xoybkswq': {
      'en': '50%',
      'ar': '',
    },
    'vbvwoz5w': {
      'en': '1',
      'ar': '1',
    },
    'c4dy6av9': {
      'en': '50%',
      'ar': '',
    },
    '05476x55': {
      'en': 'View More',
      'ar': 'عرض المزيد',
    },
    'jxoob770': {
      'en': 'Bought ',
      'ar': 'مُشترى',
    },
    'ctl5h74q': {
      'en': 'With',
      'ar': 'مع',
    },
    '7uwc1273': {
      'en': 'Recommended for ',
      'ar': 'تم عرضه',
    },
    'qtzdkpi6': {
      'en': 'You',
      'ar': ' حديثاً',
    },
    '5zbi1ngb': {
      'en': 'Promote',
      'ar': 'يرقي',
    },
    '92w3hxbp': {
      'en': 'See Insights',
      'ar': '',
    },
    'oso0nv3r': {
      'en': 'Notify me!',
      'ar': 'أبلغني!',
    },
    's9db5x3l': {
      'en': 'Promote',
      'ar': 'يرقي',
    },
    'k8fuo2ue': {
      'en': 'See Insights',
      'ar': '',
    },
    'iaqkoezd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Universal_NavigationBar
  {
    'qym5k4mn': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
    'z30s5x9j': {
      'en': 'Designer',
      'ar': '',
    },
    'h8ksppd5': {
      'en': 'Shop',
      'ar': 'المتجر',
    },
    '4tvho7in': {
      'en': 'Creator',
      'ar': 'مبدع',
    },
    'uvhd8kwt': {
      'en': 'Account',
      'ar': 'الحساب',
    },
  },
  // Product-Grid
  {
    'kiugng58': {
      'en': 'Ready made ',
      'ar': 'جاهز',
    },
    'mxwbgakx': {
      'en': '| ',
      'ar': '',
    },
    't0ffzigk': {
      'en': 'Out of stock',
      'ar': 'إنتهى من المخزن',
    },
  },
  // Profile-Body
  {
    'o3e4dy0k': {
      'en': 'Hi, for a better fit i need your measurements',
      'ar': 'مرحبًا، للحصول على مقاس أفضل، أحتاج إلى قياساتك',
    },
    '9s8jdlnz': {
      'en': 'Why Add Measurements?',
      'ar': 'لماذا إضافة القياسات؟',
    },
    'v8010arm': {
      'en':
          'Adding your body measurements allows us to provide better size recommendations, ensuring that the clothing fits comfortably & accurately.',
      'ar':
          'إضافة قياسات جسمك تتيح لنا تقديم توصيات مقاس أفضل، لضمان أن الملابس تناسبك براحة ودقّة.',
    },
    'mjvn89hq': {
      'en': 'Ready to start? Enter your details now!',
      'ar': 'هل أنت مستعد للبدء؟ أدخل بياناتك الآن!',
    },
    '358utgy3': {
      'en': 'Add Measurement',
      'ar': 'إضافة القياس',
    },
  },
  // Profile-Body_Add
  {
    'k014uaz5': {
      'en': 'Add Your Body Measurements',
      'ar': 'أضف قياسات جسمك',
    },
    '6visnkd7': {
      'en':
          'Accurate measurements help us provide size recommendations tailored perfectly to you. Let’s ensure every outfit fits like a dream!',
      'ar':
          'القياسات الدقيقة تساعدنا في تقديم توصيات مقاس تناسبك تمامًا. لنضمن أن كل زيّ يلائمك كالحلم!',
    },
    'mjzk4ao4': {
      'en': 'Enter Name',
      'ar': 'أدخل الاسم',
    },
    '28yfro1n': {
      'en': 'Enter Relation name',
      'ar': 'صلة القرابة',
    },
    '78aprg8o': {
      'en': 'Height',
      'ar': 'الطول',
    },
    '1lgpem6p': {
      'en': 'Cm',
      'ar': 'قدم',
    },
    '4ko7t435': {
      'en': 'Cm',
      'ar': 'قدم',
    },
    'bo5dvq9x': {
      'en': 'Search...',
      'ar': '',
    },
    '5ccfh2b9': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'm0g4kuhl': {
      'en': 'Weight',
      'ar': 'الوزن',
    },
    '6qz4wkfu': {
      'en': 'Kg',
      'ar': 'كجم',
    },
    '7ulcp3ie': {
      'en': 'Kg',
      'ar': 'كجم',
    },
    'ac11hff3': {
      'en': 'Search...',
      'ar': '',
    },
    'r7xxkc1c': {
      'en': 'Kg',
      'ar': 'كجم',
    },
    'vch5npan': {
      'en': 'Bust / Chest',
      'ar': 'الصدر / محيط الصدر',
    },
    'djb1pn0c': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'ibui2qed': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'q4wfgamb': {
      'en': 'Search...',
      'ar': '',
    },
    'skqg9bw5': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'tb9vwplh': {
      'en': 'Waist',
      'ar': 'الخصر',
    },
    'zxn3obym': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '9xspu47n': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'gla1r4rx': {
      'en': 'Search...',
      'ar': '',
    },
    '402mftby': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '4dlwsq5o': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    '6ojp0bl6': {
      'en': 'Hip',
      'ar': 'الورك',
    },
    'uwa3xzzx': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '60hyn348': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'q7i8smav': {
      'en': 'Search...',
      'ar': '',
    },
    'xp4atcfs': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'y69nx7dm': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    'nnlt1aph': {
      'en': 'Inseam',
      'ar': 'طول الساق الداخلي',
    },
    'pjntfvtb': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'gug87mwt': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'pa6nlci7': {
      'en': 'Search...',
      'ar': '',
    },
    'v1q0452o': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '4l2ku8gk': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    'u99wpd7o': {
      'en': 'Shoulder Width',
      'ar': 'عرض الكتفين',
    },
    '4hhjgzx7': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'q3vwdgdw': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '959mzdof': {
      'en': 'Search...',
      'ar': '',
    },
    'nmt9um7v': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'm5rdodpc': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    '7a1g26cz': {
      'en': 'Arm Length',
      'ar': 'طول الذراع',
    },
    '1oioqa7q': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'pgsa6f5j': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'ti51n0og': {
      'en': 'Search...',
      'ar': '',
    },
    'x4q8gs9q': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'vd16k0pn': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    '0t0h6kb9': {
      'en': 'Set as default Measurement',
      'ar': 'تعيين كقياس افتراضي',
    },
    'meopz8eh': {
      'en': 'Please enter name.',
      'ar': 'الرجاء إدخال الاسم.',
    },
    'x6h1ppv1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n73syzku': {
      'en': 'Please enter relation',
      'ar': '',
    },
    'cj43usvn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ad6u5qpk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '27dyxt6n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8jvr0y89': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yoyetpdz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3wzzjwb2': {
      'en': 'Field is required',
      'ar': '',
    },
    'f2aoz4tc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'i9lrffkg': {
      'en': 'Field is required',
      'ar': '',
    },
    '8sgltn86': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yx7mu4gz': {
      'en': 'Field is required',
      'ar': '',
    },
    'x2z1ussn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mh4l4v0t': {
      'en': 'Field is required',
      'ar': '',
    },
    'ag377amo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5ut6r5mk': {
      'en': 'Field is required',
      'ar': '',
    },
    '12krltyj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'whnjyzw5': {
      'en': 'Field is required',
      'ar': '',
    },
    'mvk5u7du': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7ecuymi0': {
      'en': 'Add Measurement',
      'ar': 'إضافة القياس',
    },
  },
  // Profile-Address_Add
  {
    'b7pzjaul': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
    },
    'pu39x3h7': {
      'en': 'Get Current Location',
      'ar': 'الحصول على الموقع الحالي',
    },
    'spxg4wf4': {
      'en': 'Region ',
      'ar': 'المنطقة',
    },
    'ughcwkih': {
      'en': ' ',
      'ar': '*',
    },
    'kuoxvwt8': {
      'en': 'Name *',
      'ar': '',
    },
    '2mua8x1l': {
      'en': 'Enter your region',
      'ar': 'أدخل منطقتك',
    },
    '4u9cd9o4': {
      'en': 'Name ',
      'ar': 'اسم',
    },
    'dqunsdc2': {
      'en': '*',
      'ar': '*',
    },
    'oapnaydu': {
      'en': 'Name *',
      'ar': '',
    },
    'pmfyggik': {
      'en': 'Enter your name',
      'ar': 'أدخل اسمك',
    },
    '5hee7lhe': {
      'en': 'Relation ',
      'ar': 'العلاقة',
    },
    'p3s1rfn5': {
      'en': '*',
      'ar': '',
    },
    '5ki7m581': {
      'en': 'Name *',
      'ar': '',
    },
    '6od5m72l': {
      'en': 'Enter your relation',
      'ar': 'أدخل علاقتك',
    },
    'ige4hsl7': {
      'en': 'Mobile Number ',
      'ar': 'رقم الجوال',
    },
    'snes691x': {
      'en': '*',
      'ar': '*',
    },
    '7ppsujgr': {
      'en': 'Name *',
      'ar': '',
    },
    '0ybpcke9': {
      'en': 'Kuwait',
      'ar': 'Kuwait',
    },
    'kj6tgwqm': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    'ac7caq1m': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'cin3fhgk': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم جوالك',
    },
    '0i5vtby4': {
      'en': 'Enter your mobile number',
      'ar': '',
    },
    'znca9hla': {
      'en': 'Email ',
      'ar': 'بريد إلكتروني',
    },
    'o25bnlij': {
      'en': '*',
      'ar': '*',
    },
    'dj6kb3z3': {
      'en': 'Name *',
      'ar': '',
    },
    '95dp9m4c': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'w3thcnm8': {
      'en': 'Address ',
      'ar': 'عنوان',
    },
    'wj5ndder': {
      'en': '*',
      'ar': '*',
    },
    '7y7phs7j': {
      'en': 'Name *',
      'ar': '',
    },
    'iq7gtl00': {
      'en': 'Enter your street address1',
      'ar': 'أدخل سطر العنوان الأول',
    },
    '8ag8un88': {
      'en': 'City ',
      'ar': 'مدينة',
    },
    '1ttkfe5s': {
      'en': '*',
      'ar': '*',
    },
    '7upegcav': {
      'en': 'Name *',
      'ar': '',
    },
    'y2jl284q': {
      'en': 'Enter your city',
      'ar': 'أدخل مدينتك',
    },
    'eptpadoz': {
      'en': 'Country ',
      'ar': 'دولة',
    },
    '2yepcdcj': {
      'en': '*',
      'ar': '*',
    },
    'lx1jso5k': {
      'en': 'Name *',
      'ar': '',
    },
    'ytn4wj56': {
      'en': 'India',
      'ar': 'الكويت',
    },
    'kx68kh9r': {
      'en': 'Please select country',
      'ar': 'يرجى اختيار الدولة',
    },
    'yqraftu5': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'vmazuk6t': {
      'en': 'India',
      'ar': '',
    },
    'lgsunlrm': {
      'en': 'Kuwait',
      'ar': '',
    },
    'a5zboqxs': {
      'en': 'Enter your country',
      'ar': 'أدخل دولتك',
    },
    'lvi2agkt': {
      'en': 'Postal Code ',
      'ar': 'الرمز البريدي',
    },
    '6jsvb235': {
      'en': '*',
      'ar': '*',
    },
    'm1az2iix': {
      'en': 'Name *',
      'ar': '',
    },
    'n1ukz7sk': {
      'en': 'Enter your postal code',
      'ar': 'أدخل الرمز البريدي',
    },
    'jw5yw118': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'oj8vwvpo': {
      'en': '*',
      'ar': '*',
    },
    'u0z93wpb': {
      'en': 'Name *',
      'ar': '',
    },
    '5g50mv11': {
      'en': 'Set as default address',
      'ar': 'تعيين كعنوان افتراضي',
    },
    'jp1sezvz': {
      'en': 'Please enter region',
      'ar': 'يرجى إدخال المنطقة',
    },
    'h074ilwa': {
      'en': 'Minimum 2 characters are required',
      'ar': 'الحد الأدنى المطلوب هو حرفان',
    },
    's6vunooi': {
      'en': 'Maximum 100 characters are required',
      'ar': 'الحد الأقصى 100 حرف',
    },
    'f2phudcc': {
      'en': 'Invalid format.',
      'ar': '',
    },
    'mrep3vi8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nsit16sq': {
      'en': 'Please enter name',
      'ar': 'يرجى إدخال الاسم',
    },
    'wxzwinw2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'tbnxfffp': {
      'en': 'Please enter relation',
      'ar': '',
    },
    '26vf63m6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'm1cmv6b7': {
      'en': 'Please enter mobile number',
      'ar': 'يرجى إدخال رقم الجوال',
    },
    '42erf5ue': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3cwsxxe8': {
      'en': '',
      'ar': '',
    },
    'vfx27fet': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gq1arwwy': {
      'en': 'Please provide a valid email',
      'ar': 'يرجى إدخال بريد إلكتروني صحيح',
    },
    '9pwy3mll': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qephrx5q': {
      'en': 'Please enter street address 1 ',
      'ar': 'يرجى ادخال عنوان الشارع الرئيسى ',
    },
    'ass92nnq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'amif6yh7': {
      'en': 'Please enter city',
      'ar': 'يرجى إدخال المدينة',
    },
    '86fyy20a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5rq8fdl8': {
      'en': 'Please enter country',
      'ar': 'يرجى إدخال الدولة',
    },
    'bs9v2vo4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'po1zs7z0': {
      'en': 'Please enter postal code',
      'ar': 'يرجى إدخال الرمز البريدي',
    },
    'rkfozaot': {
      'en': 'Invalid postal code.',
      'ar': 'رمز بريدي غير صالح.',
    },
    's9t7zd6m': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nahhdrqt': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // Cart_Popup
  {
    '0hghnhfp': {
      'en': 'Bag',
      'ar': 'شنطة',
    },
    'm0v4n6q7': {
      'en': '2 Items',
      'ar': '2 عناصر',
    },
    'dkk4sdxo': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    '6njws45p': {
      'en': '119.9 KD',
      'ar': '',
    },
    'ar0ww573': {
      'en': 'View Bag',
      'ar': 'عرض الحقيبة',
    },
    'josxudz4': {
      'en': 'Checkout',
      'ar': 'الدفع',
    },
  },
  // Profile-Body_Edit
  {
    'k7ofq0ic': {
      'en': 'Edit Your Body Measurements',
      'ar': 'تعديل قياسات جسمك',
    },
    'ypy7x59q': {
      'en':
          'Accurate measurements help us provide size recommendations tailored perfectly to you. Let’s ensure every outfit fits like a dream!',
      'ar':
          'القياسات الدقيقة تساعدنا في تقديم توصيات مقاس تناسبك تمامًا. لنضمن أن كل زيّ يلائمك كالحلم!',
    },
    't03471vq': {
      'en': 'Enter Name',
      'ar': 'أدخل الاسم',
    },
    '0cp93s7v': {
      'en': 'Enter Realtion name',
      'ar': 'أدخل اسم صاحب العلاقة',
    },
    '7n9ntwyf': {
      'en': 'Height',
      'ar': 'الطول',
    },
    'qkpeezye': {
      'en': 'Cm',
      'ar': 'قدم',
    },
    'd9v2kmc7': {
      'en': 'Search...',
      'ar': '',
    },
    'yqkx9u9k': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'ulv9x1fa': {
      'en': 'Weight',
      'ar': 'الوزن',
    },
    '89pu66l9': {
      'en': 'Kg',
      'ar': 'كلغ',
    },
    'wee46wfs': {
      'en': 'Search...',
      'ar': '',
    },
    'fzpf17mh': {
      'en': 'Kg',
      'ar': 'كلغ',
    },
    'jkzro7ew': {
      'en': 'Bust / Chest',
      'ar': 'الصدر / محيط الصدر',
    },
    'e8dobi7c': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'by8rqzb8': {
      'en': 'Search...',
      'ar': '',
    },
    '4j5vcxom': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'tgx3nfub': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    'goi7spij': {
      'en': 'Waist',
      'ar': 'الخصر',
    },
    'vnsdg63c': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'ytazfnok': {
      'en': 'Search...',
      'ar': '',
    },
    'culz6svq': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'xg7zstcb': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    'chlod8ca': {
      'en': 'Hip',
      'ar': 'الورك',
    },
    'e420ex6a': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'pnilj14i': {
      'en': 'Search...',
      'ar': '',
    },
    'errsgtw6': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '7q56s089': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    'ch59u3mh': {
      'en': 'Inseam',
      'ar': 'طول الساق الداخلي',
    },
    'cadfrc7k': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '5s1zhgp1': {
      'en': 'Search...',
      'ar': '',
    },
    'sh51ubdw': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '99nsibkw': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    '9ufdf4yd': {
      'en': 'Shoulder Width',
      'ar': 'عرض الكتفين',
    },
    'wb716gvz': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'weo1gbi6': {
      'en': 'Search...',
      'ar': '',
    },
    'f1conbds': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'b4r4w6gs': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    '469owmyr': {
      'en': 'Arm Length',
      'ar': 'طول الذراع',
    },
    'v1123csh': {
      'en': 'Cm',
      'ar': 'سم',
    },
    '22p6fmuy': {
      'en': 'Search...',
      'ar': '',
    },
    'yxm8qxre': {
      'en': 'Cm',
      'ar': 'سم',
    },
    'eklj5tln': {
      'en': 'Inch',
      'ar': 'بوصة',
    },
    '1rn2dgv0': {
      'en': 'Set as default Measurement',
      'ar': 'تعيين كقياس افتراضي',
    },
    'mcvgmrkm': {
      'en': 'Please enter name',
      'ar': '',
    },
    'fwwu4ebd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wahxdqjh': {
      'en': 'Please enter realtion',
      'ar': '',
    },
    'onymlllo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'elatkcmr': {
      'en': 'Field is required',
      'ar': '',
    },
    'dask9m1k': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'h7ss27bo': {
      'en': 'Field is required',
      'ar': '',
    },
    'mnyiwyhc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bylgtlyx': {
      'en': 'Field is required',
      'ar': '',
    },
    'k24gbqf6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1jafwueb': {
      'en': 'Field is required',
      'ar': '',
    },
    'qg0vue7c': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2qvi4nts': {
      'en': 'Field is required',
      'ar': '',
    },
    '2cssg302': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fw2bsp8d': {
      'en': 'Field is required',
      'ar': '',
    },
    'gz9zbcdp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'u4chm1mp': {
      'en': 'Field is required',
      'ar': '',
    },
    '83d4xscx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ls8q671n': {
      'en': 'Field is required',
      'ar': '',
    },
    '24nf6b4o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e5b4t351': {
      'en': 'Edit Measurement',
      'ar': 'تعديل القياس',
    },
  },
  // Cart_Item_List
  {
    'o00hwsyc': {
      'en': 'Out of stock',
      'ar': '',
    },
    'g7ppysrc': {
      'en': 'Out of stock',
      'ar': '',
    },
    'dluq1saw': {
      'en': '* Returns Not Applicable for This Item',
      'ar': '* لا يُسمح بإرجاع هذا المنتج',
    },
  },
  // Product_Attribute_CartLevel
  {
    'chk8ds63': {
      'en': 'Choose',
      'ar': 'اختر',
    },
    'gcn1cgz9': {
      'en': 'Add to bag',
      'ar': 'أضف إلى السلة',
    },
    'y12no71w': {
      'en': 'Select',
      'ar': 'يختار',
    },
    'mae5c7ae': {
      'en': 'Please choose product options !',
      'ar': 'يرجى اختيار خيارات المنتج!',
    },
    '2ouksv87': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    'm7f6lydu': {
      'en': 'Measurement',
      'ar': 'القياسات',
    },
  },
  // Checkout_Popup
  {
    'z45nyqg7': {
      'en': 'Summary',
      'ar': 'ملخص',
    },
    '7ihma0d3': {
      'en': '2 Items',
      'ar': '2 عناصر',
    },
    'edusam0l': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
    },
    'q5ze31k4': {
      'en': '119.9 KD',
      'ar': '119.9 KD',
    },
    '6gy9mzlv': {
      'en': 'Shipping',
      'ar': 'شحن',
    },
    '9j0cp2lp': {
      'en': '119.9 KD',
      'ar': '119.9 KD',
    },
    'jhjvk7ns': {
      'en': 'Wallet',
      'ar': 'محفظة',
    },
    '8qxmhtxz': {
      'en': '119.9 KD',
      'ar': '119.9 KD',
    },
    '2rwwg5k9': {
      'en': 'Coupons',
      'ar': 'كوبونات',
    },
    'bubhu5s8': {
      'en': '119.9 KD',
      'ar': '119.9 KD',
    },
    '3q8utx1g': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    '2y4esly7': {
      'en': '119.9 KD',
      'ar': '119.9 KD',
    },
    '8gww47un': {
      'en': 'Proceed to Pay',
      'ar': 'انتقل إلى الدفع',
    },
  },
  // Ratethecall
  {
    '5itgnbrp': {
      'en': 'How’s your call?',
      'ar': '',
    },
    'o8697bf7': {
      'en': 'Rate your call out of 5',
      'ar': '',
    },
    'x9gwyajs': {
      'en': 'Hello World',
      'ar': '',
    },
    'zgtbpooo': {
      'en': 'Anything to mention...',
      'ar': '',
    },
    'qqh0br3m': {
      'en': 'Submit',
      'ar': '',
    },
  },
  // Addnewgiftaddress
  {
    'z0m0j4k1': {
      'en': 'Add New Address',
      'ar': '',
    },
    '41f0dsuw': {
      'en': 'Add New Address',
      'ar': '',
    },
    'y1ug271r': {
      'en': 'Ordering for someone else as agift',
      'ar': '',
    },
    'hp05azb5': {
      'en': 'Country/Region',
      'ar': '',
    },
    '3k79pu9w': {
      'en': '*',
      'ar': '',
    },
    '6b6wvyco': {
      'en': 'Name *',
      'ar': '',
    },
    'wbhl1oib': {
      'en': 'Enter your country',
      'ar': '',
    },
    '8vp8mo0v': {
      'en': 'Name ',
      'ar': '',
    },
    '5hggl7gp': {
      'en': '*',
      'ar': '',
    },
    'ptajc13e': {
      'en': 'Name *',
      'ar': '',
    },
    '6mnjfi4d': {
      'en': 'Enter you name',
      'ar': '',
    },
    '931m6g5u': {
      'en': 'Mobile Number ',
      'ar': '',
    },
    '1ft9qris': {
      'en': '*',
      'ar': '',
    },
    'vjc6a0ls': {
      'en': 'Name *',
      'ar': '',
    },
    'xq9e4ofl': {
      'en': 'India',
      'ar': '',
    },
    'laqkivhm': {
      'en': 'Please select...',
      'ar': '',
    },
    '243n5hf9': {
      'en': 'Search...',
      'ar': '',
    },
    'lhpuf8xy': {
      'en': 'India',
      'ar': '',
    },
    '98ve4uzv': {
      'en': 'Enter mobile number',
      'ar': '',
    },
    'g48xojhm': {
      'en': 'I know the address',
      'ar': '',
    },
    '54q6t76u': {
      'en':
          'if you don’t know the address don’t worry, we got you covered. Azyaa’s dedicated team will get the address from your loved ones by their contact info',
      'ar': '',
    },
    'xmhnvieg': {
      'en': 'Save',
      'ar': '',
    },
    'hsawcd5l': {
      'en': 'name is required',
      'ar': '',
    },
    'n1k5dut6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4pgf3hza': {
      'en': 'relation is required',
      'ar': '',
    },
    '5kgnnyp1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8iyae10v': {
      'en': 'mobile number is required',
      'ar': '',
    },
    'ii59pp44': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4pc6upao': {
      'en': 'email is required',
      'ar': '',
    },
    '4v48h5h8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ro81f6wv': {
      'en': 'street address 1 is required',
      'ar': '',
    },
    'fa5v4t0r': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cb3tlem3': {
      'en': 'city is required',
      'ar': '',
    },
    'aa84udt2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x9nls7sc': {
      'en': 'region is required',
      'ar': '',
    },
    'u0oqby0q': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'g8iao1fj': {
      'en': 'country is required',
      'ar': '',
    },
    'o0mlaepd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'tihqxizt': {
      'en': 'postal code is required.',
      'ar': '',
    },
    'yseareo3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Profile-Address_Edit
  {
    'uzk6r4l7': {
      'en': 'Edit Address',
      'ar': 'تعديل العنوان',
    },
    '74pwzzfc': {
      'en': 'Get Current Location',
      'ar': '',
    },
    '4kpwrqdr': {
      'en': 'Name ',
      'ar': 'اسم',
    },
    'nx7a628s': {
      'en': '*',
      'ar': '*',
    },
    'jo6wk99k': {
      'en': 'Name *',
      'ar': '',
    },
    '7ab5bww9': {
      'en': 'Enter your name',
      'ar': '',
    },
    'oii4tqjk': {
      'en': 'Relation ',
      'ar': 'العلاقة',
    },
    'wtzc8lul': {
      'en': '*',
      'ar': '',
    },
    'cfo0h88g': {
      'en': 'Name *',
      'ar': '',
    },
    'vc7bzljs': {
      'en': 'Enter your relation',
      'ar': '',
    },
    '9cbl31r5': {
      'en': 'Mobile Number ',
      'ar': 'رقم الهاتف المحمول',
    },
    'b1c0kmzb': {
      'en': '*',
      'ar': '*',
    },
    'ct7wfz5k': {
      'en': 'Name *',
      'ar': '',
    },
    '6ajozu6l': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
    },
    'tkmibi0a': {
      'en': 'Search...',
      'ar': '',
    },
    'yfnu24gc': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
    },
    '17loszdc': {
      'en': 'Email ',
      'ar': 'بريد إلكتروني',
    },
    '5wvjk1w0': {
      'en': '*',
      'ar': '*',
    },
    'i8rs4ot9': {
      'en': 'Name *',
      'ar': '',
    },
    'f80krm03': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    '5myf5a1f': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'oqga7jg6': {
      'en': '*',
      'ar': '*',
    },
    't3k5rvpn': {
      'en': 'Name *',
      'ar': '',
    },
    '3in9yfsw': {
      'en': 'Enter your street address1',
      'ar': 'أدخل عنوان الشارع الخاص بك1',
    },
    'uxk78q0z': {
      'en': 'City ',
      'ar': 'مدينة',
    },
    'kcy3maok': {
      'en': '*',
      'ar': '*',
    },
    '1oszrulk': {
      'en': 'Name *',
      'ar': '',
    },
    'odk4m9hy': {
      'en': 'Enter your city',
      'ar': 'أدخل مدينتك',
    },
    '1z6anizx': {
      'en': 'Region ',
      'ar': 'منطقة',
    },
    'tj4pk9v5': {
      'en': ' ',
      'ar': '*',
    },
    'wyqqzzqn': {
      'en': 'Name *',
      'ar': '',
    },
    'j91f8fus': {
      'en': 'Enter your region',
      'ar': 'أدخل منطقتك',
    },
    'vy9rxyl7': {
      'en': 'Country ',
      'ar': 'دولة',
    },
    'xhy4xed2': {
      'en': '*',
      'ar': '*',
    },
    'tgzpsy7o': {
      'en': 'Name *',
      'ar': '',
    },
    'rj77sodc': {
      'en': 'Please select country',
      'ar': 'الرجاء تحديد البلد',
    },
    '0ija5qsy': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'ep0b9lqt': {
      'en': 'India',
      'ar': '',
    },
    'cwftwc4e': {
      'en': 'Kuwait',
      'ar': '',
    },
    'sn90v7aa': {
      'en': 'Enter your country',
      'ar': 'أدخل بلدك',
    },
    '8g4q8sak': {
      'en': 'Postal Code ',
      'ar': 'رمز بريدي',
    },
    'yhk214id': {
      'en': '*',
      'ar': '*',
    },
    'o4bjaxte': {
      'en': 'Name *',
      'ar': '',
    },
    '17f8cti4': {
      'en': 'Enter your postal code',
      'ar': 'أدخل الرمز البريدي الخاص بك',
    },
    'za2fbdov': {
      'en': 'Location',
      'ar': 'رمز بريدي',
    },
    'pfs73b1v': {
      'en': '*',
      'ar': '*',
    },
    'pdu1uic9': {
      'en': 'Name *',
      'ar': '',
    },
    '5jecb6wp': {
      'en': 'Set as default address',
      'ar': 'تعيين كعنوان افتراضي',
    },
    'nn4ylfj7': {
      'en': 'Please enter name',
      'ar': '',
    },
    'xeekjzor': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'k5krjzov': {
      'en': 'Please enter relation',
      'ar': '',
    },
    'bes2b7if': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5ij99or4': {
      'en': 'Please enter mobile number',
      'ar': '',
    },
    'pl4yv7e3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hpyl8vrj': {
      'en': 'Please provide a valid email',
      'ar': '',
    },
    'y3j0upe7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '23l8thf6': {
      'en': 'Please enter street address 1 ',
      'ar': '',
    },
    '494qz70g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ajssqa6n': {
      'en': 'Please enter city',
      'ar': '',
    },
    '3pgb6d12': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9zt350k9': {
      'en': 'Please enter region',
      'ar': '',
    },
    'v2evdo4e': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7wdl842p': {
      'en': 'Please enter country',
      'ar': '',
    },
    'asulmrah': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'y5boqi07': {
      'en': 'Please enter postal code',
      'ar': '',
    },
    '8fj7tc2o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8ud6s68x': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // Checkout_PaymentMethod
  {
    '2dn1kjvx': {
      'en': 'How do you pay',
      'ar': 'كيف تدفع',
    },
    'sdhgcktd': {
      'en': 'Pay with K-Net',
      'ar': 'الدفع عبر K-Net',
    },
    'h4tvsidt': {
      'en': 'Pay with Card',
      'ar': 'الدفع عبر البطاقة',
    },
    'i8gz6h3u': {
      'en': 'Remember my choice',
      'ar': 'تذكر اختياري',
    },
    '6eekr0uw': {
      'en': 'Pay with G-Pay',
      'ar': '',
    },
    'j499zkbz': {
      'en': 'Pay with Apple Pay',
      'ar': '',
    },
    'x2mcjqyu': {
      'en': 'Proceed to Pay',
      'ar': 'المتابعة للدفع',
    },
    'kx4ptps8': {
      'en':
          'Your payment method and type will be remembered and you have the option to change it later always.',
      'ar': 'سيتم حفظ طريقة الدفع ونوعها، ويمكنك تغييرها لاحقًا في أي وقت.',
    },
  },
  // Orders_Rate
  {
    '62h6anio': {
      'en': 'How was the dress?',
      'ar': 'كيف كان الفستان؟',
    },
    '1op04c0n': {
      'en': 'Thank You for rating the product.',
      'ar': 'شكرا لك على تقييم المنتج.',
    },
  },
  // c1-Share-Promotion
  {
    'wnjb7t80': {
      'en': 'Share Your Exclusive Link!',
      'ar': 'شارك رابطك الحصري!',
    },
    'r5wc9kxx': {
      'en': 'https://azyaa.in/TGxKkBC6L2k/AZYAA258746',
      'ar': 'https://azyaa.in/TGxKkBC6L2k/AZYAA258746',
    },
    'i6p71rqi': {
      'en': 'WhatsApp',
      'ar': 'واتساب',
    },
    'et0ovjix': {
      'en': 'Facebook',
      'ar': 'فيسبوك',
    },
    'pn1i0klz': {
      'en': 'Instagram',
      'ar': 'إنستغرام',
    },
    '53z0wnhe': {
      'en': 'Twitter',
      'ar': 'تويتر',
    },
    'vibez6aw': {
      'en': 'Download all Images',
      'ar': 'تحميل كل الصور',
    },
    'sq658ff9': {
      'en': 'Back to Home',
      'ar': 'العودة إلى الصفحة الرئيسية',
    },
  },
  // Creator-Promotion
  {
    'atunifb1': {
      'en': 'Full set',
      'ar': '',
    },
  },
  // Product-Listview
  {
    'mvsgg1z4': {
      'en': 'Ready made ',
      'ar': 'جاهز',
    },
    'ppcfshmr': {
      'en': '| ',
      'ar': '',
    },
  },
  // creatorspaceProductview
  {
    'ycspy4gb': {
      'en': 'ID : ',
      'ar': '',
    },
    '1ddjksyv': {
      'en': ' Sold ',
      'ar': 'مُباع',
    },
    '7ibl4mix': {
      'en': ' KD ',
      'ar': '',
    },
    'fhe5vo8k': {
      'en': 'Earned',
      'ar': 'مكتسب',
    },
  },
  // creatorproduct-img
  {
    'l51fkrjz': {
      'en': '100',
      'ar': '',
    },
    'ochzch1r': {
      'en': '150 KD',
      'ar': '',
    },
  },
  // creatorproduct-video
  {
    'tl7wszaq': {
      'en': 'Video99817_9280.mp4',
      'ar': 'فيديو99817_9280.mp4',
    },
    '7jcuyggh': {
      'en': '13.67 ',
      'ar': '',
    },
    '9knob9gi': {
      'en': 'MB ',
      'ar': '',
    },
    '1911undl': {
      'en': '| ',
      'ar': '',
    },
    'sqtrkhby': {
      'en': '1800',
      'ar': '',
    },
    'rr1066lv': {
      'en': ' x ',
      'ar': '',
    },
    '6p66rxjk': {
      'en': '679',
      'ar': '',
    },
    'pw90ci9d': {
      'en': '100',
      'ar': '',
    },
    '670i1ix8': {
      'en': '150 KD',
      'ar': '',
    },
  },
  // SelectedDressComponent
  {
    '2nw6eap5': {
      'en': 'Select Product',
      'ar': 'اختر المنتج',
    },
    '9ndh9vj9': {
      'en': 'Out of stock',
      'ar': 'غير متوفر في المخزون',
    },
    'lg0ruu8a': {
      'en': ' Item Selected',
      'ar': 'عنصر محدّد',
    },
    'c66v8c85': {
      'en': 'Hello World',
      'ar': '',
    },
    '48ie9i8k': {
      'en': 'Add',
      'ar': 'إضافة',
    },
  },
  // Product-Share
  {
    'zeucs429': {
      'en': 'Share Your Exclusive Link!',
      'ar': 'شارك رابطك الحصري!',
    },
    'uq9vf4lm': {
      'en': 'https://azyaa.in/TGxKkBC6L2k/AZYAA258746',
      'ar': '',
    },
    '19zzmar2': {
      'en': 'WhatsApp',
      'ar': 'واتساب',
    },
    'apjgvg24': {
      'en': 'Facebook',
      'ar': 'فيسبوك',
    },
    'p45msafh': {
      'en': 'Instagram',
      'ar': 'إنستغرام',
    },
    'pyjiv94b': {
      'en': 'Twitter',
      'ar': 'تغريد',
    },
    '3dg5yj02': {
      'en': 'Download all Images',
      'ar': 'تحميل كل الصور',
    },
    't4wxh4th': {
      'en': 'Back to Home',
      'ar': 'العودة إلى الرئيسية',
    },
  },
  // Designer-Grid
  {
    '2rtkyofo': {
      'en': 'Designer Name',
      'ar': 'اسم المصمّم',
    },
    '0i7jo3pi': {
      'en': 'Brand name',
      'ar': 'اسم العلامة التجارية',
    },
  },
  // Orders_Comp
  {
    'mxs53ke0': {
      'en': 'Estimated arrival in ',
      'ar': 'الوصول المتوقع خلال',
    },
    '7bwanqi3': {
      'en': 'Hello World',
      'ar': '',
    },
    'n8xug5du': {
      'en': 'Order ID : ',
      'ar': 'رقم الطلب:',
    },
    'gpraph7c': {
      'en': 'Hello World',
      'ar': '',
    },
    'ezqh87o9': {
      'en': 'Return request ',
      'ar': 'طلب إرجاع',
    },
    'hsk2wf7p': {
      'en': 'Hello World',
      'ar': '',
    },
    'jdmnj42o': {
      'en': 'Order ID : ',
      'ar': 'رقم الطلب:',
    },
    'tcitfuqz': {
      'en': 'Hello World',
      'ar': '',
    },
    '4jjokbov': {
      'en': 'Order ID : ',
      'ar': 'رقم الطلب:',
    },
    '5ba73bs5': {
      'en': 'Hello World',
      'ar': '',
    },
    '2k9psxld': {
      'en': ' Items  ',
      'ar': 'العناصر',
    },
    's1t10s7h': {
      'en': '|  ',
      'ar': '|',
    },
  },
  // Login-component
  {
    'kvv17ohc': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '5vw54zpj': {
      'en': 'Google',
      'ar': 'جوجل',
    },
    'mn316pv0': {
      'en': 'Apple',
      'ar': 'تفاحة',
    },
    '7x90iye7': {
      'en': 'or sign in with',
      'ar': 'أو قم بتسجيل الدخول باستخدام',
    },
    'vs6l9e80': {
      'en': 'Email ',
      'ar': 'بريد إلكتروني',
    },
    'qnvcuxqk': {
      'en': '*',
      'ar': '*',
    },
    'g4q2nkyx': {
      'en': 'Name *',
      'ar': 'اسم *',
    },
    'oeot317w': {
      'en': 'Enter your email',
      'ar': 'أدخل بريدك الإلكتروني',
    },
    'bv6k9wh3': {
      'en': 'Password ',
      'ar': '',
    },
    's4ro5lcw': {
      'en': '*',
      'ar': '',
    },
    '1m18a8oi': {
      'en': 'Email *',
      'ar': '',
    },
    'eq2s4ibg': {
      'en': 'Enter your password',
      'ar': '',
    },
    'zg8hoo1h': {
      'en': 'Forgot your password?',
      'ar': '',
    },
    'y9wxu8qj': {
      'en': 'Name *',
      'ar': '',
    },
    'gsx9xqu6': {
      'en': 'Sign in',
      'ar': '',
    },
    '7eznhnt9': {
      'en': 'By continuing you agree ',
      'ar': '',
    },
    'zwsgxgao': {
      'en': 'Terms of Services ',
      'ar': '',
    },
    'flsbkg0f': {
      'en': '& ',
      'ar': '',
    },
    'v713ww30': {
      'en': 'Privacy Policy ',
      'ar': '',
    },
    'n084xvym': {
      'en': 'Don’t have an account ? ',
      'ar': '',
    },
    'g2cfh96m': {
      'en': 'Sign Up',
      'ar': '',
    },
    'hblts337': {
      'en': 'Please provide a valid email ',
      'ar': '',
    },
    'coiu9bhz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'turdj4hf': {
      'en': 'Please enter password',
      'ar': '',
    },
    '42xxmgdv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Home_AppBar
  {
    'yip4u30a': {
      'en': 'Creator',
      'ar': 'الخالق',
    },
    'wg9zzf01': {
      'en': 'Space',
      'ar': 'فضاء',
    },
  },
  // Universal_AppBar
  {
    '0ohv0220': {
      'en': 'Try more',
      'ar': 'جرب المزيد',
    },
  },
  // App_Updater_Popup_Android
  {
    '5bc0rdbr': {
      'en': 'Update Required!',
      'ar': 'التحديث مطلوب!',
    },
    'ab4ayhjc': {
      'en': 'Azyaa',
      'ar': 'أزياء',
    },
    'g2qplzbj': {
      'en':
          'We have launched a new and improved app. Please update to continue shopping.',
      'ar': 'قمنا بإطلاق تطبيق جديد ومحسّن. يرجى التحديث للمتابعة في التسوّق.',
    },
    '4kuxvo66': {
      'en': 'Release Notes',
      'ar': 'ملاحظات الإصدار',
    },
    'g7dkyjha': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // App_Updater_Popup_IOS
  {
    'if3kqd03': {
      'en': 'Update Required!',
      'ar': 'التحديث مطلوب!',
    },
    'p9030b5i': {
      'en': 'Azyaa',
      'ar': 'أزياء',
    },
    'kvnp6gz6': {
      'en':
          'We have launched a new and improved app. Please update to continue shopping.',
      'ar': 'قمنا بإطلاق تطبيق جديد ومحسّن. يرجى التحديث للمتابعة في التسوّق.',
    },
    '1qq5els3': {
      'en': 'Release Notes',
      'ar': 'ملاحظات الإصدار',
    },
    'lzgwptpx': {
      'en': 'Install Now',
      'ar': 'التثبيت الآن',
    },
  },
  // Orders_Single_Comp
  {
    'v46mmwl4': {
      'en': ' KD',
      'ar': '',
    },
    'j8bzkzfo': {
      'en': ' x',
      'ar': '',
    },
    '8jn0nddu': {
      'en': 'Available return till : ',
      'ar': 'متاح الإرجاع حتى :',
    },
    'oe5iamra': {
      'en': 'Track Order',
      'ar': '',
    },
  },
  // Cart_Item_List_DeleteConfirm
  {
    'w9ph2wn4': {
      'en': 'Are you sure?',
      'ar': 'هل أنت متأكد؟',
    },
    'xpv8xtv1': {
      'en': 'Are you sure you want to remove the item from the cart!',
      'ar': 'هل أنت متأكد من أنك تريد إزالة هذا العنصر من عربة التسوّق؟',
    },
    't62t5vsq': {
      'en': 'Save for later',
      'ar': 'حفظ لوقت لاحق',
    },
    'ta266fvf': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '3otvpv8q': {
      'en': 'Don\'t show again',
      'ar': 'عدم الإظهار مرة أخرى',
    },
  },
  // Product-Filter-Popup
  {
    'fqtpef4s': {
      'en': 'Filters',
      'ar': 'المرشحات',
    },
    'pag0jwtp': {
      'en': '4 Filter added',
      'ar': '',
    },
    '8efijf1a': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'ij2bbqk6': {
      'en': 'Style',
      'ar': 'الأسلوب',
    },
    '87hsyjzh': {
      'en': '2',
      'ar': '2',
    },
    '3yko7g9m': {
      'en': 'Price',
      'ar': 'السعر',
    },
    'mwkfugua': {
      'en': '5',
      'ar': '5',
    },
    '5vlmrwrj': {
      'en': 'Search Categories',
      'ar': 'يبحث',
    },
    'pww06i9n': {
      'en': 'Custom Made',
      'ar': 'حسب الطلب',
    },
    'm23v3hap': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'nt2bqqbv': {
      'en': 'Below 100KD',
      'ar': 'أقل من 100 دينار كويتي',
    },
    '6sj9tjzn': {
      'en': '100 KD to 250 KD',
      'ar': 'من 100 إلى 250 دينار كويتي',
    },
    '4gqwtnop': {
      'en': '250 KD to 1000 KD',
      'ar': 'من 250 إلى 1000 دينار كويتي',
    },
    'ukswgei9': {
      'en': '1000 KD to 5000 KD',
      'ar': 'من 1000 دينار كويتي إلى 5000 دينار كويتي',
    },
    'fhujdmea': {
      'en': 'Custom Range',
      'ar': 'مجموعة مخصصة',
    },
    '1pflz26o': {
      'en': 'Reset',
      'ar': 'إعادة تعيين',
    },
    'c11yuz6l': {
      'en': 'Apply Changes',
      'ar': 'الدفع',
    },
  },
  // Product-Sort
  {
    '6c92zuam': {
      'en': 'Sort by',
      'ar': 'الفرز حسب',
    },
    'ddhgxoqz': {
      'en': 'UK',
      'ar': '',
    },
    '9dczathl': {
      'en': 'US',
      'ar': '',
    },
    'k92i3yza': {
      'en': 'Newer',
      'ar': 'الأحدث',
    },
    '2hab1bwp': {
      'en': 'Popular',
      'ar': 'الأكثر شيوعًا',
    },
    '7cfybex4': {
      'en': 'Recommended',
      'ar': 'موصى به',
    },
    'obv8tjsy': {
      'en': 'Price - Low to High',
      'ar': 'السعر - من الأقل إلى الأعلى',
    },
    '8jgcxq4h': {
      'en': 'Price - High to Low',
      'ar': 'السعر - من الأعلى إلى الأدنى',
    },
    'chste36w': {
      'en': 'Newer',
      'ar': '',
    },
    'pywoyh77': {
      'en': 'Popular',
      'ar': '',
    },
    'w2tg16ij': {
      'en': 'Recommended',
      'ar': '',
    },
    '0690tiib': {
      'en': 'Price - Low to high',
      'ar': '',
    },
    'fwz52ncb': {
      'en': 'Price - High to low',
      'ar': '',
    },
  },
  // Salebanner
  {
    'sb5rmt1a': {
      'en': 'Biggest Ramadan\nSale Now',
      'ar': 'أكبر تخفيضات رمضان الآن',
    },
  },
  // VTO_Begin
  {
    'r10ean85': {
      'en': 'Welcome to virtual try on',
      'ar': 'مرحبًا بك في التجربة الافتراضية',
    },
    'la8dovdl': {
      'en':
          'Experience fashion like never before with Azyaa’s AI Powered Try-On!',
      'ar':
          'اختبر الموضة كما لم تفعل من قبل مع تجربة أزياء المدعومة بالذكاء الاصطناعي من Azyaa!',
    },
    'kwlngprf': {
      'en':
          'No more guessing how a dress will look on you. simply upload your photo and see yourself in any outfit instantly.',
      'ar':
          'لا مزيد من التخمين حول كيف سيبدو الفستان عليك. فقط ارفع صورتك وشاهد نفسك في أي زي فورًا.',
    },
    '1wpgn0s9': {
      'en': 'Get Started',
      'ar': 'ابدأ الآن',
    },
  },
  // VTO_Final
  {
    'xu1k1g74': {
      'en': 'Virtual try on',
      'ar': 'تجربة افتراضية',
    },
    '1m9je3zk': {
      'en': 'Upload your photo',
      'ar': 'حمّل صورتك',
    },
    'inlxnhuc': {
      'en': 'Upload a good looking photo of yours to try the outfit',
      'ar': 'قم برفع صورة جيدة لك لتجربة الزي',
    },
    'j7ejaem6': {
      'en': 'Upload Photo',
      'ar': 'رفع صورة',
    },
    '0u4rf9hk': {
      'en': 'Accepts photo of JPG, PNG upto 2mb',
      'ar': 'يقبل صور JPG وPNG حتى 2 ميغابايت',
    },
    '5jl0bfvl': {
      'en': 'Recent photos',
      'ar': 'الصور الحديثة',
    },
    '5vlafjcr': {
      'en': 'Loading...',
      'ar': 'جارٍ التحميل...',
    },
    'e4n8qoh5': {
      'en': '\"Your style transformation is in progress…\"',
      'ar': '\"تحوّل أسلوبك قيد التنفيذ…\"',
    },
    'dqe74p9h': {
      'en':
          'We’re delicately crafting your virtual look with couture-level precision.',
      'ar': 'نقوم بصنع إطلالتك الافتراضية بعناية ودقّة عالية.',
    },
    'z3c6w8gk': {
      'en': 'Wohoo! your outfit is ready',
      'ar': 'رائع! زيّك جاهز',
    },
    'tyv1z0nj': {
      'en': 'You can find all your Try ons in account section later',
      'ar': 'يمكنك العثور على كل تجاربك الافتراضية في قسم الحساب لاحقًا',
    },
    'heivs8dv': {
      'en': 'View other dress',
      'ar': 'عرض فستان آخر',
    },
    'e5uxj1re': {
      'en': 'Share',
      'ar': 'مشاركة',
    },
  },
  // DefaultCartButton
  {
    'wn642lb5': {
      'en': 'Select',
      'ar': 'اختيار',
    },
    'wib82ouz': {
      'en': 'Please choose product options !',
      'ar': 'يرجى اختيار خيارات المنتج!',
    },
    'eaw4t280': {
      'en': 'Select',
      'ar': 'اختيار',
    },
    '9654rw8w': {
      'en': 'Please choose product options !',
      'ar': 'يرجى اختيار خيارات المنتج!',
    },
    'wj0v0g4o': {
      'en': 'Purchase ',
      'ar': '',
    },
  },
  // Social
  {
    'gatq8815': {
      'en': 'Google',
      'ar': 'جوجل',
    },
    '6n0eqkfo': {
      'en': 'Apple',
      'ar': 'تفاحة',
    },
    'wpu9hjb9': {
      'en': 'Facebook',
      'ar': 'فيسبوك',
    },
  },
  // VTO_DeleteConfirm
  {
    'wy85xapy': {
      'en': 'Are you sure?',
      'ar': 'هل أنت متأكد؟',
    },
    '64hz2jt6': {
      'en': 'Are you sure you want to remove this try-on item from the list!',
      'ar':
          'هل أنت متأكد من أنك تريد إزالة عنصر التجربة الافتراضية من القائمة؟',
    },
    '0ap35ndg': {
      'en': 'Close',
      'ar': 'إغلاق',
    },
    'bjrpucrp': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    '9wtgiyfs': {
      'en': 'Don\'t show again',
      'ar': 'عدم الإظهار مرة أخرى',
    },
  },
  // Product-Filters
  {
    'e47b0vxt': {
      'en': 'Filters',
      'ar': '',
    },
    '22m3h1wb': {
      'en': '4 Filter added',
      'ar': '',
    },
    'jpms8xiw': {
      'en': 'Style',
      'ar': 'أسلوب',
    },
    '39uqap9k': {
      'en': '1',
      'ar': '',
    },
    'qio2oh4q': {
      'en': 'Colors',
      'ar': 'الألوان',
    },
    'zydes5qe': {
      'en': '1',
      'ar': '',
    },
    'x8y9mu4r': {
      'en': 'Sizes',
      'ar': 'المقاسات',
    },
    'tyh8b6a9': {
      'en': '1',
      'ar': '',
    },
    'q1dmqqbg': {
      'en': 'Sizes',
      'ar': 'المقاسات',
    },
    '56ul1azu': {
      'en': '1',
      'ar': '',
    },
    'sqx4b7e9': {
      'en': 'Price',
      'ar': 'سعر',
    },
    'vfrfn5ac': {
      'en': '1',
      'ar': '',
    },
    'bvfm0ych': {
      'en': 'Brands',
      'ar': 'العلامات التجارية',
    },
    'xki6zdzp': {
      'en': '1',
      'ar': '',
    },
    '99hpik9g': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'rsqfg13s': {
      'en': 'Select all',
      'ar': '',
    },
    'm5crsomc': {
      'en': 'UK',
      'ar': '',
    },
    '4urcjsoz': {
      'en': 'US',
      'ar': '',
    },
    '7q29otn6': {
      'en': '',
      'ar': '',
    },
    'ktvy0xes': {
      'en': 'XS',
      'ar': '',
    },
    'rtkrhh0g': {
      'en': 'S',
      'ar': '',
    },
    'ulpijxr7': {
      'en': 'Custom Made',
      'ar': '',
    },
    '2ysqciw0': {
      'en': 'Ready Made',
      'ar': '',
    },
    'boaj2e93': {
      'en': 'XS',
      'ar': '',
    },
    'k9kz2j0w': {
      'en': 'XS',
      'ar': '',
    },
    'smj50mxp': {
      'en': 'Below 100KD',
      'ar': '',
    },
    'wjujmn5r': {
      'en': '100 KD to 250 KD',
      'ar': '',
    },
    'irdyysrf': {
      'en': '250 KD to 1000 KD',
      'ar': '',
    },
    'aaniaegk': {
      'en': '1000 KD to 5000 KD',
      'ar': '',
    },
    '5jn5qnqm': {
      'en': 'Custom Range',
      'ar': '',
    },
    'yrlms8ii': {
      'en': '150KD',
      'ar': '',
    },
    '1zm6x7j7': {
      'en': '150KD',
      'ar': '',
    },
    'un7j0f2n': {
      'en': 'Reset',
      'ar': 'إعادة تعيين',
    },
    '27mfoja3': {
      'en': 'Apply Changes',
      'ar': 'الدفع',
    },
  },
  // SizeChart_Default
  {
    'm9au176p': {
      'en': 'Size Chart',
      'ar': 'شنطة',
    },
    'cfruq7kf': {
      'en': 'UK',
      'ar': 'المملكة المتحدة',
    },
    'kqod80yp': {
      'en': 'US',
      'ar': 'الولايات المتحدة',
    },
    'hzajhcf4': {
      'en': 'UK',
      'ar': 'المملكة المتحدة',
    },
    '4ztk6y19': {
      'en': 'Size',
      'ar': 'المقاس',
    },
    'qacotup2': {
      'en': 'UK Size',
      'ar': 'مقاس المملكة المتحدة',
    },
    '3z31ud0z': {
      'en': 'Bust',
      'ar': 'الصدر',
    },
    'zdrurl37': {
      'en': 'Waist',
      'ar': 'الخصر',
    },
    'wrh3b1dq': {
      'en': 'Hip',
      'ar': 'الورك',
    },
    'aqnnchzo': {
      'en': 'Shoulder',
      'ar': 'الكتف',
    },
    'ondpewm8': {
      'en': 'Sleeve Length',
      'ar': 'طول الكم',
    },
    't4yi1i6p': {
      'en': 'XS (Extra Small)',
      'ar': 'XS (صغير جدًا)',
    },
    'e5s19ck1': {
      'en': '6',
      'ar': '6',
    },
    'utzu4cod': {
      'en': '32',
      'ar': '32',
    },
    'llr9dmfu': {
      'en': '24',
      'ar': '24',
    },
    '7tcsvf7g': {
      'en': '34',
      'ar': '34',
    },
    '1i01tuae': {
      'en': '14',
      'ar': '14',
    },
    'vimto9g0': {
      'en': '23',
      'ar': '23',
    },
    'ljnquoye': {
      'en': 'S (Small)',
      'ar': 'S (صغير)',
    },
    'eur3onsn': {
      'en': '8',
      'ar': '8',
    },
    'fhtuaxvl': {
      'en': '34',
      'ar': '34',
    },
    '7xwtado5': {
      'en': '26',
      'ar': '26',
    },
    'xuyczgyo': {
      'en': '36',
      'ar': '36',
    },
    'k6nvncin': {
      'en': '14.5',
      'ar': '14.5',
    },
    'b8r5yg68': {
      'en': '23.5',
      'ar': '23.5',
    },
    'sqkb2g9i': {
      'en': 'M (Medium)',
      'ar': 'M (متوسط)',
    },
    'u1wrytt9': {
      'en': '10',
      'ar': '10',
    },
    '0alyi0mb': {
      'en': '36',
      'ar': '36',
    },
    'kf4qstqo': {
      'en': '28',
      'ar': '28',
    },
    't2b78g22': {
      'en': '38',
      'ar': '38',
    },
    'p5pprwgh': {
      'en': '15',
      'ar': '15',
    },
    'jxnzp6jb': {
      'en': '24',
      'ar': '24',
    },
    'd41tzwbw': {
      'en': 'L (Large)',
      'ar': 'L (كبير)',
    },
    'iakpfxdd': {
      'en': '12',
      'ar': '12',
    },
    'uweozod0': {
      'en': '38',
      'ar': '38',
    },
    'kogs4rmf': {
      'en': '30',
      'ar': '30',
    },
    '2ofntk6g': {
      'en': '40',
      'ar': '40',
    },
    '020hu4sf': {
      'en': '15.5',
      'ar': '15.5',
    },
    'ych45sud': {
      'en': '24.5',
      'ar': '24.5',
    },
    'bqoejfeu': {
      'en': 'XL (Extra Large)',
      'ar': 'XL (كبير جدًا)',
    },
    '60rxi6ot': {
      'en': '14',
      'ar': '14',
    },
    '3idheid1': {
      'en': '40',
      'ar': '40',
    },
    'vn36e2aj': {
      'en': '32',
      'ar': '32',
    },
    'ff2nx9ee': {
      'en': '42',
      'ar': '42',
    },
    'o0hcku1g': {
      'en': '16',
      'ar': '16',
    },
    '6hu2qucd': {
      'en': '25',
      'ar': '25',
    },
    'duhosqup': {
      'en': 'XXL (2X Large)',
      'ar': 'XXL (كبير 2X)',
    },
    'jfkvh8w4': {
      'en': '16',
      'ar': '16',
    },
    'jbglwke6': {
      'en': '42',
      'ar': '42',
    },
    'fpxvw4fz': {
      'en': '34',
      'ar': '34',
    },
    'vm16djmk': {
      'en': '44',
      'ar': '44',
    },
    'y4plf0xx': {
      'en': '16.5',
      'ar': '16.5',
    },
    'zl0vyz9l': {
      'en': '25.5',
      'ar': '25.5',
    },
    'nqtu66ff': {
      'en': 'All measurements are in inches',
      'ar': 'جميع القياسات بالبوصة',
    },
  },
  // UnfollowConfirm-Popup
  {
    '1hynjjqr': {
      'en': 'Close',
      'ar': 'إغلاق',
    },
    'sl87x5a9': {
      'en': 'Unfollow',
      'ar': 'انتقل إلى الدفع',
    },
    '1tru23t4': {
      'en': 'Don\'t show again',
      'ar': 'عدم الإظهار مرة أخرى',
    },
  },
  // Chosseoption-Popup
  {
    'x56dso72': {
      'en': 'Close',
      'ar': 'إغلاق',
    },
    'wnho0rkb': {
      'en': 'Don\'t show again',
      'ar': 'عدم الإظهار مرة أخرى',
    },
  },
  // WaitListPopup
  {
    '1eiktun5': {
      'en': 'Thank You! You’ve been added to the waitlist.',
      'ar': 'شكراً لك! لقد تمت إضافتك إلى قائمة الانتظار.',
    },
    'o9z4tufy': {
      'en': 'Your Waiting Number: ',
      'ar': 'رقم الانتظار الخاص بك:',
    },
    '0mxuxwso': {
      'en': ' WL025',
      'ar': 'WL025',
    },
    'hnl65tp7': {
      'en': 'We’ll notify you via email as soon as your account is approved.',
      'ar': 'سنقوم بإخطارك عبر البريد الإلكتروني بمجرد الموافقة على حسابك.',
    },
    'ue7ia0ph': {
      'en': 'Okay',
      'ar': 'حسنًا',
    },
  },
  // Search
  {
    'kppx4joe': {
      'en': 'Search Result',
      'ar': '',
    },
  },
  // reject-reason
  {
    '73b3jtx8': {
      'en': 'Reason for Rejection',
      'ar': 'كيف تدفع',
    },
    '1t1k7txm': {
      'en': 'Product used or damaged ',
      'ar': 'المنتج مستعمل أو متضرر',
    },
    'm95r8ezw': {
      'en': 'Additional message for Rejection',
      'ar': 'كيف تدفع',
    },
    'g749i7b8': {
      'en':
          'The product did not meet my expectations in terms of quality and performance.I decided to return the item as I no longer have a need for it. ',
      'ar':
          'لم يلبِ المنتج توقعاتي من حيث الجودة والأداء. قررت إرجاع المنتج لأنني لم أعد بحاجة إليه',
    },
  },
  // Product_Measurement_Popup
  {
    'nj454r3h': {
      'en': 'Select Body Measurement',
      'ar': 'ملخص',
    },
    'cmzo2dm4': {
      'en': 'Add a New body Measurement',
      'ar': 'إضافة قياس جسم جديد',
    },
    'aj3lzej1': {
      'en': 'Height : ',
      'ar': 'الطول:',
    },
    '107gu9zo': {
      'en': ' , ',
      'ar': '',
    },
    '7t89pho4': {
      'en': 'Weight : ',
      'ar': 'الوزن:',
    },
    'vjdghxko': {
      'en': 'Hello World',
      'ar': '',
    },
    'hrng56z0': {
      'en': 'Default',
      'ar': 'افتراضي',
    },
    '3foca52k': {
      'en': 'Save & Continue',
      'ar': 'انتقل إلى الدفع',
    },
  },
  // VirtualTryOn_Points
  {
    '4r8wthcf': {
      'en': 'You’re out of Try-On credits!',
      'ar': 'لقد استنفدت رصيد التجارب الافتراضية!',
    },
    'cffq73sf': {
      'en':
          'You need credits to use the Virtual Try-On feature. Recharge now and see how your outfit looks on you instantly!',
      'ar':
          'تحتاج إلى رصيد لاستخدام ميزة التجربة الافتراضية. اشحن الآن وشاهد إطلالتك بالزي فورًا!',
    },
    'b9nk7x7y': {
      'en': 'Select a Credit Pack',
      'ar': 'اختر باقة أرصدة',
    },
    '58bxei6z': {
      'en': 'Credits',
      'ar': 'أرصدة',
    },
    'w6myt15o': {
      'en': 'Not Now',
      'ar': 'يمسح',
    },
    'koh2r3am': {
      'en': 'Recharge Now',
      'ar': 'انتقل إلى الدفع',
    },
  },
  // CustomAlertDialog
  {
    'gsqxql0j': {
      'en': 'Ok',
      'ar': '',
    },
  },
  // Non-returnable-Item
  {
    '1jr0umfn': {
      'en': 'Non-refundable item in your cart!',
      'ar': 'عنصر غير قابل للاسترداد في سلة التسوق الخاصة بك!',
    },
    'dcqh41od': {
      'en':
          'This item is non-refundable and can’t be returned \nor exchanged after purchase. Do you want to continue with checkout?',
      'ar':
          'هذا المنتج غير قابل للاسترداد ولا يمكن إرجاعه أو استبداله بعد الشراء. هل ترغب في المتابعة إلى إتمام الشراء؟\"',
    },
    'dadjhsm8': {
      'en': 'Agree & continue',
      'ar': 'موافقة ومتابعة',
    },
    'gy5s87xs': {
      'en': 'Cancel',
      'ar': 'إلغاء',
    },
  },
  // Cart_Item_Non-refund
  {
    '3vgnbv6w': {
      'en': '* Returns Not Applicable for This Item',
      'ar': '* لا يُسمح بإرجاع هذا المنتج',
    },
  },
  // ApplyCoupon
  {
    '7gd4ax2q': {
      'en': 'Apply Coupon',
      'ar': 'أضف قياسات جسمك',
    },
    '38x7sap7': {
      'en': 'Discount code or Gift card',
      'ar': 'رمز الخصم أو بطاقة الهدايا',
    },
    'ep1lpnyz': {
      'en': 'Apply',
      'ar': 'يتقدم',
    },
    '9ug8moss': {
      'en': 'Available Coupons',
      'ar': 'قسائم متاحة',
    },
    '7s9t8th5': {
      'en': 'Apply',
      'ar': '',
    },
    'qrh95x8p': {
      'en': 'Apply',
      'ar': 'يتقدم',
    },
    '8la5bc3y': {
      'en': 'Hello World',
      'ar': '',
    },
    'k6iz2j4x': {
      'en': 'Hello World',
      'ar': '',
    },
  },
  // Product_Attribute_PromoLevel
  {
    '09a2x3qy': {
      'en': 'Choose',
      'ar': 'اختر',
    },
    'eafrhyuq': {
      'en': 'Add to bag',
      'ar': 'أضف إلى السلة',
    },
    '8ihv2tul': {
      'en': 'Select',
      'ar': 'يختار',
    },
    '3qkww5zr': {
      'en': 'Please choose product options !',
      'ar': 'يرجى اختيار خيارات المنتج!',
    },
    'ou1nnpzs': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    'xf0bb7bs': {
      'en': 'Measurement',
      'ar': 'القياسات',
    },
  },
  // TrackOrder
  {
    'sefgzbo4': {
      'en': 'Shipping Timelines',
      'ar': 'مواعيد الشحن',
    },
    'itvphgfg': {
      'en': 'Order  ID : ',
      'ar': 'رقم الطلب:',
    },
    'h6qvovf0': {
      'en': '',
      'ar': '',
    },
    '3r1eoaqm': {
      'en': 'Hello World',
      'ar': '',
    },
    'u1soflle': {
      'en': 'Order ID : ',
      'ar': 'رقم الطلب:',
    },
    'ye81advb': {
      'en': 'azyorde123',
      'ar': '',
    },
    'ts30ol8b': {
      'en': 'Hello World',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    '6u2ysci3': {
      'en': 'Enter you name',
      'ar': '',
    },
    '7j4yhwxa': {
      'en': 'Button',
      'ar': '',
    },
    '8xfza8eo': {
      'en': 'Button',
      'ar': '',
    },
    'waphlyvh': {
      'en': 'Contact Us',
      'ar': '',
    },
    '3fhszftw': {
      'en': 'Heading1',
      'ar': '',
    },
    'uykn2ape': {
      'en': 'description1',
      'ar': '',
    },
    'js7eokq1': {
      'en': 'label*',
      'ar': '',
    },
    'd7g9njeh': {
      'en': 'Follow',
      'ar': '',
    },
    '8gbom9wa': {
      'en': 'Option 1',
      'ar': '',
    },
    '8ls1q7gk': {
      'en': 'Option 2',
      'ar': '',
    },
    'yxzzo3fg': {
      'en': 'English',
      'ar': '',
    },
    '3ln22jyu': {
      'en': 'English',
      'ar': '',
    },
    'yelsq8c0': {
      'en': 'Heading2',
      'ar': '',
    },
    'xqvkmqf3': {
      'en': 'Hello World',
      'ar': '',
    },
    'e4gc5nr5': {
      'en': 'Hello World',
      'ar': '',
    },
    'ue2dfqjn': {
      'en': 'to add profile photo.',
      'ar': 'للصورة الشخصية.',
    },
    'bs452y21': {
      'en': 'to add photos from gallery.',
      'ar': 'لطلب الصورة.',
    },
    '2uhz2xet': {
      'en': 'In order to record audio for video.',
      'ar':
          'لكي يتمكن هذا التطبيق من تسجيل الصوت للفيديو، فإنه يحتاج إلى إذن للوصول إلى الميكروفون.',
    },
    't82228vl': {
      'en':
          'Your location is used to provide accurate delivery tracking, estimate arrival times, and help our couriers find your exact address for a seamless delivery experience.',
      'ar': '',
    },
    'qkkevvsw': {
      'en': 'to receive updates.',
      'ar': 'للحصول على تحديثات الطلب.',
    },
    'xudiqftl': {
      'en':
          'Your location is used to provide accurate delivery tracking, estimate arrival times, and help our couriers find your exact address for a seamless delivery experience.',
      'ar': '',
    },
    'b01yq6w9': {
      'en': 'Error:[error]',
      'ar': 'خطأ:[خطأ]',
    },
    'rk6n916c': {
      'en': 'Password reset email sent',
      'ar': 'تم إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور',
    },
    'lfvc7ori': {
      'en': 'Email required!',
      'ar': 'البريد الإلكتروني مطلوب!',
    },
    'gen42piv': {
      'en': 'Phone number required and has to start with +.',
      'ar': 'رقم الهاتف مطلوب ويجب أن يبدأ بـ +.',
    },
    'scox9j69': {
      'en': 'Passwords don\'t match',
      'ar': 'كلمات المرور غير متطابقة',
    },
    'jh17uloi': {
      'en': 'Enter SMS verification code',
      'ar': 'أدخل رمز التحقق عبر الرسائل القصيرة',
    },
    'dc7n1n6a': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
      'ar':
          'لقد مر وقت طويل منذ آخر تسجيل دخول. قم بتسجيل الدخول مرة أخرى قبل حذف حسابك.',
    },
    '8igj1riq': {
      'en':
          'Too long since most recent sign in. Sign in again before updating your email.',
      'ar':
          'لقد مر وقت طويل منذ آخر تسجيل دخول. قم بتسجيل الدخول مرة أخرى قبل تحديث بريدك الإلكتروني.',
    },
    'ijhevhlz': {
      'en': 'Email change confirmation email sent!',
      'ar': 'تم إرسال رسالة تأكيد تغيير البريد الإلكتروني!',
    },
    'dti5dm6s': {
      'en': 'Email already in use by another account',
      'ar': 'البريد الإلكتروني قيد الاستخدام بالفعل بواسطة حساب آخر',
    },
    'al4fkmjt': {
      'en':
          'The supplied auth credential is incorrect,malformed or has expired',
      'ar':
          'بيانات اعتماد المصادقة المقدمة غير صحيحة أو مشوهة أو منتهية الصلاحية',
    },
    '2blhipqo': {
      'en': 'Invalid file format',
      'ar': 'تنسيق الملف غير صالح',
    },
    'v25wi5br': {
      'en': 'Uploading file...',
      'ar': 'جاري تحميل الملف...',
    },
    'upv9ejlz': {
      'en': 'Success!',
      'ar': 'نجاح!',
    },
    'be7j0amn': {
      'en': 'Failed to update data',
      'ar': 'فشل في تحديث البيانات',
    },
    'c68cf11u': {
      'en': '',
      'ar': '',
    },
    'fh5g9dzb': {
      'en': 'Choose Source',
      'ar': 'اختر المصدر',
    },
    '65i3pu9i': {
      'en': 'Gallery',
      'ar': 'معرض',
    },
    'zquteuws': {
      'en': 'Gallery(Photo)',
      'ar': 'معرض (صور)',
    },
    'tagqb307': {
      'en': 'Gallery(Video)',
      'ar': 'المعرض (فيديو)',
    },
    'jz6cydv9': {
      'en': 'Camera',
      'ar': 'آلة تصوير',
    },
    'f730gm9s': {
      'en': '',
      'ar': '',
    },
    'evuwmq7x': {
      'en': '',
      'ar': '',
    },
    '3y0485v1': {
      'en': '',
      'ar': '',
    },
    'ahgegi2m': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
