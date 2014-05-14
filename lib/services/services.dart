library services;

import "package:iris/remote/annotations.dart" as anno;
import "package:iris/remote/iris.dart";
import "package:iris/remote/error_code.dart";

import "../proto/messages.dart";

part "user_service.dart";
part "authentication_service.dart";



/**
 * Stub object
 */
class Session {

  bool loggedIn = true;

}


class Ctx extends Context {

  Session session;

  Ctx(req) : super(req);

}


Future<bool> authFilter(Ctx context) {
  return new Future.value(context.session.loggedIn);
}



class ErrorCode extends IrisErrorCode {

  static const INVALID_USERNAME_OR_PASSWORD = const ErrorCode._(0);

  static const INVALID_EMAIL = const ErrorCode._(1);

  static const NO_USER_SUBMITTED = const ErrorCode._(2);

  const ErrorCode._(int value) : super(value);

}



Future<Ctx> contextInitializer(IrisRequest req) {
  var context = new Ctx(req);

  // Load the session from memory cache instead of just setting stub object.
  context.session = new Session();

  return new Future.value(context);
}

