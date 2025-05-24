import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @homeTitle.
  ///
  /// In ja, this message translates to:
  /// **'ホーム'**
  String get homeTitle;

  /// No description provided for @homeCoinBalance.
  ///
  /// In ja, this message translates to:
  /// **'コイン残高: {balance}'**
  String homeCoinBalance(Object balance);

  /// No description provided for @homeUserNotFound.
  ///
  /// In ja, this message translates to:
  /// **'ユーザー情報がありません'**
  String get homeUserNotFound;

  /// No description provided for @taskListTitle.
  ///
  /// In ja, this message translates to:
  /// **'タスク一覧'**
  String get taskListTitle;

  /// No description provided for @taskListEmpty.
  ///
  /// In ja, this message translates to:
  /// **'タスクがありません'**
  String get taskListEmpty;

  /// No description provided for @taskCreateTitle.
  ///
  /// In ja, this message translates to:
  /// **'新しいタスク'**
  String get taskCreateTitle;

  /// No description provided for @taskDetailTitle.
  ///
  /// In ja, this message translates to:
  /// **'タスク詳細'**
  String get taskDetailTitle;

  /// No description provided for @taskNameRequired.
  ///
  /// In ja, this message translates to:
  /// **'タスク名は必須項目です。'**
  String get taskNameRequired;

  /// No description provided for @taskEarnCoinRequired.
  ///
  /// In ja, this message translates to:
  /// **'付与コインは必須項目です。'**
  String get taskEarnCoinRequired;

  /// No description provided for @taskEarnCoinMustBeNumber.
  ///
  /// In ja, this message translates to:
  /// **'付与コインは数値で入力してください。'**
  String get taskEarnCoinMustBeNumber;

  /// No description provided for @taskDifficultyRequired.
  ///
  /// In ja, this message translates to:
  /// **'難易度は必須項目です。'**
  String get taskDifficultyRequired;

  /// No description provided for @taskDifficultyMustBeNumber.
  ///
  /// In ja, this message translates to:
  /// **'難易度は数値で入力してください。'**
  String get taskDifficultyMustBeNumber;

  /// No description provided for @taskName.
  ///
  /// In ja, this message translates to:
  /// **'タスク名'**
  String get taskName;

  /// No description provided for @taskEarnCoin.
  ///
  /// In ja, this message translates to:
  /// **'付与コイン'**
  String get taskEarnCoin;

  /// No description provided for @taskDescription.
  ///
  /// In ja, this message translates to:
  /// **'説明'**
  String get taskDescription;

  /// No description provided for @taskDifficulty.
  ///
  /// In ja, this message translates to:
  /// **'難易度'**
  String get taskDifficulty;

  /// No description provided for @wishitemListTitle.
  ///
  /// In ja, this message translates to:
  /// **'ほしいもの一覧'**
  String get wishitemListTitle;

  /// No description provided for @wishitemListEmpty.
  ///
  /// In ja, this message translates to:
  /// **'ほしいものはありません'**
  String get wishitemListEmpty;

  /// No description provided for @wishitemCreateTitle.
  ///
  /// In ja, this message translates to:
  /// **'新しいほしいもの'**
  String get wishitemCreateTitle;

  /// No description provided for @wishitemDetailTitle.
  ///
  /// In ja, this message translates to:
  /// **'ほしいもの詳細'**
  String get wishitemDetailTitle;

  /// No description provided for @error.
  ///
  /// In ja, this message translates to:
  /// **'エラーが発生しました! : {errorMessage}'**
  String error(Object errorMessage);
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
