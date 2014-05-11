library services;

import "package:remote_services/remote/annotations.dart";
import "package:remote_services/remote/remote_services.dart";
import "package:remote_services/remote/error_code.dart";

import "../proto/messages.dart";

part "user_service.dart";
part "authentication_service.dart";



/**
 * Stub object
 */
class Session {

  bool loggedIn = true;

}


class MyFancyContext extends Context {

  Session session;

  MyFancyContext(req) : super(req);

}


Future<bool> authFilter(MyFancyContext context) {
  return new Future.value(context.session.loggedIn);
}



class ErrorCode extends RemoteServicesErrorCode {

  static const INVALID_USERNAME_OR_PASSWORD = const ErrorCode._(0);

  static const INVALID_EMAIL = const ErrorCode._(1);

  const ErrorCode._(int value) : super(value);

}



Future<MyFancyContext> contextInitializer(ServiceRequest req) {
  var context = new MyFancyContext(req);

  // Load the session from memory cache instead of just setting stub object.
  context.session = new Session();

  return new Future.value(context);
}

