// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/messages.pigeon.dart',
    cppHeaderOut: 'windows/messages.g.h',
    cppSourceOut: 'windows/messages.g.cpp',
    cppOptions: CppOptions(namespace: 'bug_pigeon'),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)

class PigeonFirebaseApp {
  const PigeonFirebaseApp({
    required this.appName,
    required this.tenantId,
  });

  final String appName;
  final String? tenantId;
}

class PigeonActionCodeInfo {
  const PigeonActionCodeInfo({
    required this.operation,
    required this.data,
  });

  final ActionCodeInfoOperation operation;
  final PigeonActionCodeInfoData data;
}

/// The type of operation that generated the action code from calling
/// [checkActionCode].
enum ActionCodeInfoOperation {
  /// Unknown operation.
  unknown,

  /// Password reset code generated via [sendPasswordResetEmail].
  passwordReset,

  /// Email verification code generated via [User.sendEmailVerification].
  verifyEmail,

  /// Email change revocation code generated via [User.updateEmail].
  recoverEmail,

  /// Email sign in code generated via [sendSignInLinkToEmail].
  emailSignIn,

  /// Verify and change email code generated via [User.verifyBeforeUpdateEmail].
  verifyAndChangeEmail,

  /// Action code for reverting second factor addition.
  revertSecondFactorAddition,
}

class PigeonActionCodeInfoData {
  const PigeonActionCodeInfoData({
    this.email,
    this.previousEmail,
  });

  final String? email;
  final String? previousEmail;
}

@HostApi()
abstract class FirebaseAuthHostApi {
  @async
  PigeonActionCodeInfo checkActionCode(
    PigeonFirebaseApp app,
    String code,
  );

 
}

