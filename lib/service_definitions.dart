library services;

import "package:remote_services/remote_services.dart";

import "services/services.dart";


ServiceDefinitions getServices() {
  return new ServiceDefinitions(contextInitializer)
        ..addService(new UserService())
        ..addService(new AuthenticationService())
        ..addServer(new HttpServiceServer("localhost", 8088, allowOrigin: "http://127.0.0.1:3030"));
}
