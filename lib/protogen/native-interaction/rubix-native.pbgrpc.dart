///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import '../google/protobuf/empty.pb.dart' as $0;
import 'rubix-native.pb.dart' as $1;
export 'rubix-native.pb.dart';

class RubixServiceClient extends $grpc.Client {
  static final _$createDIDChallenge =
      $grpc.ClientMethod<$0.Empty, $1.ChallengeString>(
          '/protos.RubixService/CreateDIDChallenge',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.ChallengeString.fromBuffer(value));
  static final _$createDID =
      $grpc.ClientMethod<$1.CreateDIDReq, $1.CreateDIDRes>(
          '/protos.RubixService/CreateDID',
          ($1.CreateDIDReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.CreateDIDRes.fromBuffer(value));
  static final _$initiateTransaction = $grpc.ClientMethod<
          $1.RequestTransactionPayloadReq, $1.RequestTransactionPayloadRes>(
      '/protos.RubixService/InitiateTransaction',
      ($1.RequestTransactionPayloadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $1.RequestTransactionPayloadRes.fromBuffer(value));
  static final _$signResponse = $grpc.ClientMethod<$1.HashSigned, $1.Status>(
      '/protos.RubixService/SignResponse',
      ($1.HashSigned value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Status.fromBuffer(value));
  static final _$generateRbt =
      $grpc.ClientMethod<$1.GenerateReq, $1.RequestTransactionPayloadRes>(
          '/protos.RubixService/GenerateRbt',
          ($1.GenerateReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.RequestTransactionPayloadRes.fromBuffer(value));

  RubixServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.ChallengeString> createDIDChallenge($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDIDChallenge, request, options: options);
  }

  $grpc.ResponseFuture<$1.CreateDIDRes> createDID($1.CreateDIDReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDID, request, options: options);
  }

  $grpc.ResponseFuture<$1.RequestTransactionPayloadRes> initiateTransaction(
      $1.RequestTransactionPayloadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initiateTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$1.Status> signResponse($1.HashSigned request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signResponse, request, options: options);
  }

  $grpc.ResponseFuture<$1.RequestTransactionPayloadRes> generateRbt(
      $1.GenerateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateRbt, request, options: options);
  }
}

abstract class RubixServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.RubixService';

  RubixServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.ChallengeString>(
        'CreateDIDChallenge',
        createDIDChallenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.ChallengeString value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateDIDReq, $1.CreateDIDRes>(
        'CreateDID',
        createDID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateDIDReq.fromBuffer(value),
        ($1.CreateDIDRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RequestTransactionPayloadReq,
            $1.RequestTransactionPayloadRes>(
        'InitiateTransaction',
        initiateTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.RequestTransactionPayloadReq.fromBuffer(value),
        ($1.RequestTransactionPayloadRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.HashSigned, $1.Status>(
        'SignResponse',
        signResponse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.HashSigned.fromBuffer(value),
        ($1.Status value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.GenerateReq, $1.RequestTransactionPayloadRes>(
            'GenerateRbt',
            generateRbt_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $1.GenerateReq.fromBuffer(value),
            ($1.RequestTransactionPayloadRes value) => value.writeToBuffer()));
  }

  $async.Future<$1.ChallengeString> createDIDChallenge_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return createDIDChallenge(call, await request);
  }

  $async.Future<$1.CreateDIDRes> createDID_Pre(
      $grpc.ServiceCall call, $async.Future<$1.CreateDIDReq> request) async {
    return createDID(call, await request);
  }

  $async.Future<$1.RequestTransactionPayloadRes> initiateTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.RequestTransactionPayloadReq> request) async {
    return initiateTransaction(call, await request);
  }

  $async.Future<$1.Status> signResponse_Pre(
      $grpc.ServiceCall call, $async.Future<$1.HashSigned> request) async {
    return signResponse(call, await request);
  }

  $async.Future<$1.RequestTransactionPayloadRes> generateRbt_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GenerateReq> request) async {
    return generateRbt(call, await request);
  }

  $async.Future<$1.ChallengeString> createDIDChallenge(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.CreateDIDRes> createDID(
      $grpc.ServiceCall call, $1.CreateDIDReq request);
  $async.Future<$1.RequestTransactionPayloadRes> initiateTransaction(
      $grpc.ServiceCall call, $1.RequestTransactionPayloadReq request);
  $async.Future<$1.Status> signResponse(
      $grpc.ServiceCall call, $1.HashSigned request);
  $async.Future<$1.RequestTransactionPayloadRes> generateRbt(
      $grpc.ServiceCall call, $1.GenerateReq request);
}
