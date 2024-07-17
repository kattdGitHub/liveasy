import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_number_state.dart';

class PhoneNumberCubit extends Cubit<PhoneNumberState> {
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  PhoneNumberCubit() : super(PhoneNumberInitial());

  Future<void> verifyPhoneNumber(String phoneNumber,{bool push=true}) async {
    emit(PhoneNumberLoading());
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91 $phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          // This is triggered when verification is completed automatically
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(PhoneNumberError(e.message ?? 'An unknown error occurred'));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(PhoneNumberSuccess(push: push,verificationId: verificationId));
          emit(PhoneNumberLoaded(verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(PhoneNumberLoaded(verificationId));
        },
      );
    } catch (e) {
      emit(PhoneNumberError(e.toString()));
    }
  }

  Future<void> signInWithPhoneNumber(String verificationId, String smsCode) async {
    emit(PhoneNumberLoading());
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

    final res=  await _firebaseAuth.signInWithCredential(credential);
      emit(VerifyNumberSuccess(res));
    } catch (e) {
      emit(PhoneNumberError(e.toString()));
    }
  }
}
