library services;

import "package:remote_services/annotations.dart";
import "package:remote_services/remote_services.dart";

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







Future<MyFancyContext> contextInitializer(ServiceRequest req) {
  var context = new MyFancyContext(req);

  // Load the session from memory cache instead of just setting stub object.
  context.session = new Session();

  return new Future.value();
}

