///
//  Generated code. Do not modify.
//  source: external/external-listener.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TransactionDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'receiver')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokenCount', $pb.PbFieldType.OD, protoName: 'tokenCount')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  TransactionDetails._() : super();
  factory TransactionDetails({
    $core.String? receiver,
    $core.double? tokenCount,
    $core.String? comment,
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
}

class TransactionRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TransactionRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  TransactionRes._() : super();
  factory TransactionRes({
    $core.String? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory TransactionRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionRes clone() => TransactionRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionRes copyWith(void Function(TransactionRes) updates) => super.copyWith((message) => updates(message as TransactionRes)) as TransactionRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionRes create() => TransactionRes._();
  TransactionRes createEmptyInstance() => create();
  static $pb.PbList<TransactionRes> createRepeated() => $pb.PbList<TransactionRes>();
  @$core.pragma('dart2js:noInline')
  static TransactionRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionRes>(create);
  static TransactionRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

class Authenticate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Authenticate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'browserId', protoName: 'browserId')
    ..hasRequiredFields = false
  ;

  Authenticate._() : super();
  factory Authenticate({
    $core.String? browserId,
  }) {
    final _result = create();
    if (browserId != null) {
      _result.browserId = browserId;
    }
    return _result;
  }
  factory Authenticate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Authenticate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Authenticate clone() => Authenticate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Authenticate copyWith(void Function(Authenticate) updates) => super.copyWith((message) => updates(message as Authenticate)) as Authenticate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Authenticate create() => Authenticate._();
  Authenticate createEmptyInstance() => create();
  static $pb.PbList<Authenticate> createRepeated() => $pb.PbList<Authenticate>();
  @$core.pragma('dart2js:noInline')
  static Authenticate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Authenticate>(create);
  static Authenticate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get browserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set browserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBrowserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBrowserId() => clearField(1);
}

class ApproveBrowserRes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ApproveBrowserRes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'protos'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  ApproveBrowserRes._() : super();
  factory ApproveBrowserRes({
    $core.bool? status,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory ApproveBrowserRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveBrowserRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveBrowserRes clone() => ApproveBrowserRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveBrowserRes copyWith(void Function(ApproveBrowserRes) updates) => super.copyWith((message) => updates(message as ApproveBrowserRes)) as ApproveBrowserRes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ApproveBrowserRes create() => ApproveBrowserRes._();
  ApproveBrowserRes createEmptyInstance() => create();
  static $pb.PbList<ApproveBrowserRes> createRepeated() => $pb.PbList<ApproveBrowserRes>();
  @$core.pragma('dart2js:noInline')
  static ApproveBrowserRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveBrowserRes>(create);
  static ApproveBrowserRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get status => $_getBF(0);
  @$pb.TagNumber(1)
  set status($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);
}

