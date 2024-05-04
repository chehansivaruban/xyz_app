import '../config.dart';
import '../domain/core/failure.dart';
import '../domain/core/value_failure.dart';

extension ValueFailureX on ValueFailure {
  String toErrorString() {
    return when(
      core: (core) => core.when(
        empty: (_) => ".generalEmptyFields",
        invalidAmount: (_) => "localizations.popupTextPaymentAmountError",
        invalidMobile: (_) => " localizations.generalInvalidNumbe",
        invalidOTP: (_) => "localizations.popupTextloginvalidOtp",
        invalidEmail: (_) => "localizations.generalInvalidEmail",
      ),
      // inviteFriends: (inviteFriends) => inviteFriends.when(
      //   invalidPromoCode: (_) => localizations.promoCodeFailure,
      // ),
      // reload: (reload) => reload.when(
      //     emptyVoucherPIN: (_) => localizations.generalEmptyPin,
      //     invalidLengthVoucherPIN: (_) =>
      //         localizations.popupTextRechargePinInvalidLength),
      // myProfile: (myProfile) => myProfile.when(
      //   invalidName: (_) => localizations.myProfileInvalidName,
      // ),
      // giveFeedback: (giveFeedback) => giveFeedback.when(
      //   invalidRating: () => localizations.popupTextRatingSelectValue,
      // ),
      // savedCard: (savedCard) => savedCard.when(
      //   invalidExpiredDate: () =>
      //       'Invalid Expired Date', // TODO : Add Localization
      // ),
    );
  }
}

extension FailureX on Failure {
  String toErrorString() {
    return when(
      core: (coreFailure) => coreFailure.when(
        serverError: (message) => message,
        permissionDenied: () => 'localizations.permissionDenied',
        unexpected: () => Config.isDebugMode
            ? 'Unexpected Error' // No localization
            : 'localizations.messagesTimeout',
        // invalidAmount: () => localizations.popupTextPaymentAmountError,
        invalidMobileNumber: () => ' localizations.popupTextloginInvalidMobile',
        somethingWentWrong: (e) =>
            Config.isDebugMode ? e.toString() : 'localizations.messagesTimeout',
        ignoreWarning: () => '',
        cannotLaunchURL: () => Config.isDebugMode
            ? 'Cannot launch URL' // No localization
            : 'localizations.messagesTimeout',
        // myBillOpenError: (ResultType resultType) {
        //   switch (resultType) {
        //     case ResultType.noAppToOpen:
        //       return localizations.myBillOpenNoApp;
        //     default:
        //       return localizations.myBillOpenError;
        //   }
        // }, // TODO : Change message
      ),
      // payment: (paymentFailure) => paymentFailure.when(
      //   validationError: (error) => error,
      //   paymentError: (error) => error,
      // ),
      // shareCredit: (shareCreditFailure) => shareCreditFailure.when(
      //   invalidAmount: () => localizations.shareCreditAmountErrorDecimal,
      //   maxAmount: () => localizations.shareCreditShearCreditMaxamount,
      //   minAmount: () => localizations.shareCreditAmountErrorDecimal,
      //   sameMobile: () => localizations.shareCreditSameMobileError,
      // ),
      storage: (storageFailure) => storageFailure.when(
        notFound: () => 'localizations.dataNotFound',
        unableToUpdate: () => 'localizations.dataUnableToUpdate',
        unableToCreate: () => 'localizations.dataUnableToCreate',
        unableToDelete: () => 'localizations.dataUnableToDelete',
      ),
      // reload: (reloadFailure) => reloadFailure.when(
      //   emptyPIN: () => localizations.generalEmptyPin,
      //   invalidLengthVoucherPIN: () =>
      //       localizations.popupTextRechargePinInvalidLength,
      //   expiredVoucherPIN: () =>
      //       "The recharge card doesn't exist", // TODO : Add localization
      // ),
      // giveFeedback: (giveFeedbackFailure) => giveFeedbackFailure.when(
      //   invalidRating: () => localizations.popupTextRatingSelectValue,
      // ),
      network: (networkFailure) => networkFailure.when(
        timeout: () => 'localizations.messagesTimeout',
        noInternet: () => "sa",
      ),
      // deepLink: (deepLinkFailure) => deepLinkFailure.when(
      //   uriNotFound: () => 'URI not found', // TODO : Add Localization
      //   unsupportedDevice: () => 'Device is not supported',
      // ),
      // profile: (myProfilefailure) => myProfilefailure.when(
      //   fbConnectionError: () => localizations.popupTextMyprofileFbLoginFailed,
      //   fbSyncError: () => localizations.popupTextMyprofileFbSyncFailed,
      //   profileImageUpdateError: () =>
      //       localizations.popupTextMyprofileImgUpError,
      //   fbDisconnectError: () => localizations.popupTextMyprofileStopFbSyncFail,
      // ),
      authentication: (failure) => 'localizations.generalAutoLogout',
    );
  }
}
