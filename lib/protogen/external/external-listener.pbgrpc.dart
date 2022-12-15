///
//  Generated code. Do not modify.
//  source: external/external-listener.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../google/protobuf/empty.pb.dart' as $0;
import 'external-listener.pb.dart' as $1;
export 'external-listener.pb.dart';

class ExternalListenerServiceClient extends $grpc.Client {
  static final _$streamAuthenticateRequest =
      $grpc.ClientMethod<$0.Empty, $1.Authenticate>(
          '/protos.ExternalListenerService/StreamAuthenticateRequest',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Authenticate.fromBuffer(value));

  ExternalListenerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$1.Authenticate> streamAuthenticateRequest(
      $0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamAuthenticateRequest, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ExternalListenerServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.ExternalListenerService';

  ExternalListenerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Authenticate>(
        'StreamAuthenticateRequest',
        streamAuthenticateRequest_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Authenticate value) => value.writeToBuffer()));
  }

  $async.Stream<$1.Authenticate> streamAuthenticateRequest_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* streamAuthenticateRequest(call, await request);
  }

  $async.Stream<$1.Authenticate> streamAuthenticateRequest(
      $grpc.ServiceCall call, $0.Empty request);
}
