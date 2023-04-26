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
const SignedPayload$json = const {
  '1': 'SignedPayload',
  '2': const [
    const {'1': 'payload', '3': 1, '4': 1, '5': 9, '10': 'payload'},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `SignedPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedPayloadDescriptor = $convert.base64Decode('Cg1TaWduZWRQYXlsb2FkEhgKB3BheWxvYWQYASABKAlSB3BheWxvYWQSHAoJc2lnbmF0dXJlGAIgASgMUglzaWduYXR1cmU=');
@$core.Deprecated('Use challengeReqDescriptor instead')
const ChallengeReq$json = const {
  '1': 'ChallengeReq',
  '2': const [
    const {'1': 'publicKey', '3': 1, '4': 1, '5': 9, '10': 'publicKey'},
  ],
};

/// Descriptor for `ChallengeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeReqDescriptor = $convert.base64Decode('CgxDaGFsbGVuZ2VSZXESHAoJcHVibGljS2V5GAEgASgJUglwdWJsaWNLZXk=');
@$core.Deprecated('Use challengeStringDescriptor instead')
const ChallengeString$json = const {
  '1': 'ChallengeString',
  '2': const [
    const {'1': 'challenge', '3': 1, '4': 1, '5': 9, '10': 'challenge'},
  ],
};

/// Descriptor for `ChallengeString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeStringDescriptor = $convert.base64Decode('Cg9DaGFsbGVuZ2VTdHJpbmcSHAoJY2hhbGxlbmdlGAEgASgJUgljaGFsbGVuZ2U=');
@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = const {
  '1': 'Token',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'expiry', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiry'},
  ],
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode('CgVUb2tlbhIgCgthY2Nlc3NUb2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SMgoGZXhwaXJ5GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIGZXhwaXJ5');
@$core.Deprecated('Use createDIDReqDescriptor instead')
const CreateDIDReq$json = const {
  '1': 'CreateDIDReq',
  '2': const [
    const {'1': 'didImage', '3': 1, '4': 1, '5': 9, '10': 'didImage'},
    const {'1': 'publicShare', '3': 2, '4': 1, '5': 9, '10': 'publicShare'},
    const {'1': 'publicKey', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    const {'1': 'ecdsaChallengeResponse', '3': 4, '4': 1, '5': 11, '6': '.protos.SignedPayload', '10': 'ecdsaChallengeResponse'},
  ],
};

/// Descriptor for `CreateDIDReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDReqDescriptor = $convert.base64Decode('CgxDcmVhdGVESURSZXESGgoIZGlkSW1hZ2UYASABKAlSCGRpZEltYWdlEiAKC3B1YmxpY1NoYXJlGAIgASgJUgtwdWJsaWNTaGFyZRIcCglwdWJsaWNLZXkYAyABKAlSCXB1YmxpY0tleRJNChZlY2RzYUNoYWxsZW5nZVJlc3BvbnNlGAQgASgLMhUucHJvdG9zLlNpZ25lZFBheWxvYWRSFmVjZHNhQ2hhbGxlbmdlUmVzcG9uc2U=');
@$core.Deprecated('Use createDIDResDescriptor instead')
const CreateDIDRes$json = const {
  '1': 'CreateDIDRes',
  '2': const [
    const {'1': 'did', '3': 1, '4': 1, '5': 9, '10': 'did'},
    const {'1': 'status', '3': 2, '4': 1, '5': 8, '10': 'status'},
    const {'1': 'accessToken', '3': 3, '4': 1, '5': 11, '6': '.protos.Token', '10': 'accessToken'},
  ],
};

/// Descriptor for `CreateDIDRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDIDResDescriptor = $convert.base64Decode('CgxDcmVhdGVESURSZXMSEAoDZGlkGAEgASgJUgNkaWQSFgoGc3RhdHVzGAIgASgIUgZzdGF0dXMSLwoLYWNjZXNzVG9rZW4YAyABKAsyDS5wcm90b3MuVG9rZW5SC2FjY2Vzc1Rva2Vu');
@$core.Deprecated('Use requestTransactionPayloadReqDescriptor instead')
const RequestTransactionPayloadReq$json = const {
  '1': 'RequestTransactionPayloadReq',
  '2': const [
    const {'1': 'receiver', '3': 1, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'tokenCount', '3': 3, '4': 1, '5': 1, '10': 'tokenCount'},
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'type', '3': 5, '4': 1, '5': 5, '10': 'type'},
  ],
};

/// Descriptor for `RequestTransactionPayloadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadReqDescriptor = $convert.base64Decode('ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVxEhoKCHJlY2VpdmVyGAEgASgJUghyZWNlaXZlchIeCgp0b2tlbkNvdW50GAMgASgBUgp0b2tlbkNvdW50EhgKB2NvbW1lbnQYBCABKAlSB2NvbW1lbnQSEgoEdHlwZRgFIAEoBVIEdHlwZQ==');
@$core.Deprecated('Use requestTransactionPayloadResDescriptor instead')
const RequestTransactionPayloadRes$json = const {
  '1': 'RequestTransactionPayloadRes',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 9, '10': 'requestId'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 9, '10': 'hash'},
  ],
};

/// Descriptor for `RequestTransactionPayloadRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestTransactionPayloadResDescriptor = $convert.base64Decode('ChxSZXF1ZXN0VHJhbnNhY3Rpb25QYXlsb2FkUmVzEhwKCXJlcXVlc3RJZBgBIAEoCVIJcmVxdWVzdElkEhIKBGhhc2gYAiABKAlSBGhhc2g=');
@$core.Deprecated('Use hashSignedDescriptor instead')
const HashSigned$json = const {
  '1': 'HashSigned',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'pvtSign', '3': 2, '4': 1, '5': 12, '10': 'pvtSign'},
    const {'1': 'imgSign', '3': 3, '4': 1, '5': 12, '10': 'imgSign'},
  ],
};

/// Descriptor for `HashSigned`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hashSignedDescriptor = $convert.base64Decode('CgpIYXNoU2lnbmVkEg4KAmlkGAEgASgJUgJpZBIYCgdwdnRTaWduGAIgASgMUgdwdnRTaWduEhgKB2ltZ1NpZ24YAyABKAxSB2ltZ1NpZ24=');
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXM=');
@$core.Deprecated('Use generateReqDescriptor instead')
const GenerateReq$json = const {
  '1': 'GenerateReq',
  '2': const [
    const {'1': 'tokenCount', '3': 1, '4': 1, '5': 1, '10': 'tokenCount'},
    const {'1': 'did', '3': 2, '4': 1, '5': 9, '10': 'did'},
  ],
};

/// Descriptor for `GenerateReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateReqDescriptor = $convert.base64Decode('CgtHZW5lcmF0ZVJlcRIeCgp0b2tlbkNvdW50GAEgASgBUgp0b2tlbkNvdW50EhAKA2RpZBgCIAEoCVIDZGlk');
@$core.Deprecated('Use getBalanceResDescriptor instead')
const GetBalanceRes$json = const {
  '1': 'GetBalanceRes',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 1, '10': 'balance'},
  ],
};

/// Descriptor for `GetBalanceRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBalanceResDescriptor = $convert.base64Decode('Cg1HZXRCYWxhbmNlUmVzEhgKB2JhbGFuY2UYASABKAFSB2JhbGFuY2U=');
@$core.Deprecated('Use incomingTxnDetailsDescriptor instead')
const IncomingTxnDetails$json = const {
  '1': 'IncomingTxnDetails',
  '2': const [
    const {'1': 'txnId', '3': 1, '4': 1, '5': 9, '10': 'txnId'},
    const {'1': 'sender', '3': 2, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'amount', '3': 4, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'comment', '3': 5, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'type', '3': 6, '4': 1, '5': 5, '10': 'type'},
    const {'1': 'timestamp', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    const {'1': 'tickerName', '3': 8, '4': 1, '5': 9, '10': 'tickerName'},
    const {'1': 'gas', '3': 9, '4': 1, '5': 1, '10': 'gas'},
  ],
};

/// Descriptor for `IncomingTxnDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incomingTxnDetailsDescriptor = $convert.base64Decode('ChJJbmNvbWluZ1R4bkRldGFpbHMSFAoFdHhuSWQYASABKAlSBXR4bklkEhYKBnNlbmRlchgCIAEoCVIGc2VuZGVyEhoKCHJlY2VpdmVyGAMgASgJUghyZWNlaXZlchIWCgZhbW91bnQYBCABKAFSBmFtb3VudBIYCgdjb21tZW50GAUgASgJUgdjb21tZW50EhIKBHR5cGUYBiABKAVSBHR5cGUSOAoJdGltZXN0YW1wGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wEh4KCnRpY2tlck5hbWUYCCABKAlSCnRpY2tlck5hbWUSEAoDZ2FzGAkgASgBUgNnYXM=');
@$core.Deprecated('Use transactionDetailsDescriptor instead')
const TransactionDetails$json = const {
  '1': 'TransactionDetails',
  '2': const [
    const {'1': 'transactionId', '3': 1, '4': 1, '5': 9, '10': 'transactionId'},
    const {'1': 'transactionType', '3': 2, '4': 1, '5': 9, '10': 'transactionType'},
    const {'1': 'blockId', '3': 3, '4': 1, '5': 9, '10': 'blockId'},
    const {'1': 'mode', '3': 4, '4': 1, '5': 5, '10': 'mode'},
    const {'1': 'senderDID', '3': 5, '4': 1, '5': 9, '10': 'senderDID'},
    const {'1': 'receiverDID', '3': 6, '4': 1, '5': 9, '10': 'receiverDID'},
    const {'1': 'amount', '3': 7, '4': 1, '5': 1, '10': 'amount'},
    const {'1': 'totalTime', '3': 8, '4': 1, '5': 1, '10': 'totalTime'},
    const {'1': 'comment', '3': 9, '4': 1, '5': 9, '10': 'comment'},
    const {'1': 'dateTime', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTime'},
    const {'1': 'status', '3': 11, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `TransactionDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDetailsDescriptor = $convert.base64Decode('ChJUcmFuc2FjdGlvbkRldGFpbHMSJAoNdHJhbnNhY3Rpb25JZBgBIAEoCVINdHJhbnNhY3Rpb25JZBIoCg90cmFuc2FjdGlvblR5cGUYAiABKAlSD3RyYW5zYWN0aW9uVHlwZRIYCgdibG9ja0lkGAMgASgJUgdibG9ja0lkEhIKBG1vZGUYBCABKAVSBG1vZGUSHAoJc2VuZGVyRElEGAUgASgJUglzZW5kZXJESUQSIAoLcmVjZWl2ZXJESUQYBiABKAlSC3JlY2VpdmVyRElEEhYKBmFtb3VudBgHIAEoAVIGYW1vdW50EhwKCXRvdGFsVGltZRgIIAEoAVIJdG90YWxUaW1lEhgKB2NvbW1lbnQYCSABKAlSB2NvbW1lbnQSNgoIZGF0ZVRpbWUYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghkYXRlVGltZRIWCgZzdGF0dXMYCyABKAhSBnN0YXR1cw==');
@$core.Deprecated('Use transactionHistoryDescriptor instead')
const TransactionHistory$json = const {
  '1': 'TransactionHistory',
  '2': const [
    const {'1': 'transactions', '3': 1, '4': 3, '5': 11, '6': '.protos.TransactionDetails', '10': 'transactions'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `TransactionHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionHistoryDescriptor = $convert.base64Decode('ChJUcmFuc2FjdGlvbkhpc3RvcnkSPgoMdHJhbnNhY3Rpb25zGAEgAygLMhoucHJvdG9zLlRyYW5zYWN0aW9uRGV0YWlsc1IMdHJhbnNhY3Rpb25zEhQKBWVycm9yGAIgASgJUgVlcnJvcg==');
@$core.Deprecated('Use onChainAssetDescriptor instead')
const OnChainAsset$json = const {
  '1': 'OnChainAsset',
  '2': const [
    const {'1': 'timsstamp', '3': 1, '4': 1, '5': 9, '10': 'timsstamp'},
    const {'1': 'assetName', '3': 2, '4': 1, '5': 9, '10': 'assetName'},
    const {'1': 'creatorName', '3': 3, '4': 1, '5': 9, '10': 'creatorName'},
    const {'1': 'creatorDID', '3': 4, '4': 1, '5': 9, '10': 'creatorDID'},
    const {'1': 'price', '3': 5, '4': 1, '5': 9, '10': 'price'},
    const {'1': 'note', '3': 6, '4': 1, '5': 9, '10': 'note'},
    const {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'hash', '3': 8, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'chain', '3': 9, '4': 1, '5': 9, '10': 'chain'},
    const {'1': 'url', '3': 10, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `OnChainAsset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onChainAssetDescriptor = $convert.base64Decode('CgxPbkNoYWluQXNzZXQSHAoJdGltc3N0YW1wGAEgASgJUgl0aW1zc3RhbXASHAoJYXNzZXROYW1lGAIgASgJUglhc3NldE5hbWUSIAoLY3JlYXRvck5hbWUYAyABKAlSC2NyZWF0b3JOYW1lEh4KCmNyZWF0b3JESUQYBCABKAlSCmNyZWF0b3JESUQSFAoFcHJpY2UYBSABKAlSBXByaWNlEhIKBG5vdGUYBiABKAlSBG5vdGUSFgoGc3RhdHVzGAcgASgJUgZzdGF0dXMSEgoEaGFzaBgIIAEoCVIEaGFzaBIUCgVjaGFpbhgJIAEoCVIFY2hhaW4SEAoDdXJsGAogASgJUgN1cmw=');
@$core.Deprecated('Use assetsDescriptor instead')
const Assets$json = const {
  '1': 'Assets',
  '2': const [
    const {'1': 'assets', '3': 1, '4': 3, '5': 11, '6': '.protos.OnChainAsset', '10': 'assets'},
  ],
};

/// Descriptor for `Assets`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetsDescriptor = $convert.base64Decode('CgZBc3NldHMSLAoGYXNzZXRzGAEgAygLMhQucHJvdG9zLk9uQ2hhaW5Bc3NldFIGYXNzZXRz');
