///
//  Generated code. Do not modify.
//  source: sky/sky_third_party.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'sky_third_party.pb.dart' as $0;
export 'sky_third_party.pb.dart';

class SkyThirdPartyServiceClient extends $grpc.Client {
  static final _$getQRInfo =
      $grpc.ClientMethod<$0.QRInfoRequest, $0.QRInfoResponse>(
          '/protos.SkyThirdPartyService/GetQRInfo',
          ($0.QRInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.QRInfoResponse.fromBuffer(value));

  SkyThirdPartyServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.QRInfoResponse> getQRInfo($0.QRInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQRInfo, request, options: options);
  }
}

abstract class SkyThirdPartyServiceBase extends $grpc.Service {
  $core.String get $name => 'protos.SkyThirdPartyService';

  SkyThirdPartyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.QRInfoRequest, $0.QRInfoResponse>(
        'GetQRInfo',
        getQRInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.QRInfoRequest.fromBuffer(value),
        ($0.QRInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.QRInfoResponse> getQRInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.QRInfoRequest> request) async {
    return getQRInfo(call, await request);
  }

  $async.Future<$0.QRInfoResponse> getQRInfo(
      $grpc.ServiceCall call, $0.QRInfoRequest request);
}
