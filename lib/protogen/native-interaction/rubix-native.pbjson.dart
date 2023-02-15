///
//  Generated code. Do not modify.
//  source: native-interaction/rubix-native.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use createDIDReqDescriptor instead')
const CreateDIDReq$json = const {
  '1': 'CreateDIDReq',
  '2': const [
    const {'1': 'didImage', '3': 1, '4': 1, '5': 9, '10': 'didImage'},
    const {'1': 'publicShare', '3': 2, '4': 1, '5': 9, '10': 'publicShare'},
    const {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `CreateDIDReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDReqDescriptor = $convert.base64Decode('CgxDcmVhdGVESURSZXESGgoIZGlkSW1hZ2UYASABKAlSCGRpZEltYWdlEiAKC3B1YmxpY1NoYXJlGAIgASgJUgtwdWJsaWNTaGFyZRIcCglwdWJsaWNLZXkYAyABKAlSCXB1YmxpY0tleQ==');
@$core.Deprecated('Use createDIDResDescriptor instead')
const CreateDIDRes$json = const {
  '1': 'CreateDIDRes',
  '2': const [
    const {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    const {'1': 'status', '3': 2, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `CreateDIDRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDResDescriptor = $convert.base64Decode('CgxDcmVhdGVESURSZXMSEAoDZGlkGAEgASgJUgNkaWQSFgoGc3RhdHVzGAIgASgIUgZzdGF0dXM=');
@$core.Deprecated('Use requestTransactionPayloadReqDescriptor instead')
const RequestTransactionPayloadReq$json = const {
  '1': 'RequestTransactionPayloadReq',
  '2': const [
    const {'1': 'receiver', '3': 1, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'tokenCount', '3': 2, '4': 1, '5': 1, '10': 'tokenCount'},
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'type', '3': 4, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'privateKeyPass', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'privateKeyPass', '17': true},
  ],
  '8': const [
    const {'1': '_privateKeyPass'},
  ],
};

/// Descriptor for `RequestTransactionPayloadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadReqDescriptor = $convert.base64Decode('ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVxEhoKCHJlY2VpdmVyGAEgASgJUghyZWNlaXZlchIeCgp0b2tlbkNvdW50GAIgASgBUgp0b2tlbkNvdW50EhgKB2NvbW1lbnQYAyABKAlSB2NvbW1lbnQSEgoEdHlwZRgEIAEoBVIEdHlwZRIrCg5wcml2YXRlS2V5UGFzcxgFIAEoCUgAUg5wcml2YXRlS2V5UGFzc4gBAUIRCg9fcHJpdmF0ZUtleVBhc3M=');
@$core.Deprecated('Use txnSummaryDescriptor instead')
const TxnSummary$json = const {
  '1': 'TxnSummary',
  '2': const [
    const {'1': 'txnId', '3': 1, '4': 1, '5': 9, '10': 'txnId'},
    const {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'comment', '3': 5, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `TxnSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txnSummaryDescriptor = $convert.base64Decode('CgpUeG5TdW1tYXJ5EhQKBXR4bklkGAEgASgJUgV0eG5JZBIWCgZzZW5kZXIYAiABKAlSBnNlbmRlchIaCghyZWNlaXZlchgDIAEoCVIIcmVjZWl2ZXISFgoGYW1vdW50GAQgASgBUgZhbW91bnQSGAoHY29tbWVudBgFIAEoCVIHY29tbWVudA==');
@$core.Deprecated('Use transactionLastObjectDescriptor instead')
const TransactionLastObject$json = const {
  '1': 'TransactionLastObject',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `TransactionLastObject`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionLastObjectDescriptor = $convert.base64Decode('ChVUcmFuc2FjdGlvbkxhc3RPYmplY3QSEgoEaGFzaBgBIAEoCVIEaGFzaBIUCgV0b2tlbhgCIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use transactionLastObjectSignedDescriptor instead')
const TransactionLastObjectSigned$json = const {
  '1': 'TransactionLastObjectSigned',
  '2': const [
    const {'1': 'chainSign', '3': 1, '4': 1, '5': 9, '10': 'chainSign'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'token', '3': 3, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `TransactionLastObjectSigned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionLastObjectSignedDescriptor = $convert.base64Decode('ChtUcmFuc2FjdGlvbkxhc3RPYmplY3RTaWduZWQSHAoJY2hhaW5TaWduGAEgASgJUgljaGFpblNpZ24SEgoEaGFzaBgCIAEoCVIEaGFzaBIUCgV0b2tlbhgDIAEoCVIFdG9rZW4=');
@$core.Deprecated('Use signedHashDescriptor instead')
const SignedHash$json = const {
  '1': 'SignedHash',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'sign', '3': 2, '4': 1, '5': 9, '10': 'sign'},
  ],
};

/// Descriptor for `SignedHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedHashDescriptor = $convert.base64Decode('CgpTaWduZWRIYXNoEhIKBGhhc2gYASABKAlSBGhhc2gSEgoEc2lnbhgCIAEoCVIEc2lnbg==');
@$core.Deprecated('Use pledgeDetailDescriptor instead')
const PledgeDetail$json = const {
  '1': 'PledgeDetail',
  '2': const [
    const {'1': 'valueArr', '3': 1, '4': 3, '5': 9, '10': 'valueArr'},
  ],
};

/// Descriptor for `PledgeDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pledgeDetailDescriptor = $convert.base64Decode('CgxQbGVkZ2VEZXRhaWwSGgoIdmFsdWVBcnIYASADKAlSCHZhbHVlQXJy');
@$core.Deprecated('Use pledgeDetailSignedDescriptor instead')
const PledgeDetailSigned$json = const {
  '1': 'PledgeDetailSigned',
  '2': const [
    const {'1': 'valueArr', '3': 2, '4': 3, '5': 11, '6': '.protos.SignedHash', '10': 'valueArr'},
  ],
};

/// Descriptor for `PledgeDetailSigned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pledgeDetailSignedDescriptor = $convert.base64Decode('ChJQbGVkZ2VEZXRhaWxTaWduZWQSLgoIdmFsdWVBcnIYAiADKAsyEi5wcm90b3MuU2lnbmVkSGFzaFIIdmFsdWVBcnI=');
@$core.Deprecated('Use requestTransactionPayloadResDescriptor instead')
const RequestTransactionPayloadRes$json = const {
  '1': 'RequestTransactionPayloadRes',
  '2': const [
    const {'1': 'authSenderByRecHash', '3': 1, '4': 1, '5': 9, '10': 'authSenderByRecHash'},
    const {'1': 'lastObject', '3': 2, '4': 3, '5': 11, '6': '.protos.TransactionLastObject', '10': 'lastObject'},
    const {'1': 'senderPayloadSign', '3': 3, '4': 1, '5': 9, '10': 'senderPayloadSign'},
    const {'1': 'pledgeDetails', '3': 4, '4': 3, '5': 11, '6': '.protos.RequestTransactionPayloadRes.PledgeDetailsEntry', '10': 'pledgeDetails'},
  ],
  '3': const [RequestTransactionPayloadRes_PledgeDetailsEntry$json],
};

@$core.Deprecated('Use requestTransactionPayloadResDescriptor instead')
const RequestTransactionPayloadRes_PledgeDetailsEntry$json = const {
  '1': 'PledgeDetailsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.protos.PledgeDetail', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `RequestTransactionPayloadRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadResDescriptor = $convert.base64Decode('ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVzEjAKE2F1dGhTZW5kZXJCeVJlY0hhc2gYASABKAlSE2F1dGhTZW5kZXJCeVJlY0hhc2gSPQoKbGFzdE9iamVjdBgCIAMoCzIdLnByb3Rvcy5UcmFuc2FjdGlvbkxhc3RPYmplY3RSCmxhc3RPYmplY3QSLAoRc2VuZGVyUGF5bG9hZFNpZ24YAyABKAlSEXNlbmRlclBheWxvYWRTaWduEl0KDXBsZWRnZURldGFpbHMYBCADKAsyNy5wcm90b3MuUmVxdWVzdFRyYW5zYWN0aW9uUGF5bG9hZFJlcy5QbGVkZ2VEZXRhaWxzRW50cnlSDXBsZWRnZURldGFpbHMaVgoSUGxlZGdlRGV0YWlsc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EioKBXZhbHVlGAIgASgLMhQucHJvdG9zLlBsZWRnZURldGFpbFIFdmFsdWU6AjgB');
@$core.Deprecated('Use finaliseTransactionPayloadDescriptor instead')
const FinaliseTransactionPayload$json = const {
  '1': 'FinaliseTransactionPayload',
  '2': const [
    const {'1': 'authSenderByRecHash', '3': 1, '4': 1, '5': 11, '6': '.protos.SignedHash', '10': 'authSenderByRecHash'},
    const {'1': 'lastObject', '3': 2, '4': 3, '5': 11, '6': '.protos.TransactionLastObjectSigned', '10': 'lastObject'},
    const {'1': 'senderPayloadSign', '3': 3, '4': 1, '5': 11, '6': '.protos.SignedHash', '10': 'senderPayloadSign'},
    const {'1': 'privateKeyPass', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'privateKeyPass', '17': true},
    const {'1': 'pledgeDetails', '3': 5, '4': 3, '5': 11, '6': '.protos.FinaliseTransactionPayload.PledgeDetailsEntry', '10': 'pledgeDetails'},
  ],
  '3': const [FinaliseTransactionPayload_PledgeDetailsEntry$json],
  '8': const [
    const {'1': '_privateKeyPass'},
  ],
};

@$core.Deprecated('Use finaliseTransactionPayloadDescriptor instead')
const FinaliseTransactionPayload_PledgeDetailsEntry$json = const {
  '1': 'PledgeDetailsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.protos.PledgeDetailSigned', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `FinaliseTransactionPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List finaliseTransactionPayloadDescriptor = $convert.base64Decode('ChpGaW5hbGlzZVRyYW5zYWN0aW9uUGF5bG9hZBJEChNhdXRoU2VuZGVyQnlSZWNIYXNoGAEgASgLMhIucHJvdG9zLlNpZ25lZEhhc2hSE2F1dGhTZW5kZXJCeVJlY0hhc2gSQwoKbGFzdE9iamVjdBgCIAMoCzIjLnByb3Rvcy5UcmFuc2FjdGlvbkxhc3RPYmplY3RTaWduZWRSCmxhc3RPYmplY3QSQAoRc2VuZGVyUGF5bG9hZFNpZ24YAyABKAsyEi5wcm90b3MuU2lnbmVkSGFzaFIRc2VuZGVyUGF5bG9hZFNpZ24SKwoOcHJpdmF0ZUtleVBhc3MYBCABKAlIAFIOcHJpdmF0ZUtleVBhc3OIAQESWwoNcGxlZGdlRGV0YWlscxgFIAMoCzI1LnByb3Rvcy5GaW5hbGlzZVRyYW5zYWN0aW9uUGF5bG9hZC5QbGVkZ2VEZXRhaWxzRW50cnlSDXBsZWRnZURldGFpbHMaXAoSUGxlZGdlRGV0YWlsc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EjAKBXZhbHVlGAIgASgLMhoucHJvdG9zLlBsZWRnZURldGFpbFNpZ25lZFIFdmFsdWU6AjgBQhEKD19wcml2YXRlS2V5UGFzcw==');
@$core.Deprecated('Use getTransactionLogReqDescriptor instead')
const GetTransactionLogReq$json = const {
  '1': 'GetTransactionLogReq',
  '2': const [
    const {'1': 'count', '3': 1, '4': 1, '5': 13, '10': 'count'},
  ],
};

/// Descriptor for `GetTransactionLogReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionLogReqDescriptor = $convert.base64Decode('ChRHZXRUcmFuc2FjdGlvbkxvZ1JlcRIUCgVjb3VudBgBIAEoDVIFY291bnQ=');
@$core.Deprecated('Use getTransactionLogResDescriptor instead')
const GetTransactionLogRes$json = const {
  '1': 'GetTransactionLogRes',
  '2': const [
    const {'1': 'txnLog', '3': 1, '4': 3, '5': 11, '6': '.protos.TxnSummary', '10': 'txnLog'},
  ],
};

/// Descriptor for `GetTransactionLogRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionLogResDescriptor = $convert.base64Decode('ChRHZXRUcmFuc2FjdGlvbkxvZ1JlcxIqCgZ0eG5Mb2cYASADKAsyEi5wcm90b3MuVHhuU3VtbWFyeVIGdHhuTG9n');
@$core.Deprecated('Use getBalanceResDescriptor instead')
const GetBalanceRes$json = const {
  '1': 'GetBalanceRes',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 1, '10': 'balance'},
  ],
};

/// Descriptor for `GetBalanceRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBalanceResDescriptor = $convert.base64Decode('Cg1HZXRCYWxhbmNlUmVzEhgKB2JhbGFuY2UYASABKAFSB2JhbGFuY2U=');
