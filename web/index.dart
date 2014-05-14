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


import "package:logging/logging.dart";
import "package:protobuf/protobuf.dart";


Services services;

main() {

  // See logging output
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord record) => print('(${record.level}): ${record.message}'));


  responseElement = document.querySelector("#response");


  // Create the HttpServiceClient so the services know how to connect.
  var client = new HttpIrisClient(Uri.parse("http://localhost:8088"));

  // Create the services with the client.
  services = new Services(client);

  // Enjoy.





  // Now setup the buttons to do some actual requests


  querySelector("#auth").onClick.listen((_) {
    var requestMessage = new AuthenticationRequest()
        ..email = "e@mail"
        ..password = "password";

    services.authenticationService.auth(requestMessage)
        .then(printResponse)
        .catchError(printError);
  });


  querySelector("#invalidProcedure").onClick.listen((_) {
    services.userService.invalidProcedure()
        .then(printResponse)
        .catchError(printError);
  });

}

Element responseElement;


printResponse(GeneratedMessage message) => _printString("The server resonded: ${message.toString()}");


printError(IrisException exception) => _printString(exception.toString());



_printString(String message) => responseElement.append(new ParagraphElement()..innerHtml = message);

