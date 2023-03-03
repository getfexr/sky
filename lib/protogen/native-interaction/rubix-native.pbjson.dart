///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use signedPayloadDescriptor instead')
const SignedPayload$json = {
  '1': 'SignedPayload',
  '2': [
    {'1': 'payload', '3': 1, '4': 1, '5': 9, '10': 'payload'},
    {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `SignedPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedPayloadDescriptor = $convert.base64Decode(
    'Cg1TaWduZWRQYXlsb2FkEhgKB3BheWxvYWQYASABKAlSB3BheWxvYWQSHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmU=');
@$core.Deprecated('Use challengeStringDescriptor instead')
const ChallengeString$json = {
  '1': 'ChallengeString',
  '2': [
    {'1': 'challenge', '3': 1, '4': 1, '5': 9, '10': 'challenge'},
  ],
};

/// Descriptor for `ChallengeString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeStringDescriptor = $convert.base64Decode(
    'Cg9DaGFsbGVuZ2VTdHJpbmcSHAoJY2hhbGxlbmdlGAEgASgJUgljaGFsbGVuZ2U=');
@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = {
  '1': 'Token',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {
      '1': 'expiry',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiry'
    },
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode(
    'CgVUb2tlbhIgCgthY2Nlc3NUb2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SMgoGZXhwaXJ5GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIGZXhwaXJ5');
@$core.Deprecated('Use createDIDReqDescriptor instead')
const CreateDIDReq$json = {
  '1': 'CreateDIDReq',
  '2': [
    {'1': 'didImage', '3': 1, '4': 1, '5': 9, '10': 'didImage'},
    {'1': 'publicShare', '3': 2, '4': 1, '5': 9, '10': 'publicShare'},
    {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    {
      '1': 'ecdsaChallengeResponse',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.protos.SignedPayload',
      '10': 'ecdsaChallengeResponse'
    },
  ],
};

/// Descriptor for `CreateDIDReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDReqDescriptor = $convert.base64Decode(
    'CgxDcmVhdGVESURSZXESGgoIZGlkSW1hZ2UYASABKAlSCGRpZEltYWdlEiAKC3B1YmxpY1NoYXJlGAIgASgJUgtwdWJsaWNTaGFyZRIcCglwdWJsaWNLZXkYAyABKAlSCXB1YmxpY0tleRJNChZlY2RzYUNoYWxsZW5nZVJlc3BvbnNlGAQgASgLMhUucHJvdG9zLlNpZ25lZFBheWxvYWRSFmVjZHNhQ2hhbGxlbmdlUmVzcG9uc2U=');
@$core.Deprecated('Use createDIDResDescriptor instead')
const CreateDIDRes$json = {
  '1': 'CreateDIDRes',
  '2': [
    {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    {'1': 'status', '3': 2, '4': 1, '5': 8, '10': 'status'},
    {
      '1': 'accessToken',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.protos.Token',
      '10': 'accessToken'
    },
  ],
};

/// Descriptor for `CreateDIDRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDResDescriptor = $convert.base64Decode(
    'CgxDcmVhdGVESURSZXMSEAoDZGlkGAEgASgJUgNkaWQSFgoGc3RhdHVzGAIgASgIUgZzdGF0dXMSLwoLYWNjZXNzVG9rZW4YAyABKAsyDS5wcm90b3MuVG9rZW5SC2FjY2Vzc1Rva2Vu');
@$core.Deprecated('Use requestTransactionPayloadReqDescriptor instead')
const RequestTransactionPayloadReq$json = {
  '1': 'RequestTransactionPayloadReq',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    {'1': 'tokenCount', '3': 3, '4': 1, '5': 1, '10': 'tokenCount'},
    {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `RequestTransactionPayloadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadReqDescriptor =
    $convert.base64Decode(
        'ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVxEhoKCHJlY2VpdmVyGAEgASgJUghyZWNlaXZlchIWCgZzZW5kZXIYAiABKAlSBnNlbmRlchIeCgp0b2tlbkNvdW50GAMgASgBUgp0b2tlbkNvdW50EhgKB2NvbW1lbnQYBCABKAlSB2NvbW1lbnQSEgoEdHlwZRgFIAEoBVIEdHlwZQ==');
@$core.Deprecated('Use requestTransactionPayloadResDescriptor instead')
const RequestTransactionPayloadRes$json = {
  '1': 'RequestTransactionPayloadRes',
  '2': [
    {'1': 'requestId', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'hash', '3': 2, '4': 1, '5': 9, '10': 'hash'},
  ],
};

/// Descriptor for `RequestTransactionPayloadRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadResDescriptor =
    $convert.base64Decode(
        'ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVzEhwKCXJlcXVlc3RJZBgBIAEoCVIJcmVxdWVzdElkEhIKBGhhc2gYAiABKAlSBGhhc2g=');
@$core.Deprecated('Use hashSignedDescriptor instead')
const HashSigned$json = {
  '1': 'HashSigned',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'pvtSign', '3': 2, '4': 1, '5': 12, '10': 'pvtSign'},
    {'1': 'imgSign', '3': 3, '4': 1, '5': 12, '10': 'imgSign'},
  ],
};

/// Descriptor for `HashSigned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hashSignedDescriptor = $convert.base64Decode(
    'CgpIYXNoU2lnbmVkEg4KAmlkGAEgASgJUgJpZBIYCgdwdnRTaWduGAIgASgMUgdwdnRTaWduEhgKB2ltZ1NpZ24YAyABKAxSB2ltZ1NpZ24=');
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusDescriptor =
    $convert.base64Decode('CgZTdGF0dXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXM=');
@$core.Deprecated('Use generateReqDescriptor instead')
const GenerateReq$json = {
  '1': 'GenerateReq',
  '2': [
    {'1': 'tokenCount', '3': 1, '4': 1, '5': 1, '10': 'tokenCount'},
    {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
  ],
};

/// Descriptor for `GenerateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateReqDescriptor = $convert.base64Decode(
    'CgtHZW5lcmF0ZVJlcRIeCgp0b2tlbkNvdW50GAEgASgBUgp0b2tlbkNvdW50EhAKA2RpZBgCIAEoCVIDZGlk');
