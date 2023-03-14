///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'rubix-native.pb.dart' as $0;
import '../google/protobuf/empty.pb.dart' as $1;
export 'rubix-native.pb.dart';

class RubixServiceClient extends $grpc.Client {
  static final _$createDIDChallenge =
      $grpc.ClientMethod<$0.ChallengeReq, $0.ChallengeString>(
          '/protos.RubixService/CreateDIDChallenge',
          ($0.ChallengeReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ChallengeString.fromBuffer(value));
  static final _$createDID =
      $grpc.ClientMethod<$0.CreateDIDReq, $0.CreateDIDRes>(
          '/protos.RubixService/CreateDID',
          ($0.CreateDIDReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.CreateDIDRes.fromBuffer(value));
  static final _$initiateTransaction = $grpc.ClientMethod<
          $0.RequestTransactionPayloadReq, $0.RequestTransactionPayloadRes>(
      '/protos.RubixService/InitiateTransaction',
      ($0.RequestTransactionPayloadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RequestTransactionPayloadRes.fromBuffer(value));
  static final _$streamIncomingTxn =
      $grpc.ClientMethod<$1.Empty, $0.IncomingTxnDetails>(
          '/protos.RubixService/StreamIncomingTxn',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.IncomingTxnDetails.fromBuffer(value));
  static final _$signResponse = $grpc.ClientMethod<$0.HashSigned, $0.Status>(
      '/protos.RubixService/SignResponse',
      ($0.HashSigned value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Status.fromBuffer(value));
  static final _$generateRbt =
      $grpc.ClientMethod<$0.GenerateReq, $0.RequestTransactionPayloadRes>(
          '/protos.RubixService/GenerateRbt',
          ($0.GenerateReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.RequestTransactionPayloadRes.fromBuffer(value));
  static final _$getBalance = $grpc.ClientMethod<$1.Empty, $0.GetBalanceRes>(
      '/protos.RubixService/GetBalance',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBalanceRes.fromBuffer(value));
  static final _$getAccessTokenChallenge =
      $grpc.ClientMethod<$1.Empty, $0.ChallengeString>(
          '/protos.RubixService/GetAccessTokenChallenge',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ChallengeString.fromBuffer(value));
  static final _$generateAccessToken =
      $grpc.ClientMethod<$0.SignedPayload, $0.Token>(
          '/protos.RubixService/GenerateAccessToken',
          ($0.SignedPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Token.fromBuffer(value));

  RubixServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ChallengeString> createDIDChallenge(
      $0.ChallengeReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDIDChallenge, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateDIDRes> createDID($0.CreateDIDReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDID, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestTransactionPayloadRes> initiateTransaction(
      $0.RequestTransactionPayloadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initiateTransaction, request, options: options);
  }

  $grpc.ResponseStream<$0.IncomingTxnDetails> streamIncomingTxn(
      $1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamIncomingTxn, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Status> signResponse($0.HashSigned request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signResponse, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestTransactionPayloadRes> generateRbt(
      $0.GenerateReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateRbt, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBalanceRes> getBalance($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBalance, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChallengeString> getAccessTokenChallenge(
      $1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccessTokenChallenge, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.Token> generateAccessToken($0.SignedPayload request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$generateAccessToken, request, options: options);
  }
}

abstract class RubixServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.RubixService';

  RubixServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChallengeReq, $0.ChallengeString>(
        'CreateDIDChallenge',
        createDIDChallenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChallengeReq.fromBuffer(value),
        ($0.ChallengeString value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateDIDReq, $0.CreateDIDRes>(
        'CreateDID',
        createDID_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateDIDReq.fromBuffer(value),
        ($0.CreateDIDRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestTransactionPayloadReq,
            $0.RequestTransactionPayloadRes>(
        'InitiateTransaction',
        initiateTransaction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestTransactionPayloadReq.fromBuffer(value),
        ($0.RequestTransactionPayloadRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.IncomingTxnDetails>(
        'StreamIncomingTxn',
        streamIncomingTxn_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.IncomingTxnDetails value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HashSigned, $0.Status>(
        'SignResponse',
        signResponse_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HashSigned.fromBuffer(value),
        ($0.Status value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GenerateReq, $0.RequestTransactionPayloadRes>(
            'GenerateRbt',
            generateRbt_Pre,
            false,
            false,
            ($core.List<$core.int> value) => $0.GenerateReq.fromBuffer(value),
            ($0.RequestTransactionPayloadRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetBalanceRes>(
        'GetBalance',
        getBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetBalanceRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ChallengeString>(
        'GetAccessTokenChallenge',
        getAccessTokenChallenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ChallengeString value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignedPayload, $0.Token>(
        'GenerateAccessToken',
        generateAccessToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignedPayload.fromBuffer(value),
        ($0.Token value) => value.writeToBuffer()));
  }

  $async.Future<$0.ChallengeString> createDIDChallenge_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChallengeReq> request) async {
    return createDIDChallenge(call, await request);
  }

  $async.Future<$0.CreateDIDRes> createDID_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateDIDReq> request) async {
    return createDID(call, await request);
  }

  $async.Future<$0.RequestTransactionPayloadRes> initiateTransaction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RequestTransactionPayloadReq> request) async {
    return initiateTransaction(call, await request);
  }

  $async.Stream<$0.IncomingTxnDetails> streamIncomingTxn_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* streamIncomingTxn(call, await request);
  }

  $async.Future<$0.Status> signResponse_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HashSigned> request) async {
    return signResponse(call, await request);
  }

  $async.Future<$0.RequestTransactionPayloadRes> generateRbt_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GenerateReq> request) async {
    return generateRbt(call, await request);
  }

  $async.Future<$0.GetBalanceRes> getBalance_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getBalance(call, await request);
  }

  $async.Future<$0.ChallengeString> getAccessTokenChallenge_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAccessTokenChallenge(call, await request);
  }

  $async.Future<$0.Token> generateAccessToken_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignedPayload> request) async {
    return generateAccessToken(call, await request);
  }

  $async.Future<$0.ChallengeString> createDIDChallenge(
      $grpc.ServiceCall call, $0.ChallengeReq request);
  $async.Future<$0.CreateDIDRes> createDID(
      $grpc.ServiceCall call, $0.CreateDIDReq request);
  $async.Future<$0.RequestTransactionPayloadRes> initiateTransaction(
      $grpc.ServiceCall call, $0.RequestTransactionPayloadReq request);
  $async.Stream<$0.IncomingTxnDetails> streamIncomingTxn(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.Status> signResponse(
      $grpc.ServiceCall call, $0.HashSigned request);
  $async.Future<$0.RequestTransactionPayloadRes> generateRbt(
      $grpc.ServiceCall call, $0.GenerateReq request);
  $async.Future<$0.GetBalanceRes> getBalance(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.ChallengeString> getAccessTokenChallenge(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.Token> generateAccessToken(
      $grpc.ServiceCall call, $0.SignedPayload request);
}
