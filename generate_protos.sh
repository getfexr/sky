protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/sky.proto google/protobuf/empty.proto google/protobuf/timestamp.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/native-interaction/rubix-native.proto google/protobuf/empty.proto google/protobuf/timestamp.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/external/external-listener.proto google/protobuf/empty.proto 
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/external/external.proto google/protobuf/empty.proto 