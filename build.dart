library build;

import 'package:exitlive_protobuf_builder/proto_builder.dart' as protobuf_builder;

import 'package:iris/builder/builder.dart' as iris_builder;

import "lib/services/services.dart";
import "lib/iris.dart";





void main(List<String> args) {

  buildProtobuf(args);

  buildRemoteServices(args);

}





/// The directory which contains the protobuffer templates for the project
/// Directories are specified relative to the root of the project
const PROTO_ROOT = "proto";

/// The directory to output the compiled protobuffer messages
const PROTO_OUT = "lib/proto";

/// The name of a manifest library for the compiled protobuffers which will be generated in the PROTO_OUT directory
const MANIFEST_LIB = "messages";

buildProtobuf(args) {
  protobuf_builder.build(PROTO_ROOT, PROTO_OUT, MANIFEST_LIB, args);
}





const IRIS_TARGET = "lib/client_services";

const IRIS_PROTO_BUFFER_MESSAGES = "lib/proto/messages.dart";

const IRIS_SERVICES_DIR = "lib/services/";

buildRemoteServices(args) {
  iris_builder.build(getIris(), IRIS_TARGET, IRIS_PROTO_BUFFER_MESSAGES, args: args, includePbMessages: true, servicesDirectory: IRIS_SERVICES_DIR, errorCodes: ErrorCode);
}



