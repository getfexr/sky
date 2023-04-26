///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $2;

class SignedPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedPayload', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'payload')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SignedPayload._() : super();
  factory SignedPayload({
    $core.String? payload,
    $core.List<$core.int>? signature,
  }) {
    final _result = create();
    if (payload != null) {
      _result.payload = payload;
    }
    if (signature != null) {
      _result.signature = signature;
    }
    return _result;
  }
  factory SignedPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedPayload clone() => SignedPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedPayload copyWith(void Function(SignedPayload) updates) => super.copyWith((message) => updates(message as SignedPayload)) as SignedPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedPayload create() => SignedPayload._();
  SignedPayload createEmptyInstance() => create();
  static $pb.PbList<SignedPayload> createRepeated() => $pb.PbList<SignedPayload>();
  @$core.pragma('dart2js:noInline')
  static SignedPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedPayload>(create);
  static SignedPayload? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payload => $_getSZ(0);
  @$pb.TagNumber(1)
  set payload($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get signature => $_getN(1);
  @$pb.TagNumber(2)
  set signature($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSignature() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignature() => clearField(2);
}

class ChallengeReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChallengeReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..hasRequiredFields = false
  ;

  ChallengeReq._() : super();
  factory ChallengeReq({
    $core.String? publicKey,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
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
  $core.String get publicKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);
}

class ChallengeString extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ChallengeString', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'challenge')
    ..hasRequiredFields = false
  ;

  ChallengeString._() : super();
  factory ChallengeString({
    $core.String? challenge,
  }) {
    final _result = create();
    if (challenge != null) {
      _result.challenge = challenge;
    }
    return _result;
  }
  factory ChallengeString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChallengeString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChallengeString clone() => ChallengeString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChallengeString copyWith(void Function(ChallengeString) updates) => super.copyWith((message) => updates(message as ChallengeString)) as ChallengeString; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ChallengeString create() => ChallengeString._();
  ChallengeString createEmptyInstance() => create();
  static $pb.PbList<ChallengeString> createRepeated() => $pb.PbList<ChallengeString>();
  @$core.pragma('dart2js:noInline')
  static ChallengeString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChallengeString>(create);
  static ChallengeString? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challenge => $_getSZ(0);
  @$pb.TagNumber(1)
  set challenge($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChallenge() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallenge() => clearField(1);
}

class Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Token', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken', protoName: 'accessToken')
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'expiry', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Token._() : super();
  factory Token({
    $core.String? accessToken,
    $2.Timestamp? expiry,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (expiry != null) {
      _result.expiry = expiry;
    }
    return _result;
  }
  factory Token.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Token clone() => Token()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Token copyWith(void Function(Token) updates) => super.copyWith((message) => updates(message as Token)) as Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

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

class CreateDIDReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDIDReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'didImage', protoName: 'didImage')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicShare', protoName: 'publicShare')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..aOM<SignedPayload>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ecdsaChallengeResponse', protoName: 'ecdsaChallengeResponse', subBuilder: SignedPayload.create)
    ..hasRequiredFields = false
  ;

  CreateDIDReq._() : super();
  factory CreateDIDReq({
    $core.String? didImage,
    $core.String? publicShare,
    $core.String? publicKey,
    SignedPayload? ecdsaChallengeResponse,
  }) {
    final _result = create();
    if (didImage != null) {
      _result.didImage = didImage;
    }
    if (publicShare != null) {
      _result.publicShare = publicShare;
    }
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (ecdsaChallengeResponse != null) {
      _result.ecdsaChallengeResponse = ecdsaChallengeResponse;
    }
    return _result;
  }
  factory CreateDIDReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDIDReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDIDReq clone() => CreateDIDReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDIDReq copyWith(void Function(CreateDIDReq) updates) => super.copyWith((message) => updates(message as CreateDIDReq)) as CreateDIDReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDIDReq create() => CreateDIDReq._();
  CreateDIDReq createEmptyInstance() => create();
  static $pb.PbList<CreateDIDReq> createRepeated() => $pb.PbList<CreateDIDReq>();
  @$core.pragma('dart2js:noInline')
  static CreateDIDReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDIDReq>(create);
  static CreateDIDReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get didImage => $_getSZ(0);
  @$pb.TagNumber(1)
  set didImage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDidImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearDidImage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get publicShare => $_getSZ(1);
  @$pb.TagNumber(2)
  set publicShare($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicShare() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicShare() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  SignedPayload get ecdsaChallengeResponse => $_getN(3);
  @$pb.TagNumber(4)
  set ecdsaChallengeResponse(SignedPayload v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEcdsaChallengeResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearEcdsaChallengeResponse() => clearField(4);
  @$pb.TagNumber(4)
  SignedPayload ensureEcdsaChallengeResponse() => $_ensure(3);
}

class CreateDIDRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDIDRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'did')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOM<Token>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken', protoName: 'accessToken', subBuilder: Token.create)
    ..hasRequiredFields = false
  ;

  CreateDIDRes._() : super();
  factory CreateDIDRes({
    $core.String? did,
    $core.bool? status,
    Token? accessToken,
  }) {
    final _result = create();
    if (did != null) {
      _result.did = did;
    }
    if (status != null) {
      _result.status = status;
    }
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    return _result;
  }
  factory CreateDIDRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDIDRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDIDRes clone() => CreateDIDRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDIDRes copyWith(void Function(CreateDIDRes) updates) => super.copyWith((message) => updates(message as CreateDIDRes)) as CreateDIDRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDIDRes create() => CreateDIDRes._();
  CreateDIDRes createEmptyInstance() => create();
  static $pb.PbList<CreateDIDRes> createRepeated() => $pb.PbList<CreateDIDRes>();
  @$core.pragma('dart2js:noInline')
  static CreateDIDRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDIDRes>(create);
  static CreateDIDRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get did => $_getSZ(0);
  @$pb.TagNumber(1)
  set did($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDid() => $_has(0);
  @$pb.TagNumber(1)
  void clearDid() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get status => $_getBF(1);
  @$pb.TagNumber(2)
  set status($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);

  @$pb.TagNumber(3)
  Token get accessToken => $_getN(2);
  @$pb.TagNumber(3)
  set accessToken(Token v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAccessToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearAccessToken() => clearField(3);
  @$pb.TagNumber(3)
  Token ensureAccessToken() => $_ensure(2);
}

class RequestTransactionPayloadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTransactionPayloadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenCount', $pb.PbFieldType.OD, protoName: 'tokenCount')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RequestTransactionPayloadReq._() : super();
  factory RequestTransactionPayloadReq({
    $core.String? receiver,
    $core.double? tokenCount,
    $core.String? comment,
    $core.int? type,
  }) {
    final _result = create();
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (tokenCount != null) {
      _result.tokenCount = tokenCount;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory RequestTransactionPayloadReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestTransactionPayloadReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestTransactionPayloadReq clone() => RequestTransactionPayloadReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestTransactionPayloadReq copyWith(void Function(RequestTransactionPayloadReq) updates) => super.copyWith((message) => updates(message as RequestTransactionPayloadReq)) as RequestTransactionPayloadReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestTransactionPayloadReq create() => RequestTransactionPayloadReq._();
  RequestTransactionPayloadReq createEmptyInstance() => create();
  static $pb.PbList<RequestTransactionPayloadReq> createRepeated() => $pb.PbList<RequestTransactionPayloadReq>();
  @$core.pragma('dart2js:noInline')
  static RequestTransactionPayloadReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestTransactionPayloadReq>(create);
  static RequestTransactionPayloadReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get receiver => $_getSZ(0);
  @$pb.TagNumber(1)
  set receiver($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReceiver() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiver() => clearField(1);

  @$pb.TagNumber(3)
  $core.double get tokenCount => $_getN(1);
  @$pb.TagNumber(3)
  set tokenCount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTokenCount() => $_has(1);
  @$pb.TagNumber(3)
  void clearTokenCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(5)
  set type($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);
}

class RequestTransactionPayloadRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTransactionPayloadRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestId', protoName: 'requestId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..hasRequiredFields = false
  ;

  RequestTransactionPayloadRes._() : super();
  factory RequestTransactionPayloadRes({
    $core.String? requestId,
    $core.String? hash,
  }) {
    final _result = create();
    if (requestId != null) {
      _result.requestId = requestId;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    return _result;
  }
  factory RequestTransactionPayloadRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestTransactionPayloadRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestTransactionPayloadRes clone() => RequestTransactionPayloadRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestTransactionPayloadRes copyWith(void Function(RequestTransactionPayloadRes) updates) => super.copyWith((message) => updates(message as RequestTransactionPayloadRes)) as RequestTransactionPayloadRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestTransactionPayloadRes create() => RequestTransactionPayloadRes._();
  RequestTransactionPayloadRes createEmptyInstance() => create();
  static $pb.PbList<RequestTransactionPayloadRes> createRepeated() => $pb.PbList<RequestTransactionPayloadRes>();
  @$core.pragma('dart2js:noInline')
  static RequestTransactionPayloadRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestTransactionPayloadRes>(create);
  static RequestTransactionPayloadRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get requestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hash => $_getSZ(1);
  @$pb.TagNumber(2)
  set hash($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);
}

class HashSigned extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HashSigned', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pvtSign', $pb.PbFieldType.OY, protoName: 'pvtSign')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imgSign', $pb.PbFieldType.OY, protoName: 'imgSign')
    ..hasRequiredFields = false
  ;

  HashSigned._() : super();
  factory HashSigned({
    $core.String? id,
    $core.List<$core.int>? pvtSign,
    $core.List<$core.int>? imgSign,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (pvtSign != null) {
      _result.pvtSign = pvtSign;
    }
    if (imgSign != null) {
      _result.imgSign = imgSign;
    }
    return _result;
  }
  factory HashSigned.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HashSigned.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HashSigned clone() => HashSigned()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HashSigned copyWith(void Function(HashSigned) updates) => super.copyWith((message) => updates(message as HashSigned)) as HashSigned; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HashSigned create() => HashSigned._();
  HashSigned createEmptyInstance() => create();
  static $pb.PbList<HashSigned> createRepeated() => $pb.PbList<HashSigned>();
  @$core.pragma('dart2js:noInline')
  static HashSigned getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HashSigned>(create);
  static HashSigned? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get pvtSign => $_getN(1);
  @$pb.TagNumber(2)
  set pvtSign($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPvtSign() => $_has(1);
  @$pb.TagNumber(2)
  void clearPvtSign() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get imgSign => $_getN(2);
  @$pb.TagNumber(3)
  set imgSign($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImgSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgSign() => clearField(3);
}

class Status extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Status', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  Status._() : super();
  factory Status({
    $core.bool? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory Status.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Status.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Status clone() => Status()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Status copyWith(void Function(Status) updates) => super.copyWith((message) => updates(message as Status)) as Status; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();
  @$core.pragma('dart2js:noInline')
  static Status getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class GenerateReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GenerateReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenCount', $pb.PbFieldType.OD, protoName: 'tokenCount')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'did')
    ..hasRequiredFields = false
  ;

  GenerateReq._() : super();
  factory GenerateReq({
    $core.double? tokenCount,
    $core.String? did,
  }) {
    final _result = create();
    if (tokenCount != null) {
      _result.tokenCount = tokenCount;
    }
    if (did != null) {
      _result.did = did;
    }
    return _result;
  }
  factory GenerateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateReq clone() => GenerateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateReq copyWith(void Function(GenerateReq) updates) => super.copyWith((message) => updates(message as GenerateReq)) as GenerateReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenerateReq create() => GenerateReq._();
  GenerateReq createEmptyInstance() => create();
  static $pb.PbList<GenerateReq> createRepeated() => $pb.PbList<GenerateReq>();
  @$core.pragma('dart2js:noInline')
  static GenerateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateReq>(create);
  static GenerateReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get tokenCount => $_getN(0);
  @$pb.TagNumber(1)
  set tokenCount($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTokenCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get did => $_getSZ(1);
  @$pb.TagNumber(2)
  set did($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDid() => $_has(1);
  @$pb.TagNumber(2)
  void clearDid() => clearField(2);
}

class GetBalanceRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetBalanceRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'balance', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  GetBalanceRes._() : super();
  factory GetBalanceRes({
    $core.double? balance,
  }) {
    final _result = create();
    if (balance != null) {
      _result.balance = balance;
    }
    return _result;
  }
  factory GetBalanceRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBalanceRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBalanceRes clone() => GetBalanceRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBalanceRes copyWith(void Function(GetBalanceRes) updates) => super.copyWith((message) => updates(message as GetBalanceRes)) as GetBalanceRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBalanceRes create() => GetBalanceRes._();
  GetBalanceRes createEmptyInstance() => create();
  static $pb.PbList<GetBalanceRes> createRepeated() => $pb.PbList<GetBalanceRes>();
  @$core.pragma('dart2js:noInline')
  static GetBalanceRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBalanceRes>(create);
  static GetBalanceRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get balance => $_getN(0);
  @$pb.TagNumber(1)
  set balance($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);
}

class IncomingTxnDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'IncomingTxnDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txnId', protoName: 'txnId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timestamp', subBuilder: $2.Timestamp.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tickerName', protoName: 'tickerName')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gas', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  IncomingTxnDetails._() : super();
  factory IncomingTxnDetails({
    $core.String? txnId,
    $core.String? sender,
    $core.String? receiver,
    $core.double? amount,
    $core.String? comment,
    $core.int? type,
    $2.Timestamp? timestamp,
    $core.String? tickerName,
    $core.double? gas,
  }) {
    final _result = create();
    if (txnId != null) {
      _result.txnId = txnId;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    if (receiver != null) {
      _result.receiver = receiver;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (type != null) {
      _result.type = type;
    }
    if (timestamp != null) {
      _result.timestamp = timestamp;
    }
    if (tickerName != null) {
      _result.tickerName = tickerName;
    }
    if (gas != null) {
      _result.gas = gas;
    }
    return _result;
  }
  factory IncomingTxnDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IncomingTxnDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IncomingTxnDetails clone() => IncomingTxnDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IncomingTxnDetails copyWith(void Function(IncomingTxnDetails) updates) => super.copyWith((message) => updates(message as IncomingTxnDetails)) as IncomingTxnDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static IncomingTxnDetails create() => IncomingTxnDetails._();
  IncomingTxnDetails createEmptyInstance() => create();
  static $pb.PbList<IncomingTxnDetails> createRepeated() => $pb.PbList<IncomingTxnDetails>();
  @$core.pragma('dart2js:noInline')
  static IncomingTxnDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncomingTxnDetails>(create);
  static IncomingTxnDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set txnId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxnId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sender => $_getSZ(1);
  @$pb.TagNumber(2)
  set sender($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSender() => $_has(1);
  @$pb.TagNumber(2)
  void clearSender() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get receiver => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiver($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get amount => $_getN(3);
  @$pb.TagNumber(4)
  set amount($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get comment => $_getSZ(4);
  @$pb.TagNumber(5)
  set comment($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasComment() => $_has(4);
  @$pb.TagNumber(5)
  void clearComment() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get type => $_getIZ(5);
  @$pb.TagNumber(6)
  set type($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get timestamp => $_getN(6);
  @$pb.TagNumber(7)
  set timestamp($2.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimestamp() => clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureTimestamp() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get tickerName => $_getSZ(7);
  @$pb.TagNumber(8)
  set tickerName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTickerName() => $_has(7);
  @$pb.TagNumber(8)
  void clearTickerName() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get gas => $_getN(8);
  @$pb.TagNumber(9)
  set gas($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasGas() => $_has(8);
  @$pb.TagNumber(9)
  void clearGas() => clearField(9);
}

class TransactionDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionId', protoName: 'transactionId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionType', protoName: 'transactionType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blockId', protoName: 'blockId')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderDID', protoName: 'senderDID')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiverDID', protoName: 'receiverDID')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTime', $pb.PbFieldType.OD, protoName: 'totalTime')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..aOM<$2.Timestamp>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateTime', protoName: 'dateTime', subBuilder: $2.Timestamp.create)
    ..aOB(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  TransactionDetails._() : super();
  factory TransactionDetails({
    $core.String? transactionId,
    $core.String? transactionType,
    $core.String? blockId,
    $core.int? mode,
    $core.String? senderDID,
    $core.String? receiverDID,
    $core.double? amount,
    $core.double? totalTime,
    $core.String? comment,
    $2.Timestamp? dateTime,
    $core.bool? status,
  }) {
    final _result = create();
    if (transactionId != null) {
      _result.transactionId = transactionId;
    }
    if (transactionType != null) {
      _result.transactionType = transactionType;
    }
    if (blockId != null) {
      _result.blockId = blockId;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (senderDID != null) {
      _result.senderDID = senderDID;
    }
    if (receiverDID != null) {
      _result.receiverDID = receiverDID;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (totalTime != null) {
      _result.totalTime = totalTime;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (dateTime != null) {
      _result.dateTime = dateTime;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory TransactionDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionDetails clone() => TransactionDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionDetails copyWith(void Function(TransactionDetails) updates) => super.copyWith((message) => updates(message as TransactionDetails)) as TransactionDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionDetails create() => TransactionDetails._();
  TransactionDetails createEmptyInstance() => create();
  static $pb.PbList<TransactionDetails> createRepeated() => $pb.PbList<TransactionDetails>();
  @$core.pragma('dart2js:noInline')
  static TransactionDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionDetails>(create);
  static TransactionDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get transactionType => $_getSZ(1);
  @$pb.TagNumber(2)
  set transactionType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransactionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransactionType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get blockId => $_getSZ(2);
  @$pb.TagNumber(3)
  set blockId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get mode => $_getIZ(3);
  @$pb.TagNumber(4)
  set mode($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearMode() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get senderDID => $_getSZ(4);
  @$pb.TagNumber(5)
  set senderDID($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSenderDID() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderDID() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get receiverDID => $_getSZ(5);
  @$pb.TagNumber(6)
  set receiverDID($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReceiverDID() => $_has(5);
  @$pb.TagNumber(6)
  void clearReceiverDID() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get amount => $_getN(6);
  @$pb.TagNumber(7)
  set amount($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearAmount() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalTime => $_getN(7);
  @$pb.TagNumber(8)
  set totalTime($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get comment => $_getSZ(8);
  @$pb.TagNumber(9)
  set comment($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasComment() => $_has(8);
  @$pb.TagNumber(9)
  void clearComment() => clearField(9);

  @$pb.TagNumber(10)
  $2.Timestamp get dateTime => $_getN(9);
  @$pb.TagNumber(10)
  set dateTime($2.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDateTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearDateTime() => clearField(10);
  @$pb.TagNumber(10)
  $2.Timestamp ensureDateTime() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.bool get status => $_getBF(10);
  @$pb.TagNumber(11)
  set status($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);
}

class TransactionHistory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionHistory', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..pc<TransactionDetails>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactions', $pb.PbFieldType.PM, subBuilder: TransactionDetails.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  TransactionHistory._() : super();
  factory TransactionHistory({
    $core.Iterable<TransactionDetails>? transactions,
    $core.String? error,
  }) {
    final _result = create();
    if (transactions != null) {
      _result.transactions.addAll(transactions);
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory TransactionHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionHistory clone() => TransactionHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionHistory copyWith(void Function(TransactionHistory) updates) => super.copyWith((message) => updates(message as TransactionHistory)) as TransactionHistory; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionHistory create() => TransactionHistory._();
  TransactionHistory createEmptyInstance() => create();
  static $pb.PbList<TransactionHistory> createRepeated() => $pb.PbList<TransactionHistory>();
  @$core.pragma('dart2js:noInline')
  static TransactionHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionHistory>(create);
  static TransactionHistory? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransactionDetails> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class OnChainAsset extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'OnChainAsset', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timsstamp')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'assetName', protoName: 'assetName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorName', protoName: 'creatorName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creatorDID', protoName: 'creatorDID')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'note')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chain')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..hasRequiredFields = false
  ;

  OnChainAsset._() : super();
  factory OnChainAsset({
    $core.String? timsstamp,
    $core.String? assetName,
    $core.String? creatorName,
    $core.String? creatorDID,
    $core.String? price,
    $core.String? note,
    $core.String? status,
    $core.String? hash,
    $core.String? chain,
    $core.String? url,
  }) {
    final _result = create();
    if (timsstamp != null) {
      _result.timsstamp = timsstamp;
    }
    if (assetName != null) {
      _result.assetName = assetName;
    }
    if (creatorName != null) {
      _result.creatorName = creatorName;
    }
    if (creatorDID != null) {
      _result.creatorDID = creatorDID;
    }
    if (price != null) {
      _result.price = price;
    }
    if (note != null) {
      _result.note = note;
    }
    if (status != null) {
      _result.status = status;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (chain != null) {
      _result.chain = chain;
    }
    if (url != null) {
      _result.url = url;
    }
    return _result;
  }
  factory OnChainAsset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OnChainAsset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OnChainAsset clone() => OnChainAsset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OnChainAsset copyWith(void Function(OnChainAsset) updates) => super.copyWith((message) => updates(message as OnChainAsset)) as OnChainAsset; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static OnChainAsset create() => OnChainAsset._();
  OnChainAsset createEmptyInstance() => create();
  static $pb.PbList<OnChainAsset> createRepeated() => $pb.PbList<OnChainAsset>();
  @$core.pragma('dart2js:noInline')
  static OnChainAsset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OnChainAsset>(create);
  static OnChainAsset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get timsstamp => $_getSZ(0);
  @$pb.TagNumber(1)
  set timsstamp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimsstamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimsstamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get assetName => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAssetName() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get creatorName => $_getSZ(2);
  @$pb.TagNumber(3)
  set creatorName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatorName() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatorName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get creatorDID => $_getSZ(3);
  @$pb.TagNumber(4)
  set creatorDID($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatorDID() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatorDID() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get price => $_getSZ(4);
  @$pb.TagNumber(5)
  set price($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get note => $_getSZ(5);
  @$pb.TagNumber(6)
  set note($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNote() => $_has(5);
  @$pb.TagNumber(6)
  void clearNote() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get hash => $_getSZ(7);
  @$pb.TagNumber(8)
  set hash($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearHash() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get chain => $_getSZ(8);
  @$pb.TagNumber(9)
  set chain($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasChain() => $_has(8);
  @$pb.TagNumber(9)
  void clearChain() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get url => $_getSZ(9);
  @$pb.TagNumber(10)
  set url($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasUrl() => $_has(9);
  @$pb.TagNumber(10)
  void clearUrl() => clearField(10);
}

class Assets extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Assets', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..pc<OnChainAsset>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'assets', $pb.PbFieldType.PM, subBuilder: OnChainAsset.create)
    ..hasRequiredFields = false
  ;

  Assets._() : super();
  factory Assets({
    $core.Iterable<OnChainAsset>? assets,
  }) {
    final _result = create();
    if (assets != null) {
      _result.assets.addAll(assets);
    }
    return _result;
  }
  factory Assets.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Assets.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Assets clone() => Assets()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Assets copyWith(void Function(Assets) updates) => super.copyWith((message) => updates(message as Assets)) as Assets; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Assets create() => Assets._();
  Assets createEmptyInstance() => create();
  static $pb.PbList<Assets> createRepeated() => $pb.PbList<Assets>();
  @$core.pragma('dart2js:noInline')
  static Assets getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Assets>(create);
  static Assets? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<OnChainAsset> get assets => $_getList(0);
}

