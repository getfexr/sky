///
//  Generated code. Do not modify.
//  source: external/external-listener.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use transactionDetailsDescriptor instead')
const TransactionDetails$json = const {
  '1': 'TransactionDetails',
  '2': const [
    const {'1': 'receiver', '3': 1, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'tokenCount', '3': 2, '4': 1, '5': 1, '10': 'tokenCount'},
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `TransactionDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDetailsDescriptor = $convert.base64Decode('ChJUcmFuc2FjdGlvbkRldGFpbHMSGgoIcmVjZWl2ZXIYASABKAlSCHJlY2VpdmVyEh4KCnRva2VuQ291bnQYAiABKAFSCnRva2VuQ291bnQSGAoHY29tbWVudBgDIAEoCVIHY29tbWVudA==');
@$core.Deprecated('Use transactionResDescriptor instead')
const TransactionRes$json = const {
  '1': 'TransactionRes',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `TransactionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionResDescriptor = $convert.base64Decode('Cg5UcmFuc2FjdGlvblJlcxIWCgZzdGF0dXMYASABKAlSBnN0YXR1cw==');
@$core.Deprecated('Use authenticateDescriptor instead')
const Authenticate$json = const {
  '1': 'Authenticate',
  '2': const [
    const {'1': 'browserId', '3': 1, '4': 1, '5': 9, '10': 'browserId'},
    const {'1': 'signedBrowserId', '3': 2, '4': 1, '5': 9, '10': 'signedBrowserId'},
  ],
};

/// Descriptor for `Authenticate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authenticateDescriptor = $convert.base64Decode('CgxBdXRoZW50aWNhdGUSHAoJYnJvd3NlcklkGAEgASgJUglicm93c2VySWQSKAoPc2lnbmVkQnJvd3NlcklkGAIgASgJUg9zaWduZWRCcm93c2VySWQ=');
@$core.Deprecated('Use approveBrowserResDescriptor instead')
const ApproveBrowserRes$json = const {
  '1': 'ApproveBrowserRes',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `ApproveBrowserRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveBrowserResDescriptor = $convert.base64Decode('ChFBcHByb3ZlQnJvd3NlclJlcxIWCgZzdGF0dXMYASABKAhSBnN0YXR1cw==');
