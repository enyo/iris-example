library remote_services_server;


import "package:logging/logging.dart";

import "../lib/iris.dart";



main() {

  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord record) => print('${record.loggerName} (${record.level}): ${record.message}'));


  getIris().startServers();


}