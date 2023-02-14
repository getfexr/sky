///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateDIDReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDIDReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'didImage', protoName: 'didImage')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicShare', protoName: 'publicShare')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publicKey', protoName: 'publicKey')
    ..hasRequiredFields = false
  ;

  CreateDIDReq._() : super();
  factory CreateDIDReq({
    $core.String? didImage,
    $core.String? publicShare,
    $core.String? publicKey,
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
}

class CreateDIDRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDIDRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'did')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  CreateDIDRes._() : super();
  factory CreateDIDRes({
    $core.String? did,
    $core.bool? status,
  }) {
    final _result = create();
    if (did != null) {
      _result.did = did;
    }
    if (status != null) {
      _result.status = status;
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
}

class RequestTransactionPayloadReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTransactionPayloadReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenCount', $pb.PbFieldType.OD, protoName: 'tokenCount')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.O3)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKeyPass', protoName: 'privateKeyPass')
    ..hasRequiredFields = false
  ;

  RequestTransactionPayloadReq._() : super();
  factory RequestTransactionPayloadReq({
    $core.String? receiver,
    $core.double? tokenCount,
    $core.String? comment,
    $core.int? type,
    $core.String? privateKeyPass,
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
    if (privateKeyPass != null) {
      _result.privateKeyPass = privateKeyPass;
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

  @$pb.TagNumber(2)
  $core.double get tokenCount => $_getN(1);
  @$pb.TagNumber(2)
  set tokenCount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTokenCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTokenCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get type => $_getIZ(3);
  @$pb.TagNumber(4)
  set type($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get privateKeyPass => $_getSZ(4);
  @$pb.TagNumber(5)
  set privateKeyPass($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrivateKeyPass() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrivateKeyPass() => clearField(5);
}

class TxnSummary extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TxnSummary', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txnId', protoName: 'txnId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  TxnSummary._() : super();
  factory TxnSummary({
    $core.String? txnId,
    $core.String? sender,
    $core.String? receiver,
    $core.double? amount,
    $core.String? comment,
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
    return _result;
  }
  factory TxnSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxnSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxnSummary clone() => TxnSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxnSummary copyWith(void Function(TxnSummary) updates) => super.copyWith((message) => updates(message as TxnSummary)) as TxnSummary; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TxnSummary create() => TxnSummary._();
  TxnSummary createEmptyInstance() => create();
  static $pb.PbList<TxnSummary> createRepeated() => $pb.PbList<TxnSummary>();
  @$core.pragma('dart2js:noInline')
  static TxnSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxnSummary>(create);
  static TxnSummary? _defaultInstance;

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
}

class TransactionLastObject extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionLastObject', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  TransactionLastObject._() : super();
  factory TransactionLastObject({
    $core.String? hash,
    $core.String? token,
  }) {
    final _result = create();
    if (hash != null) {
      _result.hash = hash;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory TransactionLastObject.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionLastObject.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionLastObject clone() => TransactionLastObject()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionLastObject copyWith(void Function(TransactionLastObject) updates) => super.copyWith((message) => updates(message as TransactionLastObject)) as TransactionLastObject; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionLastObject create() => TransactionLastObject._();
  TransactionLastObject createEmptyInstance() => create();
  static $pb.PbList<TransactionLastObject> createRepeated() => $pb.PbList<TransactionLastObject>();
  @$core.pragma('dart2js:noInline')
  static TransactionLastObject getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionLastObject>(create);
  static TransactionLastObject? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);
}

class TransactionLastObjectSigned extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionLastObjectSigned', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'chainSign', protoName: 'chainSign')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..hasRequiredFields = false
  ;

  TransactionLastObjectSigned._() : super();
  factory TransactionLastObjectSigned({
    $core.String? chainSign,
    $core.String? hash,
    $core.String? token,
  }) {
    final _result = create();
    if (chainSign != null) {
      _result.chainSign = chainSign;
    }
    if (hash != null) {
      _result.hash = hash;
    }
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory TransactionLastObjectSigned.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionLastObjectSigned.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionLastObjectSigned clone() => TransactionLastObjectSigned()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionLastObjectSigned copyWith(void Function(TransactionLastObjectSigned) updates) => super.copyWith((message) => updates(message as TransactionLastObjectSigned)) as TransactionLastObjectSigned; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionLastObjectSigned create() => TransactionLastObjectSigned._();
  TransactionLastObjectSigned createEmptyInstance() => create();
  static $pb.PbList<TransactionLastObjectSigned> createRepeated() => $pb.PbList<TransactionLastObjectSigned>();
  @$core.pragma('dart2js:noInline')
  static TransactionLastObjectSigned getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionLastObjectSigned>(create);
  static TransactionLastObjectSigned? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainSign => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainSign($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainSign() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainSign() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get hash => $_getSZ(1);
  @$pb.TagNumber(2)
  set hash($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearHash() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get token => $_getSZ(2);
  @$pb.TagNumber(3)
  set token($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearToken() => clearField(3);
}

class SignedHash extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SignedHash', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hash')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sign')
    ..hasRequiredFields = false
  ;

  SignedHash._() : super();
  factory SignedHash({
    $core.String? hash,
    $core.String? sign,
  }) {
    final _result = create();
    if (hash != null) {
      _result.hash = hash;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory SignedHash.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignedHash.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignedHash clone() => SignedHash()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignedHash copyWith(void Function(SignedHash) updates) => super.copyWith((message) => updates(message as SignedHash)) as SignedHash; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SignedHash create() => SignedHash._();
  SignedHash createEmptyInstance() => create();
  static $pb.PbList<SignedHash> createRepeated() => $pb.PbList<SignedHash>();
  @$core.pragma('dart2js:noInline')
  static SignedHash getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignedHash>(create);
  static SignedHash? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sign => $_getSZ(1);
  @$pb.TagNumber(2)
  set sign($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSign() => $_has(1);
  @$pb.TagNumber(2)
  void clearSign() => clearField(2);
}

class PledgeDetail extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PledgeDetail', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueArr', protoName: 'valueArr')
    ..hasRequiredFields = false
  ;

  PledgeDetail._() : super();
  factory PledgeDetail({
    $core.Iterable<$core.String>? valueArr,
  }) {
    final _result = create();
    if (valueArr != null) {
      _result.valueArr.addAll(valueArr);
    }
    return _result;
  }
  factory PledgeDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PledgeDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PledgeDetail clone() => PledgeDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PledgeDetail copyWith(void Function(PledgeDetail) updates) => super.copyWith((message) => updates(message as PledgeDetail)) as PledgeDetail; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PledgeDetail create() => PledgeDetail._();
  PledgeDetail createEmptyInstance() => create();
  static $pb.PbList<PledgeDetail> createRepeated() => $pb.PbList<PledgeDetail>();
  @$core.pragma('dart2js:noInline')
  static PledgeDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PledgeDetail>(create);
  static PledgeDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get valueArr => $_getList(0);
}

class PledgeDetailSigned extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PledgeDetailSigned', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..pc<SignedHash>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'valueArr', $pb.PbFieldType.PM, protoName: 'valueArr', subBuilder: SignedHash.create)
    ..hasRequiredFields = false
  ;

  PledgeDetailSigned._() : super();
  factory PledgeDetailSigned({
    $core.Iterable<SignedHash>? valueArr,
  }) {
    final _result = create();
    if (valueArr != null) {
      _result.valueArr.addAll(valueArr);
    }
    return _result;
  }
  factory PledgeDetailSigned.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PledgeDetailSigned.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PledgeDetailSigned clone() => PledgeDetailSigned()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PledgeDetailSigned copyWith(void Function(PledgeDetailSigned) updates) => super.copyWith((message) => updates(message as PledgeDetailSigned)) as PledgeDetailSigned; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PledgeDetailSigned create() => PledgeDetailSigned._();
  PledgeDetailSigned createEmptyInstance() => create();
  static $pb.PbList<PledgeDetailSigned> createRepeated() => $pb.PbList<PledgeDetailSigned>();
  @$core.pragma('dart2js:noInline')
  static PledgeDetailSigned getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PledgeDetailSigned>(create);
  static PledgeDetailSigned? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<SignedHash> get valueArr => $_getList(0);
}

class RequestTransactionPayloadRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestTransactionPayloadRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authSenderByRecHash', protoName: 'authSenderByRecHash')
    ..pc<TransactionLastObject>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastObject', $pb.PbFieldType.PM, protoName: 'lastObject', subBuilder: TransactionLastObject.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderPayloadSign', protoName: 'senderPayloadSign')
    ..m<$core.String, PledgeDetail>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pledgeDetails', protoName: 'pledgeDetails', entryClassName: 'RequestTransactionPayloadRes.PledgeDetailsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: PledgeDetail.create, packageName: const $pb.PackageName('protos'))
    ..hasRequiredFields = false
  ;

  RequestTransactionPayloadRes._() : super();
  factory RequestTransactionPayloadRes({
    $core.String? authSenderByRecHash,
    $core.Iterable<TransactionLastObject>? lastObject,
    $core.String? senderPayloadSign,
    $core.Map<$core.String, PledgeDetail>? pledgeDetails,
  }) {
    final _result = create();
    if (authSenderByRecHash != null) {
      _result.authSenderByRecHash = authSenderByRecHash;
    }
    if (lastObject != null) {
      _result.lastObject.addAll(lastObject);
    }
    if (senderPayloadSign != null) {
      _result.senderPayloadSign = senderPayloadSign;
    }
    if (pledgeDetails != null) {
      _result.pledgeDetails.addAll(pledgeDetails);
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
  $core.String get authSenderByRecHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set authSenderByRecHash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthSenderByRecHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthSenderByRecHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TransactionLastObject> get lastObject => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get senderPayloadSign => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderPayloadSign($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSenderPayloadSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderPayloadSign() => clearField(3);

  @$pb.TagNumber(4)
  $core.Map<$core.String, PledgeDetail> get pledgeDetails => $_getMap(3);
}

class FinaliseTransactionPayload extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FinaliseTransactionPayload', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOM<SignedHash>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authSenderByRecHash', protoName: 'authSenderByRecHash', subBuilder: SignedHash.create)
    ..pc<TransactionLastObjectSigned>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastObject', $pb.PbFieldType.PM, protoName: 'lastObject', subBuilder: TransactionLastObjectSigned.create)
    ..aOM<SignedHash>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderPayloadSign', protoName: 'senderPayloadSign', subBuilder: SignedHash.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'privateKeyPass', protoName: 'privateKeyPass')
    ..m<$core.String, PledgeDetailSigned>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pledgeDetails', protoName: 'pledgeDetails', entryClassName: 'FinaliseTransactionPayload.PledgeDetailsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: PledgeDetailSigned.create, packageName: const $pb.PackageName('protos'))
    ..hasRequiredFields = false
  ;

  FinaliseTransactionPayload._() : super();
  factory FinaliseTransactionPayload({
    SignedHash? authSenderByRecHash,
    $core.Iterable<TransactionLastObjectSigned>? lastObject,
    SignedHash? senderPayloadSign,
    $core.String? privateKeyPass,
    $core.Map<$core.String, PledgeDetailSigned>? pledgeDetails,
  }) {
    final _result = create();
    if (authSenderByRecHash != null) {
      _result.authSenderByRecHash = authSenderByRecHash;
    }
    if (lastObject != null) {
      _result.lastObject.addAll(lastObject);
    }
    if (senderPayloadSign != null) {
      _result.senderPayloadSign = senderPayloadSign;
    }
    if (privateKeyPass != null) {
      _result.privateKeyPass = privateKeyPass;
    }
    if (pledgeDetails != null) {
      _result.pledgeDetails.addAll(pledgeDetails);
    }
    return _result;
  }
  factory FinaliseTransactionPayload.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FinaliseTransactionPayload.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FinaliseTransactionPayload clone() => FinaliseTransactionPayload()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FinaliseTransactionPayload copyWith(void Function(FinaliseTransactionPayload) updates) => super.copyWith((message) => updates(message as FinaliseTransactionPayload)) as FinaliseTransactionPayload; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FinaliseTransactionPayload create() => FinaliseTransactionPayload._();
  FinaliseTransactionPayload createEmptyInstance() => create();
  static $pb.PbList<FinaliseTransactionPayload> createRepeated() => $pb.PbList<FinaliseTransactionPayload>();
  @$core.pragma('dart2js:noInline')
  static FinaliseTransactionPayload getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FinaliseTransactionPayload>(create);
  static FinaliseTransactionPayload? _defaultInstance;

  @$pb.TagNumber(1)
  SignedHash get authSenderByRecHash => $_getN(0);
  @$pb.TagNumber(1)
  set authSenderByRecHash(SignedHash v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuthSenderByRecHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuthSenderByRecHash() => clearField(1);
  @$pb.TagNumber(1)
  SignedHash ensureAuthSenderByRecHash() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<TransactionLastObjectSigned> get lastObject => $_getList(1);

  @$pb.TagNumber(3)
  SignedHash get senderPayloadSign => $_getN(2);
  @$pb.TagNumber(3)
  set senderPayloadSign(SignedHash v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSenderPayloadSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderPayloadSign() => clearField(3);
  @$pb.TagNumber(3)
  SignedHash ensureSenderPayloadSign() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get privateKeyPass => $_getSZ(3);
  @$pb.TagNumber(4)
  set privateKeyPass($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrivateKeyPass() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrivateKeyPass() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, PledgeDetailSigned> get pledgeDetails => $_getMap(4);
}

class GetTransactionLogReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTransactionLogReq', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'count', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  GetTransactionLogReq._() : super();
  factory GetTransactionLogReq({
    $core.int? count,
  }) {
    final _result = create();
    if (count != null) {
      _result.count = count;
    }
    return _result;
  }
  factory GetTransactionLogReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionLogReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTransactionLogReq clone() => GetTransactionLogReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTransactionLogReq copyWith(void Function(GetTransactionLogReq) updates) => super.copyWith((message) => updates(message as GetTransactionLogReq)) as GetTransactionLogReq; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionLogReq create() => GetTransactionLogReq._();
  GetTransactionLogReq createEmptyInstance() => create();
  static $pb.PbList<GetTransactionLogReq> createRepeated() => $pb.PbList<GetTransactionLogReq>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionLogReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionLogReq>(create);
  static GetTransactionLogReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get count => $_getIZ(0);
  @$pb.TagNumber(1)
  set count($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class GetTransactionLogRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GetTransactionLogRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..pc<TxnSummary>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'txnLog', $pb.PbFieldType.PM, protoName: 'txnLog', subBuilder: TxnSummary.create)
    ..hasRequiredFields = false
  ;

  GetTransactionLogRes._() : super();
  factory GetTransactionLogRes({
    $core.Iterable<TxnSummary>? txnLog,
  }) {
    final _result = create();
    if (txnLog != null) {
      _result.txnLog.addAll(txnLog);
    }
    return _result;
  }
  factory GetTransactionLogRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionLogRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTransactionLogRes clone() => GetTransactionLogRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTransactionLogRes copyWith(void Function(GetTransactionLogRes) updates) => super.copyWith((message) => updates(message as GetTransactionLogRes)) as GetTransactionLogRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionLogRes create() => GetTransactionLogRes._();
  GetTransactionLogRes createEmptyInstance() => create();
  static $pb.PbList<GetTransactionLogRes> createRepeated() => $pb.PbList<GetTransactionLogRes>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionLogRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionLogRes>(create);
  static GetTransactionLogRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TxnSummary> get txnLog => $_getList(0);
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

