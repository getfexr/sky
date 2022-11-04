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
  static final _$finaliseTransaction =
      $grpc.ClientMethod<$0.FinaliseTransactionPayload, $0.TxnSummary>(
          '/protos.RubixService/FinaliseTransaction',
          ($0.FinaliseTransactionPayload value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TxnSummary.fromBuffer(value));
  static final _$getTransactionLog =
      $grpc.ClientMethod<$0.GetTransactionLogReq, $0.GetTransactionLogRes>(
          '/protos.RubixService/GetTransactionLog',
          ($0.GetTransactionLogReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetTransactionLogRes.fromBuffer(value));
  static final _$getBalance = $grpc.ClientMethod<$1.Empty, $0.GetBalanceRes>(
      '/protos.RubixService/GetBalance',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBalanceRes.fromBuffer(value));

  RubixServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateDIDRes> createDID($0.CreateDIDReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDID, request, options: options);
  }

  $grpc.ResponseFuture<$0.RequestTransactionPayloadRes> initiateTransaction(
      $0.RequestTransactionPayloadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$initiateTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.TxnSummary> finaliseTransaction(
      $0.FinaliseTransactionPayload request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$finaliseTransaction, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetTransactionLogRes> getTransactionLog(
      $0.GetTransactionLogReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransactionLog, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBalanceRes> getBalance($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBalance, request, options: options);
  }
}

abstract class RubixServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.RubixService';

  RubixServiceBase() {
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
    $addMethod(
        $grpc.ServiceMethod<$0.FinaliseTransactionPayload, $0.TxnSummary>(
            'FinaliseTransaction',
            finaliseTransaction_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.FinaliseTransactionPayload.fromBuffer(value),
            ($0.TxnSummary value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetTransactionLogReq, $0.GetTransactionLogRes>(
            'GetTransactionLog',
            getTransactionLog_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetTransactionLogReq.fromBuffer(value),
            ($0.GetTransactionLogRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetBalanceRes>(
        'GetBalance',
        getBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetBalanceRes value) => value.writeToBuffer()));
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

  $async.Future<$0.TxnSummary> finaliseTransaction_Pre($grpc.ServiceCall call,
      $async.Future<$0.FinaliseTransactionPayload> request) async {
    return finaliseTransaction(call, await request);
  }

  $async.Future<$0.GetTransactionLogRes> getTransactionLog_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetTransactionLogReq> request) async {
    return getTransactionLog(call, await request);
  }

  $async.Future<$0.GetBalanceRes> getBalance_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getBalance(call, await request);
  }

  $async.Future<$0.CreateDIDRes> createDID(
      $grpc.ServiceCall call, $0.CreateDIDReq request);
  $async.Future<$0.RequestTransactionPayloadRes> initiateTransaction(
      $grpc.ServiceCall call, $0.RequestTransactionPayloadReq request);
  $async.Future<$0.TxnSummary> finaliseTransaction(
      $grpc.ServiceCall call, $0.FinaliseTransactionPayload request);
  $async.Future<$0.GetTransactionLogRes> getTransactionLog(
      $grpc.ServiceCall call, $0.GetTransactionLogReq request);
  $async.Future<$0.GetBalanceRes> getBalance(
      $grpc.ServiceCall call, $1.Empty request);
}
