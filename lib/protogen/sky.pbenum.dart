///
//  Generated code. Do not modify.
//  source: sky.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NotificationRes_type extends $pb.ProtobufEnum {
  static const NotificationRes_type transaction = NotificationRes_type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'transaction');
  static const NotificationRes_type promotion = NotificationRes_type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'promotion');

  static const $core.List<NotificationRes_type> values = <NotificationRes_type> [
    transaction,
    promotion,
  ];

  static final $core.Map<$core.int, NotificationRes_type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NotificationRes_type? valueOf($core.int value) => _byValue[value];

  const NotificationRes_type._($core.int v, $core.String n) : super(v, n);
}

class ChallengeReq_purposeType extends $pb.ProtobufEnum {
  static const ChallengeReq_purposeType pass = ChallengeReq_purposeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pass');
  static const ChallengeReq_purposeType transaction = ChallengeReq_purposeType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'transaction');
  static const ChallengeReq_purposeType subscription = ChallengeReq_purposeType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'subscription');

  static const $core.List<ChallengeReq_purposeType> values = <ChallengeReq_purposeType> [
    pass,
    transaction,
    subscription,
  ];

  static final $core.Map<$core.int, ChallengeReq_purposeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChallengeReq_purposeType? valueOf($core.int value) => _byValue[value];

  const ChallengeReq_purposeType._($core.int v, $core.String n) : super(v, n);
}

class PayReq_chain extends $pb.ProtobufEnum {
  static const PayReq_chain Rubix = PayReq_chain._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Rubix');

  static const $core.List<PayReq_chain> values = <PayReq_chain> [
    Rubix,
  ];

  static final $core.Map<$core.int, PayReq_chain> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PayReq_chain? valueOf($core.int value) => _byValue[value];

  const PayReq_chain._($core.int v, $core.String n) : super(v, n);
}

