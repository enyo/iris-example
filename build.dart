library build;

import 'package:exitlive_protobuf_builder/proto_builder.dart' as protobuf_builder;

import 'package:remote_services/builder/builder.dart' as remote_services;

import "lib/services/services.dart";
import "lib/service_definitions.dart";





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





const RS_TARGET = "lib/client_services";

const RS_PROTO_BUFFER_MESSAGES = "lib/proto/messages.dart";

const RS_SERVICES_DIR = "lib/services/";

buildRemoteServices(args) {
  remote_services.build(getServices(), RS_TARGET, RS_PROTO_BUFFER_MESSAGES, args: args, includePbMessages: true, servicesDirectory: RS_SERVICES_DIR, errorCodes: ErrorCode);
}



