import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liveasy/utils/print_log.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  PhoneNumberCubit() : super(PhoneNumberInitial());

  Future<void> verifyPhoneNumber(String phoneNumber, {bool push = true}) async {
    emit(PhoneNumberLoading());
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91 $phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This is triggered when verification is completed automatically
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          printLog("Verification failed: ${e.message}");
          emit(PhoneNumberError(e.message ?? 'An unknown error occurred'));
        },
        codeSent: (String verificationId, int? resendToken) {
          printLog(
              "Verification code sent to $phoneNumber. Verification ID: $verificationId");
          emit(PhoneNumberSuccess(push: push, verificationId: verificationId));
          emit(PhoneNumberLoaded(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          printLog(
              "Auto retrieval timeout for verification ID: $verificationId");
          emit(PhoneNumberLoaded(verificationId));
        },
      );
    } catch (e) {
      printLog("Exception: $e");
      emit(PhoneNumberError(e.toString()));
    }
  }

  Future<void> signInWithPhoneNumber(
      String verificationId, String smsCode) async {
    emit(PhoneNumberLoading());
    try {
      // Logging for debugging
      printLog("Verification ID: $verificationId");
      printLog("SMS Code: $smsCode");

      // Creating credential
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // Attempting to sign in
      final res = await _firebaseAuth.signInWithCredential(credential);

      // Emitting success state with the result
      emit(VerifyNumberSuccess(res));
    } catch (e) {
      // Improved error handling with specific FirebaseAuthException handling
      if (e is FirebaseAuthException) {
        printLog("FirebaseAuthException: ${e.message}");
        emit(PhoneNumberError(e.message ?? 'An unknown error occurred.'));
      } else {
        printLog("Exception: $e");
        emit(PhoneNumberError(e.toString()));
      }
    }
  }
}
