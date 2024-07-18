part of 'phone_number_cubit.dart';

sealed class PhoneNumberState {}

final class PhoneNumberInitial extends PhoneNumberState {}

final class PhoneNumberLoading extends PhoneNumberState {}

final class PhoneNumberLoaded extends PhoneNumberState {
  final String response;

  PhoneNumberLoaded(this.response);
}

final class PhoneNumberSuccess extends PhoneNumberState {
  final String verificationId;
  final bool push;

  PhoneNumberSuccess({required this.verificationId, required this.push});
}

final class VerifyNumberSuccess extends PhoneNumberState {
  final UserCredential res;

  VerifyNumberSuccess(this.res);
}

final class PhoneNumberError extends PhoneNumberState {
  final String error;

  PhoneNumberError(this.error);
}
