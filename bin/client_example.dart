/**
 * This is an example of how a server would consume the remote services.
 */
library remote_services_client;

import "package:logging/logging.dart";

/// Include the client that communicates with the server
import "package:remote_services/server_http_client.dart";

/// Include the services themselves
import "../lib/client_services/services.dart";

/// Include the protocol buffer messages.
import "../lib/client_services/proto/messages.dart";



main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord record) => print('${record.loggerName} (${record.level}): ${record.message}'));


  // Create the HttpServiceClient so the services know how to connect.
  var client = new HttpServiceClient(Uri.parse("http://localhost:8088"));

  // Create the services with the client.
  var services = new Services(client);

  // Enjoy.

  var req = new AuthenticationRequest()
      ..email = "e@mail"
      ..password = "password";

  services.authenticationService.auth(req)
      .then((AuthenticationResponse res) {
        print("The server said auth was ${res.success}");
      });

}