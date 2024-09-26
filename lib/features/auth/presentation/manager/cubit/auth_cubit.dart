import 'dart:developer';

import 'package:ai_tennis/features/auth/presentation/manager/state/auth_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> signUp(
      {required String emailAddress,
      required String password,
      required String name}) async {
    emit(SignUpLoading());

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((onValue) {
        var user = FirebaseAuth.instance.currentUser!;
        var userData =
            FirebaseFirestore.instance.collection('users').doc(user.uid);

        userData.set({
          'uid': user.uid,
          'name': name,
          'email': user.email,
        }, SetOptions(merge: true));

        emit(SignUpSuccess());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(SignUpError());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(SignUpError());
      } else {
        emit(SignUpError());
      }
    } catch (e) {
      print(e);
      emit(SignUpError());
    }
  }
}
