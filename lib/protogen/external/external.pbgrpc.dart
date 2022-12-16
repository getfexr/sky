///
//  Generated code. Do not modify.
//  source: external/external.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../google/protobuf/empty.pb.dart' as $0;
import 'external.pb.dart' as $1;
export 'external.pb.dart';

class ExternalServiceClient extends $grpc.Client {
  static final _$authenticate =
      $grpc.ClientMethod<$0.Empty, $1.AuthenticateRes>(
          '/protos.ExternalService/Authenticate',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.AuthenticateRes.fromBuffer(value));
  static final _$transactionRequest = $grpc.ClientMethod<
          $1.RequestTransactionDetails, $1.RequestTransactionRes>(
      '/protos.ExternalService/TransactionRequest',
      ($1.RequestTransactionDetails value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.RequestTransactionRes.fromBuffer(value));

  ExternalServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.AuthenticateRes> authenticate($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticate, request, options: options);
  }

  $grpc.ResponseFuture<$1.RequestTransactionRes> transactionRequest(
      $1.RequestTransactionDetails request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$transactionRequest, request, options: options);
  }
}

abstract class ExternalServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.ExternalService';

  ExternalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.AuthenticateRes>(
        'Authenticate',
        authenticate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.AuthenticateRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestTransactionDetails,
            $1.RequestTransactionRes>(
        'TransactionRequest',
        transactionRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.RequestTransactionDetails.fromBuffer(value),
        ($1.RequestTransactionRes value) => value.writeToBuffer()));
  }

  $async.Future<$1.AuthenticateRes> authenticate_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return authenticate(call, await request);
  }

  $async.Future<$1.RequestTransactionRes> transactionRequest_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestTransactionDetails> request) async {
    return transactionRequest(call, await request);
  }

  $async.Future<$1.AuthenticateRes> authenticate(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.RequestTransactionRes> transactionRequest(
      $grpc.ServiceCall call, $1.RequestTransactionDetails request);
}
