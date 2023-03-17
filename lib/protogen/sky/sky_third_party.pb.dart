///
//  Generated code. Do not modify.
//  source: sky/sky_third_party.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class QRInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QRInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload')
    ..hasRequiredFields = false
  ;

  QRInfoRequest._() : super();
  factory QRInfoRequest({
    $core.String? payload,
  }) {
    final _result = create();
    if (payload != null) {
      _result.payload = payload;
    }
    return _result;
  }
  factory QRInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QRInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QRInfoRequest clone() => QRInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QRInfoRequest copyWith(void Function(QRInfoRequest) updates) => super.copyWith((message) => updates(message as QRInfoRequest)) as QRInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QRInfoRequest create() => QRInfoRequest._();
  QRInfoRequest createEmptyInstance() => create();
  static $pb.PbList<QRInfoRequest> createRepeated() => $pb.PbList<QRInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static QRInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QRInfoRequest>(create);
  static QRInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payload => $_getSZ(0);
  @$pb.TagNumber(1)
  set payload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
}

class QRInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QRInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purpose')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload')
    ..hasRequiredFields = false
  ;

  QRInfoResponse._() : super();
  factory QRInfoResponse({
    $core.String? purpose,
    $core.String? payload,
  }) {
    final _result = create();
    if (purpose != null) {
      _result.purpose = purpose;
    }
    if (payload != null) {
      _result.payload = payload;
    }
    return _result;
  }
  factory QRInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QRInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QRInfoResponse clone() => QRInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QRInfoResponse copyWith(void Function(QRInfoResponse) updates) => super.copyWith((message) => updates(message as QRInfoResponse)) as QRInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QRInfoResponse create() => QRInfoResponse._();
  QRInfoResponse createEmptyInstance() => create();
  static $pb.PbList<QRInfoResponse> createRepeated() => $pb.PbList<QRInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static QRInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QRInfoResponse>(create);
  static QRInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get purpose => $_getSZ(0);
  @$pb.TagNumber(1)
  set purpose($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPurpose() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurpose() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get payload => $_getSZ(1);
  @$pb.TagNumber(2)
  set payload($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayload() => clearField(2);
}

