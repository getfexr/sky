///
//  Generated code. Do not modify.
//  source: sky/sky_third_party.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use qRInfoRequestDescriptor instead')
const QRInfoRequest$json = {
  '1': 'QRInfoRequest',
  '2': [
    {'1': 'payload', '3': 1, '4': 1, '5': 9, '10': 'payload'},
  ],
};

/// Descriptor for `QRInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qRInfoRequestDescriptor = $convert
    .base64Decode('Cg1RUkluZm9SZXF1ZXN0EhgKB3BheWxvYWQYASABKAlSB3BheWxvYWQ=');
@$core.Deprecated('Use qRInfoResponseDescriptor instead')
const QRInfoResponse$json = {
  '1': 'QRInfoResponse',
  '2': [
    {'1': 'purpose', '3': 1, '4': 1, '5': 9, '10': 'purpose'},
    {'1': 'payload', '3': 2, '4': 1, '5': 9, '10': 'payload'},
  ],
};

/// Descriptor for `QRInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qRInfoResponseDescriptor = $convert.base64Decode(
    'Cg5RUkluZm9SZXNwb25zZRIYCgdwdXJwb3NlGAEgASgJUgdwdXJwb3NlEhgKB3BheWxvYWQYAiABKAlSB3BheWxvYWQ=');
