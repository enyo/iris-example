library service_definitions;

import "package:iris/remote/iris.dart";

import "services/services.dart";


Iris getIris() {
  return new Iris(contextInitializer)
        ..addService(new UserService())
        ..addService(new AuthenticationService())
        ..addServer(new HttpIrisServer("localhost", 8088));
}
