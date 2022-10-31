///
//  Generated code. Do not modify.
//  source: sky.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

import 'sky.pbenum.dart';

export 'sky.pbenum.dart';

class HostReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HostReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signedOtp', protoName: 'signedOtp')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'otp')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'F0', protoName: 'F0')
    ..hasRequiredFields = false
  ;

  HostReq._() : super();
  factory HostReq({
    $core.String? signedOtp,
    $core.String? otp,
    $core.String? address,
    $core.String? f0,
  }) {
    final _result = create();
    if (signedOtp != null) {
      _result.signedOtp = signedOtp;
    }
    if (otp != null) {
      _result.otp = otp;
    }
    if (address != null) {
      _result.address = address;
    }
    if (f0 != null) {
      _result.f0 = f0;
    }
    return _result;
  }
  factory HostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostReq clone() => HostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostReq copyWith(void Function(HostReq) updates) => super.copyWith((message) => updates(message as HostReq)) as HostReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HostReq create() => HostReq._();
  HostReq createEmptyInstance() => create();
  static $pb.PbList<HostReq> createRepeated() => $pb.PbList<HostReq>();
  @$core.pragma('dart2js:noInline')
  static HostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostReq>(create);
  static HostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get signedOtp => $_getSZ(0);
  @$pb.TagNumber(1)
  set signedOtp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignedOtp() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedOtp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get otp => $_getSZ(1);
  @$pb.TagNumber(2)
  set otp($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOtp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get f0 => $_getSZ(3);
  @$pb.TagNumber(4)
  set f0($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasF0() => $_has(3);
  @$pb.TagNumber(4)
  void clearF0() => clearField(4);
}

class HostRes_AccessToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HostRes.AccessToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiry', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  HostRes_AccessToken._() : super();
  factory HostRes_AccessToken({
    $core.String? token,
    $2.Timestamp? expiry,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (expiry != null) {
      _result.expiry = expiry;
    }
    return _result;
  }
  factory HostRes_AccessToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostRes_AccessToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostRes_AccessToken clone() => HostRes_AccessToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostRes_AccessToken copyWith(void Function(HostRes_AccessToken) updates) => super.copyWith((message) => updates(message as HostRes_AccessToken)) as HostRes_AccessToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HostRes_AccessToken create() => HostRes_AccessToken._();
  HostRes_AccessToken createEmptyInstance() => create();
  static $pb.PbList<HostRes_AccessToken> createRepeated() => $pb.PbList<HostRes_AccessToken>();
  @$core.pragma('dart2js:noInline')
  static HostRes_AccessToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostRes_AccessToken>(create);
  static HostRes_AccessToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get expiry => $_getN(1);
  @$pb.TagNumber(2)
  set expiry($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiry() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiry() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureExpiry() => $_ensure(1);
}

class HostRes_RefreshToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HostRes.RefreshToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiry', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  HostRes_RefreshToken._() : super();
  factory HostRes_RefreshToken({
    $core.String? token,
    $2.Timestamp? expiry,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (expiry != null) {
      _result.expiry = expiry;
    }
    return _result;
  }
  factory HostRes_RefreshToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostRes_RefreshToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostRes_RefreshToken clone() => HostRes_RefreshToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostRes_RefreshToken copyWith(void Function(HostRes_RefreshToken) updates) => super.copyWith((message) => updates(message as HostRes_RefreshToken)) as HostRes_RefreshToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HostRes_RefreshToken create() => HostRes_RefreshToken._();
  HostRes_RefreshToken createEmptyInstance() => create();
  static $pb.PbList<HostRes_RefreshToken> createRepeated() => $pb.PbList<HostRes_RefreshToken>();
  @$core.pragma('dart2js:noInline')
  static HostRes_RefreshToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostRes_RefreshToken>(create);
  static HostRes_RefreshToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get expiry => $_getN(1);
  @$pb.TagNumber(2)
  set expiry($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiry() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiry() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureExpiry() => $_ensure(1);
}

class HostRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HostRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOM<HostRes_AccessToken>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken', protoName: 'accessToken', subBuilder: HostRes_AccessToken.create)
    ..aOM<HostRes_RefreshToken>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken', protoName: 'refreshToken', subBuilder: HostRes_RefreshToken.create)
    ..hasRequiredFields = false
  ;

  HostRes._() : super();
  factory HostRes({
    HostRes_AccessToken? accessToken,
    HostRes_RefreshToken? refreshToken,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    return _result;
  }
  factory HostRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostRes clone() => HostRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostRes copyWith(void Function(HostRes) updates) => super.copyWith((message) => updates(message as HostRes)) as HostRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HostRes create() => HostRes._();
  HostRes createEmptyInstance() => create();
  static $pb.PbList<HostRes> createRepeated() => $pb.PbList<HostRes>();
  @$core.pragma('dart2js:noInline')
  static HostRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostRes>(create);
  static HostRes? _defaultInstance;

  @$pb.TagNumber(1)
  HostRes_AccessToken get accessToken => $_getN(0);
  @$pb.TagNumber(1)
  set accessToken(HostRes_AccessToken v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);
  @$pb.TagNumber(1)
  HostRes_AccessToken ensureAccessToken() => $_ensure(0);

  @$pb.TagNumber(2)
  HostRes_RefreshToken get refreshToken => $_getN(1);
  @$pb.TagNumber(2)
  set refreshToken(HostRes_RefreshToken v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
  @$pb.TagNumber(2)
  HostRes_RefreshToken ensureRefreshToken() => $_ensure(1);
}

class NotificationRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NotificationRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..e<NotificationRes_type>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OE, defaultOrMaker: NotificationRes_type.transaction, valueOf: NotificationRes_type.valueOf, enumValues: NotificationRes_type.values)
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'time', subBuilder: $2.Timestamp.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bannerImage', protoName: 'bannerImage')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'headingText', protoName: 'headingText')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cta')
    ..hasRequiredFields = false
  ;

  NotificationRes._() : super();
  factory NotificationRes({
    NotificationRes_type? data,
    $2.Timestamp? time,
    $core.String? id,
    $core.String? from,
    $core.String? to,
    $core.double? amount,
    $core.String? message,
    $core.String? bannerImage,
    $core.String? headingText,
    $core.String? cta,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (time != null) {
      _result.time = time;
    }
    if (id != null) {
      _result.id = id;
    }
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (message != null) {
      _result.message = message;
    }
    if (bannerImage != null) {
      _result.bannerImage = bannerImage;
    }
    if (headingText != null) {
      _result.headingText = headingText;
    }
    if (cta != null) {
      _result.cta = cta;
    }
    return _result;
  }
  factory NotificationRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationRes clone() => NotificationRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationRes copyWith(void Function(NotificationRes) updates) => super.copyWith((message) => updates(message as NotificationRes)) as NotificationRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NotificationRes create() => NotificationRes._();
  NotificationRes createEmptyInstance() => create();
  static $pb.PbList<NotificationRes> createRepeated() => $pb.PbList<NotificationRes>();
  @$core.pragma('dart2js:noInline')
  static NotificationRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationRes>(create);
  static NotificationRes? _defaultInstance;

  @$pb.TagNumber(1)
  NotificationRes_type get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(NotificationRes_type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get time => $_getN(1);
  @$pb.TagNumber(2)
  set time($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTime() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureTime() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get from => $_getSZ(3);
  @$pb.TagNumber(4)
  set from($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get to => $_getSZ(4);
  @$pb.TagNumber(5)
  set to($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get amount => $_getN(5);
  @$pb.TagNumber(6)
  set amount($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAmount() => $_has(5);
  @$pb.TagNumber(6)
  void clearAmount() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get message => $_getSZ(6);
  @$pb.TagNumber(7)
  set message($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearMessage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get bannerImage => $_getSZ(7);
  @$pb.TagNumber(8)
  set bannerImage($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBannerImage() => $_has(7);
  @$pb.TagNumber(8)
  void clearBannerImage() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get headingText => $_getSZ(8);
  @$pb.TagNumber(9)
  set headingText($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHeadingText() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeadingText() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get cta => $_getSZ(9);
  @$pb.TagNumber(10)
  set cta($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCta() => $_has(9);
  @$pb.TagNumber(10)
  void clearCta() => clearField(10);
}

class ChallengeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChallengeReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..e<ChallengeReq_purposeType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purpose', $pb.PbFieldType.OE, defaultOrMaker: ChallengeReq_purposeType.pass, valueOf: ChallengeReq_purposeType.valueOf, enumValues: ChallengeReq_purposeType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'purposeMessage', protoName: 'purposeMessage')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiryIn', $pb.PbFieldType.O3, protoName: 'expiryIn')
    ..aOM<$2.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiryAt', protoName: 'expiryAt', subBuilder: $2.Timestamp.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authLink', protoName: 'authLink')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bannerImage', protoName: 'bannerImage')
    ..hasRequiredFields = false
  ;

  ChallengeReq._() : super();
  factory ChallengeReq({
    ChallengeReq_purposeType? purpose,
    $core.String? receiver,
    $core.String? purposeMessage,
    $core.String? permission,
    $core.int? expiryIn,
    $2.Timestamp? expiryAt,
    $core.String? authLink,
    $core.String? bannerImage,
  }) {
    final _result = create();
    if (purpose != null) {
      _result.purpose = purpose;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (purposeMessage != null) {
      _result.purposeMessage = purposeMessage;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    if (expiryIn != null) {
      _result.expiryIn = expiryIn;
    }
    if (expiryAt != null) {
      _result.expiryAt = expiryAt;
    }
    if (authLink != null) {
      _result.authLink = authLink;
    }
    if (bannerImage != null) {
      _result.bannerImage = bannerImage;
    }
    return _result;
  }
  factory ChallengeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChallengeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChallengeReq clone() => ChallengeReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChallengeReq copyWith(void Function(ChallengeReq) updates) => super.copyWith((message) => updates(message as ChallengeReq)) as ChallengeReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeReq create() => ChallengeReq._();
  ChallengeReq createEmptyInstance() => create();
  static $pb.PbList<ChallengeReq> createRepeated() => $pb.PbList<ChallengeReq>();
  @$core.pragma('dart2js:noInline')
  static ChallengeReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChallengeReq>(create);
  static ChallengeReq? _defaultInstance;

  @$pb.TagNumber(1)
  ChallengeReq_purposeType get purpose => $_getN(0);
  @$pb.TagNumber(1)
  set purpose(ChallengeReq_purposeType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPurpose() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurpose() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get purposeMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set purposeMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPurposeMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPurposeMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get permission => $_getSZ(3);
  @$pb.TagNumber(4)
  set permission($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermission() => $_has(3);
  @$pb.TagNumber(4)
  void clearPermission() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get expiryIn => $_getIZ(4);
  @$pb.TagNumber(5)
  set expiryIn($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpiryIn() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryIn() => clearField(5);

  @$pb.TagNumber(6)
  $2.Timestamp get expiryAt => $_getN(5);
  @$pb.TagNumber(6)
  set expiryAt($2.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasExpiryAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryAt() => clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureExpiryAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get authLink => $_getSZ(6);
  @$pb.TagNumber(7)
  set authLink($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAuthLink() => $_has(6);
  @$pb.TagNumber(7)
  void clearAuthLink() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get bannerImage => $_getSZ(7);
  @$pb.TagNumber(8)
  set bannerImage($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBannerImage() => $_has(7);
  @$pb.TagNumber(8)
  void clearBannerImage() => clearField(8);
}

class ChallengeRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChallengeRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challengePayload', protoName: 'challengePayload')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ok')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  ChallengeRes._() : super();
  factory ChallengeRes({
    $core.String? challengePayload,
    $core.bool? ok,
    $core.String? message,
  }) {
    final _result = create();
    if (challengePayload != null) {
      _result.challengePayload = challengePayload;
    }
    if (ok != null) {
      _result.ok = ok;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ChallengeRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChallengeRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChallengeRes clone() => ChallengeRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChallengeRes copyWith(void Function(ChallengeRes) updates) => super.copyWith((message) => updates(message as ChallengeRes)) as ChallengeRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeRes create() => ChallengeRes._();
  ChallengeRes createEmptyInstance() => create();
  static $pb.PbList<ChallengeRes> createRepeated() => $pb.PbList<ChallengeRes>();
  @$core.pragma('dart2js:noInline')
  static ChallengeRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChallengeRes>(create);
  static ChallengeRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challengePayload => $_getSZ(0);
  @$pb.TagNumber(1)
  set challengePayload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallengePayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallengePayload() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get ok => $_getBF(1);
  @$pb.TagNumber(2)
  set ok($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOk() => $_has(1);
  @$pb.TagNumber(2)
  void clearOk() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class VerifyReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challengePayload', protoName: 'challengePayload')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  VerifyReq._() : super();
  factory VerifyReq({
    $core.String? challengePayload,
    $core.String? address,
  }) {
    final _result = create();
    if (challengePayload != null) {
      _result.challengePayload = challengePayload;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory VerifyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyReq clone() => VerifyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyReq copyWith(void Function(VerifyReq) updates) => super.copyWith((message) => updates(message as VerifyReq)) as VerifyReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyReq create() => VerifyReq._();
  VerifyReq createEmptyInstance() => create();
  static $pb.PbList<VerifyReq> createRepeated() => $pb.PbList<VerifyReq>();
  @$core.pragma('dart2js:noInline')
  static VerifyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyReq>(create);
  static VerifyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challengePayload => $_getSZ(0);
  @$pb.TagNumber(1)
  set challengePayload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallengePayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallengePayload() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class VerifyRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'connected')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authPoint', protoName: 'authPoint')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authCode', $pb.PbFieldType.O3, protoName: 'authCode')
    ..hasRequiredFields = false
  ;

  VerifyRes._() : super();
  factory VerifyRes({
    $core.bool? connected,
    $core.String? authPoint,
    $core.int? authCode,
  }) {
    final _result = create();
    if (connected != null) {
      _result.connected = connected;
    }
    if (authPoint != null) {
      _result.authPoint = authPoint;
    }
    if (authCode != null) {
      _result.authCode = authCode;
    }
    return _result;
  }
  factory VerifyRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyRes clone() => VerifyRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyRes copyWith(void Function(VerifyRes) updates) => super.copyWith((message) => updates(message as VerifyRes)) as VerifyRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyRes create() => VerifyRes._();
  VerifyRes createEmptyInstance() => create();
  static $pb.PbList<VerifyRes> createRepeated() => $pb.PbList<VerifyRes>();
  @$core.pragma('dart2js:noInline')
  static VerifyRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyRes>(create);
  static VerifyRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get connected => $_getBF(0);
  @$pb.TagNumber(1)
  set connected($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnected() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnected() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get authPoint => $_getSZ(1);
  @$pb.TagNumber(2)
  set authPoint($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAuthPoint() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthPoint() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get authCode => $_getIZ(2);
  @$pb.TagNumber(3)
  set authCode($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthCode() => clearField(3);
}

class NativeInteractionReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NativeInteractionReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  NativeInteractionReq._() : super();
  factory NativeInteractionReq() => create();
  factory NativeInteractionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NativeInteractionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NativeInteractionReq clone() => NativeInteractionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NativeInteractionReq copyWith(void Function(NativeInteractionReq) updates) => super.copyWith((message) => updates(message as NativeInteractionReq)) as NativeInteractionReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NativeInteractionReq create() => NativeInteractionReq._();
  NativeInteractionReq createEmptyInstance() => create();
  static $pb.PbList<NativeInteractionReq> createRepeated() => $pb.PbList<NativeInteractionReq>();
  @$core.pragma('dart2js:noInline')
  static NativeInteractionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NativeInteractionReq>(create);
  static NativeInteractionReq? _defaultInstance;
}

class NativeInteractionRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NativeInteractionRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  NativeInteractionRes._() : super();
  factory NativeInteractionRes() => create();
  factory NativeInteractionRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NativeInteractionRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NativeInteractionRes clone() => NativeInteractionRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NativeInteractionRes copyWith(void Function(NativeInteractionRes) updates) => super.copyWith((message) => updates(message as NativeInteractionRes)) as NativeInteractionRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NativeInteractionRes create() => NativeInteractionRes._();
  NativeInteractionRes createEmptyInstance() => create();
  static $pb.PbList<NativeInteractionRes> createRepeated() => $pb.PbList<NativeInteractionRes>();
  @$core.pragma('dart2js:noInline')
  static NativeInteractionRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NativeInteractionRes>(create);
  static NativeInteractionRes? _defaultInstance;
}

class SyncReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  SyncReq._() : super();
  factory SyncReq({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory SyncReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncReq clone() => SyncReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncReq copyWith(void Function(SyncReq) updates) => super.copyWith((message) => updates(message as SyncReq)) as SyncReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncReq create() => SyncReq._();
  SyncReq createEmptyInstance() => create();
  static $pb.PbList<SyncReq> createRepeated() => $pb.PbList<SyncReq>();
  @$core.pragma('dart2js:noInline')
  static SyncReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncReq>(create);
  static SyncReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class SyncRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..pc<NotificationRes>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'notifications', $pb.PbFieldType.PM, subBuilder: NotificationRes.create)
    ..hasRequiredFields = false
  ;

  SyncRes._() : super();
  factory SyncRes({
    $core.Iterable<NotificationRes>? notifications,
  }) {
    final _result = create();
    if (notifications != null) {
      _result.notifications.addAll(notifications);
    }
    return _result;
  }
  factory SyncRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncRes clone() => SyncRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncRes copyWith(void Function(SyncRes) updates) => super.copyWith((message) => updates(message as SyncRes)) as SyncRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncRes create() => SyncRes._();
  SyncRes createEmptyInstance() => create();
  static $pb.PbList<SyncRes> createRepeated() => $pb.PbList<SyncRes>();
  @$core.pragma('dart2js:noInline')
  static SyncRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncRes>(create);
  static SyncRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NotificationRes> get notifications => $_getList(0);
}

class PayReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PayReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..e<PayReq_chain>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name', $pb.PbFieldType.OE, defaultOrMaker: PayReq_chain.Rubix, valueOf: PayReq_chain.valueOf, enumValues: PayReq_chain.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'validators')
    ..hasRequiredFields = false
  ;

  PayReq._() : super();
  factory PayReq({
    PayReq_chain? name,
    $core.String? receiver,
    $core.String? comment,
    $core.String? validators,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (validators != null) {
      _result.validators = validators;
    }
    return _result;
  }
  factory PayReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayReq clone() => PayReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayReq copyWith(void Function(PayReq) updates) => super.copyWith((message) => updates(message as PayReq)) as PayReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayReq create() => PayReq._();
  PayReq createEmptyInstance() => create();
  static $pb.PbList<PayReq> createRepeated() => $pb.PbList<PayReq>();
  @$core.pragma('dart2js:noInline')
  static PayReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayReq>(create);
  static PayReq? _defaultInstance;

  @$pb.TagNumber(1)
  PayReq_chain get name => $_getN(0);
  @$pb.TagNumber(1)
  set name(PayReq_chain v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get validators => $_getSZ(3);
  @$pb.TagNumber(4)
  set validators($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValidators() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidators() => clearField(4);
}

class PayRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PayRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusCode', $pb.PbFieldType.O3, protoName: 'statusCode')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statusMessage', protoName: 'statusMessage')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionID', protoName: 'transactionID')
    ..hasRequiredFields = false
  ;

  PayRes._() : super();
  factory PayRes({
    $core.bool? status,
    $core.int? statusCode,
    $core.String? statusMessage,
    $core.String? transactionID,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (statusCode != null) {
      _result.statusCode = statusCode;
    }
    if (statusMessage != null) {
      _result.statusMessage = statusMessage;
    }
    if (transactionID != null) {
      _result.transactionID = transactionID;
    }
    return _result;
  }
  factory PayRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PayRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PayRes clone() => PayRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PayRes copyWith(void Function(PayRes) updates) => super.copyWith((message) => updates(message as PayRes)) as PayRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PayRes create() => PayRes._();
  PayRes createEmptyInstance() => create();
  static $pb.PbList<PayRes> createRepeated() => $pb.PbList<PayRes>();
  @$core.pragma('dart2js:noInline')
  static PayRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PayRes>(create);
  static PayRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get statusMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set statusMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatusMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatusMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get transactionID => $_getSZ(3);
  @$pb.TagNumber(4)
  set transactionID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTransactionID() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionID() => clearField(4);
}

class GetUserInfoRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetUserInfoRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'f0')
    ..hasRequiredFields = false
  ;

  GetUserInfoRes._() : super();
  factory GetUserInfoRes({
    $core.String? address,
    $core.String? f0,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (f0 != null) {
      _result.f0 = f0;
    }
    return _result;
  }
  factory GetUserInfoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserInfoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserInfoRes clone() => GetUserInfoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserInfoRes copyWith(void Function(GetUserInfoRes) updates) => super.copyWith((message) => updates(message as GetUserInfoRes)) as GetUserInfoRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetUserInfoRes create() => GetUserInfoRes._();
  GetUserInfoRes createEmptyInstance() => create();
  static $pb.PbList<GetUserInfoRes> createRepeated() => $pb.PbList<GetUserInfoRes>();
  @$core.pragma('dart2js:noInline')
  static GetUserInfoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserInfoRes>(create);
  static GetUserInfoRes? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get f0 => $_getSZ(1);
  @$pb.TagNumber(3)
  set f0($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasF0() => $_has(1);
  @$pb.TagNumber(3)
  void clearF0() => clearField(3);
}

class FindReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FindReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..hasRequiredFields = false
  ;

  FindReq._() : super();
  factory FindReq({
    $core.String? address,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory FindReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindReq clone() => FindReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindReq copyWith(void Function(FindReq) updates) => super.copyWith((message) => updates(message as FindReq)) as FindReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FindReq create() => FindReq._();
  FindReq createEmptyInstance() => create();
  static $pb.PbList<FindReq> createRepeated() => $pb.PbList<FindReq>();
  @$core.pragma('dart2js:noInline')
  static FindReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindReq>(create);
  static FindReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class FindRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FindRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  FindRes._() : super();
  factory FindRes({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory FindRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindRes clone() => FindRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindRes copyWith(void Function(FindRes) updates) => super.copyWith((message) => updates(message as FindRes)) as FindRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FindRes create() => FindRes._();
  FindRes createEmptyInstance() => create();
  static $pb.PbList<FindRes> createRepeated() => $pb.PbList<FindRes>();
  @$core.pragma('dart2js:noInline')
  static FindRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindRes>(create);
  static FindRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class RelayReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RelayReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'noreply')
    ..hasRequiredFields = false
  ;

  RelayReq._() : super();
  factory RelayReq({
    $core.String? address,
    $core.bool? noreply,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (noreply != null) {
      _result.noreply = noreply;
    }
    return _result;
  }
  factory RelayReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RelayReq clone() => RelayReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RelayReq copyWith(void Function(RelayReq) updates) => super.copyWith((message) => updates(message as RelayReq)) as RelayReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelayReq create() => RelayReq._();
  RelayReq createEmptyInstance() => create();
  static $pb.PbList<RelayReq> createRepeated() => $pb.PbList<RelayReq>();
  @$core.pragma('dart2js:noInline')
  static RelayReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayReq>(create);
  static RelayReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get noreply => $_getBF(1);
  @$pb.TagNumber(2)
  set noreply($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNoreply() => $_has(1);
  @$pb.TagNumber(2)
  void clearNoreply() => clearField(2);
}

class RelayRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RelayRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  RelayRes._() : super();
  factory RelayRes({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory RelayRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RelayRes clone() => RelayRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RelayRes copyWith(void Function(RelayRes) updates) => super.copyWith((message) => updates(message as RelayRes)) as RelayRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RelayRes create() => RelayRes._();
  RelayRes createEmptyInstance() => create();
  static $pb.PbList<RelayRes> createRepeated() => $pb.PbList<RelayRes>();
  @$core.pragma('dart2js:noInline')
  static RelayRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayRes>(create);
  static RelayRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

