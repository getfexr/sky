///
//  Generated code. Do not modify.
//  source: sky.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sky.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'sky.pb.dart';

class SkyServiceClient extends $grpc.Client {
  static final _$host = $grpc.ClientMethod<$0.HostReq, $0.HostRes>(
      '/protos.SkyService/Host',
      ($0.HostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HostRes.fromBuffer(value));
  static final _$notification =
      $grpc.ClientMethod<$1.Empty, $0.NotificationRes>(
          '/protos.SkyService/Notification',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NotificationRes.fromBuffer(value));
  static final _$challenge =
      $grpc.ClientMethod<$0.ChallengeReq, $0.ChallengeRes>(
          '/protos.SkyService/Challenge',
          ($0.ChallengeReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ChallengeRes.fromBuffer(value));
  static final _$verify = $grpc.ClientMethod<$0.VerifyReq, $0.VerifyRes>(
      '/protos.SkyService/Verify',
      ($0.VerifyReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VerifyRes.fromBuffer(value));
  static final _$nativeInteraction =
      $grpc.ClientMethod<$0.NativeInteractionReq, $0.NativeInteractionRes>(
          '/protos.SkyService/NativeInteraction',
          ($0.NativeInteractionReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.NativeInteractionRes.fromBuffer(value));
  static final _$sync = $grpc.ClientMethod<$0.SyncReq, $0.SyncRes>(
      '/protos.SkyService/Sync',
      ($0.SyncReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SyncRes.fromBuffer(value));
  static final _$pay = $grpc.ClientMethod<$0.PayReq, $0.PayRes>(
      '/protos.SkyService/Pay',
      ($0.PayReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PayRes.fromBuffer(value));
  static final _$find = $grpc.ClientMethod<$0.FindReq, $0.FindRes>(
      '/protos.SkyService/Find',
      ($0.FindReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FindRes.fromBuffer(value));
  static final _$relay = $grpc.ClientMethod<$0.RelayReq, $0.RelayRes>(
      '/protos.SkyService/Relay',
      ($0.RelayReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RelayRes.fromBuffer(value));
  static final _$getUserInfo = $grpc.ClientMethod<$1.Empty, $0.GetUserInfoRes>(
      '/protos.SkyService/GetUserInfo',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserInfoRes.fromBuffer(value));

  SkyServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.HostRes> host($0.HostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$host, request, options: options);
  }

  $grpc.ResponseFuture<$0.NotificationRes> notification($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$notification, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChallengeRes> challenge($0.ChallengeReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$challenge, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyRes> verify($0.VerifyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verify, request, options: options);
  }

  $grpc.ResponseFuture<$0.NativeInteractionRes> nativeInteraction(
      $0.NativeInteractionReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$nativeInteraction, request, options: options);
  }

  $grpc.ResponseStream<$0.SyncRes> sync($0.SyncReq request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sync, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.PayRes> pay($async.Stream<$0.PayReq> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$pay, request, options: options);
  }

  $grpc.ResponseFuture<$0.FindRes> find($0.FindReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$find, request, options: options);
  }

  $grpc.ResponseFuture<$0.RelayRes> relay($0.RelayReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$relay, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserInfoRes> getUserInfo($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }
}

abstract class SkyServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.SkyService';

  SkyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.HostReq, $0.HostRes>(
        'Host',
        host_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HostReq.fromBuffer(value),
        ($0.HostRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.NotificationRes>(
        'Notification',
        notification_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.NotificationRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChallengeReq, $0.ChallengeRes>(
        'Challenge',
        challenge_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChallengeReq.fromBuffer(value),
        ($0.ChallengeRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyReq, $0.VerifyRes>(
        'Verify',
        verify_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyReq.fromBuffer(value),
        ($0.VerifyRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.NativeInteractionReq, $0.NativeInteractionRes>(
            'NativeInteraction',
            nativeInteraction_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.NativeInteractionReq.fromBuffer(value),
            ($0.NativeInteractionRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SyncReq, $0.SyncRes>(
        'Sync',
        sync_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SyncReq.fromBuffer(value),
        ($0.SyncRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PayReq, $0.PayRes>(
        'Pay',
        pay,
        true,
        true,
        ($core.List<$core.int> value) => $0.PayReq.fromBuffer(value),
        ($0.PayRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FindReq, $0.FindRes>(
        'Find',
        find_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FindReq.fromBuffer(value),
        ($0.FindRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RelayReq, $0.RelayRes>(
        'Relay',
        relay_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RelayReq.fromBuffer(value),
        ($0.RelayRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetUserInfoRes>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetUserInfoRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.HostRes> host_Pre(
      $grpc.ServiceCall call, $async.Future<$0.HostReq> request) async {
    return host(call, await request);
  }

  $async.Future<$0.NotificationRes> notification_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return notification(call, await request);
  }

  $async.Future<$0.ChallengeRes> challenge_Pre(
      $grpc.ServiceCall call, $async.Future<$0.ChallengeReq> request) async {
    return challenge(call, await request);
  }

  $async.Future<$0.VerifyRes> verify_Pre(
      $grpc.ServiceCall call, $async.Future<$0.VerifyReq> request) async {
    return verify(call, await request);
  }

  $async.Future<$0.NativeInteractionRes> nativeInteraction_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.NativeInteractionReq> request) async {
    return nativeInteraction(call, await request);
  }

  $async.Stream<$0.SyncRes> sync_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SyncReq> request) async* {
    yield* sync(call, await request);
  }

  $async.Future<$0.FindRes> find_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FindReq> request) async {
    return find(call, await request);
  }

  $async.Future<$0.RelayRes> relay_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RelayReq> request) async {
    return relay(call, await request);
  }

  $async.Future<$0.GetUserInfoRes> getUserInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getUserInfo(call, await request);
  }

  $async.Future<$0.HostRes> host($grpc.ServiceCall call, $0.HostReq request);
  $async.Future<$0.NotificationRes> notification(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.ChallengeRes> challenge(
      $grpc.ServiceCall call, $0.ChallengeReq request);
  $async.Future<$0.VerifyRes> verify(
      $grpc.ServiceCall call, $0.VerifyReq request);
  $async.Future<$0.NativeInteractionRes> nativeInteraction(
      $grpc.ServiceCall call, $0.NativeInteractionReq request);
  $async.Stream<$0.SyncRes> sync($grpc.ServiceCall call, $0.SyncReq request);
  $async.Stream<$0.PayRes> pay(
      $grpc.ServiceCall call, $async.Stream<$0.PayReq> request);
  $async.Future<$0.FindRes> find($grpc.ServiceCall call, $0.FindReq request);
  $async.Future<$0.RelayRes> relay($grpc.ServiceCall call, $0.RelayReq request);
  $async.Future<$0.GetUserInfoRes> getUserInfo(
      $grpc.ServiceCall call, $1.Empty request);
}
