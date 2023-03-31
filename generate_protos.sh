protoc --proto_path=protos --dart_out=grpc:lib/protogen google/protobuf/empty.proto google/protobuf/timestamp.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/native-interaction/rubix-native.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/sky/sky_third_party.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/native-interaction/rubix-external.proto
