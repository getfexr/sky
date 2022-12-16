protoc --proto_path=protos --dart_out=grpc:lib/protogen google/protobuf/empty.proto google/protobuf/timestamp.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/sky.proto 
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/native-interaction/rubix-native.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/external/external-listener.proto
protoc --proto_path=protos --dart_out=grpc:lib/protogen protos/external/external.proto 