/**
 * This is an example of how a server would consume the remote services.
 */
import "dart:html";


/// Include the client for server communication
import "package:iris/client/browser_http_client.dart";

/// Including the services themselves
import "package:iris_example/client_services/services.dart";

/// Include the protocol buffer messages.
import "package:iris_example/client_services/proto/messages.dart";


Services services;

main() {

  // Create the HttpServiceClient so the services know how to connect.
  var client = new HttpIrisClient(Uri.parse("http://localhost:8088"));

  // Create the services with the client.
  services = new Services(client);

  // Enjoy.

  querySelector("#auth").onClick.listen((_) {
    var req = new AuthenticationRequest()
        ..email = "e@mail"
        ..password = "password";

    services.authenticationService.auth(req).then(print);
  });

}

