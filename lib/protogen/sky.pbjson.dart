///
//  Generated code. Do not modify.
//  source: sky.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use hostReqDescriptor instead')
const HostReq$json = const {
  '1': 'HostReq',
  '2': const [
    const {'1': 'signedOtp', '3': 1, '4': 1, '5': 9, '10': 'signedOtp'},
    const {'1': 'otp', '3': 2, '4': 1, '5': 9, '10': 'otp'},
    const {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'F0', '3': 4, '4': 1, '5': 9, '10': 'F0'},
  ],
};

/// Descriptor for `HostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostReqDescriptor = $convert.base64Decode('CgdIb3N0UmVxEhwKCXNpZ25lZE90cBgBIAEoCVIJc2lnbmVkT3RwEhAKA290cBgCIAEoCVIDb3RwEhgKB2FkZHJlc3MYAyABKAlSB2FkZHJlc3MSDgoCRjAYBCABKAlSAkYw');
@$core.Deprecated('Use hostResDescriptor instead')
const HostRes$json = const {
  '1': 'HostRes',
  '2': const [
    const {'1': 'accessToken', '3': 1, '4': 1, '5': 11, '6': '.protos.HostRes.AccessToken', '10': 'accessToken'},
    const {'1': 'refreshToken', '3': 2, '4': 1, '5': 11, '6': '.protos.HostRes.RefreshToken', '10': 'refreshToken'},
  ],
  '3': const [HostRes_AccessToken$json, HostRes_RefreshToken$json],
};

@$core.Deprecated('Use hostResDescriptor instead')
const HostRes_AccessToken$json = const {
  '1': 'AccessToken',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'expiry', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiry'},
  ],
};

@$core.Deprecated('Use hostResDescriptor instead')
const HostRes_RefreshToken$json = const {
  '1': 'RefreshToken',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'expiry', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiry'},
  ],
};

/// Descriptor for `HostRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostResDescriptor = $convert.base64Decode('CgdIb3N0UmVzEj0KC2FjY2Vzc1Rva2VuGAEgASgLMhsucHJvdG9zLkhvc3RSZXMuQWNjZXNzVG9rZW5SC2FjY2Vzc1Rva2VuEkAKDHJlZnJlc2hUb2tlbhgCIAEoCzIcLnByb3Rvcy5Ib3N0UmVzLlJlZnJlc2hUb2tlblIMcmVmcmVzaFRva2VuGlcKC0FjY2Vzc1Rva2VuEhQKBXRva2VuGAEgASgJUgV0b2tlbhIyCgZleHBpcnkYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgZleHBpcnkaWAoMUmVmcmVzaFRva2VuEhQKBXRva2VuGAEgASgJUgV0b2tlbhIyCgZleHBpcnkYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgZleHBpcnk=');
@$core.Deprecated('Use notificationResDescriptor instead')
const NotificationRes$json = const {
  '1': 'NotificationRes',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 14, '6': '.protos.NotificationRes.type', '10': 'data'},
    const {'1': 'time', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'time'},
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'from', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'from', '17': true},
    const {'1': 'to', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'to', '17': true},
    const {'1': 'amount', '3': 6, '4': 1, '5': 1, '9': 2, '10': 'amount', '17': true},
    const {'1': 'message', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'message', '17': true},
    const {'1': 'bannerImage', '3': 8, '4': 1, '5': 9, '9': 4, '10': 'bannerImage', '17': true},
    const {'1': 'headingText', '3': 9, '4': 1, '5': 9, '9': 5, '10': 'headingText', '17': true},
    const {'1': 'cta', '3': 10, '4': 1, '5': 9, '9': 6, '10': 'cta', '17': true},
  ],
  '4': const [NotificationRes_type$json],
  '8': const [
    const {'1': '_from'},
    const {'1': '_to'},
    const {'1': '_amount'},
    const {'1': '_message'},
    const {'1': '_bannerImage'},
    const {'1': '_headingText'},
    const {'1': '_cta'},
  ],
};

@$core.Deprecated('Use notificationResDescriptor instead')
const NotificationRes_type$json = const {
  '1': 'type',
  '2': const [
    const {'1': 'transaction', '2': 0},
    const {'1': 'promotion', '2': 1},
  ],
};

/// Descriptor for `NotificationRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationResDescriptor = $convert.base64Decode('Cg9Ob3RpZmljYXRpb25SZXMSMAoEZGF0YRgBIAEoDjIcLnByb3Rvcy5Ob3RpZmljYXRpb25SZXMudHlwZVIEZGF0YRIuCgR0aW1lGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIEdGltZRIOCgJpZBgDIAEoCVICaWQSFwoEZnJvbRgEIAEoCUgAUgRmcm9tiAEBEhMKAnRvGAUgASgJSAFSAnRviAEBEhsKBmFtb3VudBgGIAEoAUgCUgZhbW91bnSIAQESHQoHbWVzc2FnZRgHIAEoCUgDUgdtZXNzYWdliAEBEiUKC2Jhbm5lckltYWdlGAggASgJSARSC2Jhbm5lckltYWdliAEBEiUKC2hlYWRpbmdUZXh0GAkgASgJSAVSC2hlYWRpbmdUZXh0iAEBEhUKA2N0YRgKIAEoCUgGUgNjdGGIAQEiJgoEdHlwZRIPCgt0cmFuc2FjdGlvbhAAEg0KCXByb21vdGlvbhABQgcKBV9mcm9tQgUKA190b0IJCgdfYW1vdW50QgoKCF9tZXNzYWdlQg4KDF9iYW5uZXJJbWFnZUIOCgxfaGVhZGluZ1RleHRCBgoEX2N0YQ==');
@$core.Deprecated('Use challengeReqDescriptor instead')
const ChallengeReq$json = const {
  '1': 'ChallengeReq',
  '2': const [
    const {'1': 'purpose', '3': 1, '4': 1, '5': 14, '6': '.protos.ChallengeReq.purposeType', '10': 'purpose'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'purposeMessage', '3': 3, '4': 1, '5': 9, '10': 'purposeMessage'},
    const {'1': 'permission', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'permission', '17': true},
    const {'1': 'expiryIn', '3': 5, '4': 1, '5': 5, '10': 'expiryIn'},
    const {'1': 'expiryAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '9': 1, '10': 'expiryAt', '17': true},
    const {'1': 'authLink', '3': 7, '4': 1, '5': 9, '10': 'authLink'},
    const {'1': 'bannerImage', '3': 8, '4': 1, '5': 9, '9': 2, '10': 'bannerImage', '17': true},
  ],
  '4': const [ChallengeReq_purposeType$json],
  '8': const [
    const {'1': '_permission'},
    const {'1': '_expiryAt'},
    const {'1': '_bannerImage'},
  ],
};

@$core.Deprecated('Use challengeReqDescriptor instead')
const ChallengeReq_purposeType$json = const {
  '1': 'purposeType',
  '2': const [
    const {'1': 'pass', '2': 0},
    const {'1': 'transaction', '2': 1},
    const {'1': 'subscription', '2': 2},
  ],
};

/// Descriptor for `ChallengeReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeReqDescriptor = $convert.base64Decode('CgxDaGFsbGVuZ2VSZXESOgoHcHVycG9zZRgBIAEoDjIgLnByb3Rvcy5DaGFsbGVuZ2VSZXEucHVycG9zZVR5cGVSB3B1cnBvc2USGgoIcmVjZWl2ZXIYAiABKAlSCHJlY2VpdmVyEiYKDnB1cnBvc2VNZXNzYWdlGAMgASgJUg5wdXJwb3NlTWVzc2FnZRIjCgpwZXJtaXNzaW9uGAQgASgJSABSCnBlcm1pc3Npb26IAQESGgoIZXhwaXJ5SW4YBSABKAVSCGV4cGlyeUluEjsKCGV4cGlyeUF0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgBUghleHBpcnlBdIgBARIaCghhdXRoTGluaxgHIAEoCVIIYXV0aExpbmsSJQoLYmFubmVySW1hZ2UYCCABKAlIAlILYmFubmVySW1hZ2WIAQEiOgoLcHVycG9zZVR5cGUSCAoEcGFzcxAAEg8KC3RyYW5zYWN0aW9uEAESEAoMc3Vic2NyaXB0aW9uEAJCDQoLX3Blcm1pc3Npb25CCwoJX2V4cGlyeUF0Qg4KDF9iYW5uZXJJbWFnZQ==');
@$core.Deprecated('Use challengeResDescriptor instead')
const ChallengeRes$json = const {
  '1': 'ChallengeRes',
  '2': const [
    const {'1': 'challengePayload', '3': 1, '4': 1, '5': 9, '10': 'challengePayload'},
    const {'1': 'ok', '3': 2, '4': 1, '5': 8, '10': 'ok'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
  ],
  '8': const [
    const {'1': '_message'},
  ],
};

/// Descriptor for `ChallengeRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List challengeResDescriptor = $convert.base64Decode('CgxDaGFsbGVuZ2VSZXMSKgoQY2hhbGxlbmdlUGF5bG9hZBgBIAEoCVIQY2hhbGxlbmdlUGF5bG9hZBIOCgJvaxgCIAEoCFICb2sSHQoHbWVzc2FnZRgDIAEoCUgAUgdtZXNzYWdliAEBQgoKCF9tZXNzYWdl');
@$core.Deprecated('Use verifyReqDescriptor instead')
const VerifyReq$json = const {
  '1': 'VerifyReq',
  '2': const [
    const {'1': 'challengePayload', '3': 1, '4': 1, '5': 9, '10': 'challengePayload'},
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `VerifyReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyReqDescriptor = $convert.base64Decode('CglWZXJpZnlSZXESKgoQY2hhbGxlbmdlUGF5bG9hZBgBIAEoCVIQY2hhbGxlbmdlUGF5bG9hZBIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNz');
@$core.Deprecated('Use verifyResDescriptor instead')
const VerifyRes$json = const {
  '1': 'VerifyRes',
  '2': const [
    const {'1': 'connected', '3': 1, '4': 1, '5': 8, '10': 'connected'},
    const {'1': 'authPoint', '3': 2, '4': 1, '5': 9, '10': 'authPoint'},
    const {'1': 'authCode', '3': 3, '4': 1, '5': 5, '10': 'authCode'},
  ],
};

/// Descriptor for `VerifyRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyResDescriptor = $convert.base64Decode('CglWZXJpZnlSZXMSHAoJY29ubmVjdGVkGAEgASgIUgljb25uZWN0ZWQSHAoJYXV0aFBvaW50GAIgASgJUglhdXRoUG9pbnQSGgoIYXV0aENvZGUYAyABKAVSCGF1dGhDb2Rl');
@$core.Deprecated('Use nativeInteractionReqDescriptor instead')
const NativeInteractionReq$json = const {
  '1': 'NativeInteractionReq',
};

/// Descriptor for `NativeInteractionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nativeInteractionReqDescriptor = $convert.base64Decode('ChROYXRpdmVJbnRlcmFjdGlvblJlcQ==');
@$core.Deprecated('Use nativeInteractionResDescriptor instead')
const NativeInteractionRes$json = const {
  '1': 'NativeInteractionRes',
};

/// Descriptor for `NativeInteractionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nativeInteractionResDescriptor = $convert.base64Decode('ChROYXRpdmVJbnRlcmFjdGlvblJlcw==');
@$core.Deprecated('Use syncReqDescriptor instead')
const SyncReq$json = const {
  '1': 'SyncReq',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `SyncReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncReqDescriptor = $convert.base64Decode('CgdTeW5jUmVxEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use syncResDescriptor instead')
const SyncRes$json = const {
  '1': 'SyncRes',
  '2': const [
    const {'1': 'notifications', '3': 1, '4': 3, '5': 11, '6': '.protos.NotificationRes', '10': 'notifications'},
  ],
};

/// Descriptor for `SyncRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncResDescriptor = $convert.base64Decode('CgdTeW5jUmVzEj0KDW5vdGlmaWNhdGlvbnMYASADKAsyFy5wcm90b3MuTm90aWZpY2F0aW9uUmVzUg1ub3RpZmljYXRpb25z');
@$core.Deprecated('Use payReqDescriptor instead')
const PayReq$json = const {
  '1': 'PayReq',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 14, '6': '.protos.PayReq.chain', '10': 'name'},
    const {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'comment', '17': true},
    const {'1': 'validators', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'validators', '17': true},
  ],
  '4': const [PayReq_chain$json],
  '8': const [
    const {'1': '_comment'},
    const {'1': '_validators'},
  ],
};

@$core.Deprecated('Use payReqDescriptor instead')
const PayReq_chain$json = const {
  '1': 'chain',
  '2': const [
    const {'1': 'Rubix', '2': 0},
  ],
};

/// Descriptor for `PayReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payReqDescriptor = $convert.base64Decode('CgZQYXlSZXESKAoEbmFtZRgBIAEoDjIULnByb3Rvcy5QYXlSZXEuY2hhaW5SBG5hbWUSGgoIcmVjZWl2ZXIYAiABKAlSCHJlY2VpdmVyEh0KB2NvbW1lbnQYAyABKAlIAFIHY29tbWVudIgBARIjCgp2YWxpZGF0b3JzGAQgASgJSAFSCnZhbGlkYXRvcnOIAQEiEgoFY2hhaW4SCQoFUnViaXgQAEIKCghfY29tbWVudEINCgtfdmFsaWRhdG9ycw==');
@$core.Deprecated('Use payResDescriptor instead')
const PayRes$json = const {
  '1': 'PayRes',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
    const {'1': 'statusCode', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    const {'1': 'statusMessage', '3': 3, '4': 1, '5': 9, '10': 'statusMessage'},
    const {'1': 'transactionID', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'transactionID', '17': true},
  ],
  '8': const [
    const {'1': '_transactionID'},
  ],
};

/// Descriptor for `PayRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payResDescriptor = $convert.base64Decode('CgZQYXlSZXMSFgoGc3RhdHVzGAEgASgIUgZzdGF0dXMSHgoKc3RhdHVzQ29kZRgCIAEoBVIKc3RhdHVzQ29kZRIkCg1zdGF0dXNNZXNzYWdlGAMgASgJUg1zdGF0dXNNZXNzYWdlEikKDXRyYW5zYWN0aW9uSUQYBCABKAlIAFINdHJhbnNhY3Rpb25JRIgBAUIQCg5fdHJhbnNhY3Rpb25JRA==');
@$core.Deprecated('Use getUserInfoResDescriptor instead')
const GetUserInfoRes$json = const {
  '1': 'GetUserInfoRes',
  '2': const [
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'f0', '3': 3, '4': 1, '5': 9, '10': 'f0'},
  ],
};

/// Descriptor for `GetUserInfoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoResDescriptor = $convert.base64Decode('Cg5HZXRVc2VySW5mb1JlcxIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNzEg4KAmYwGAMgASgJUgJmMA==');
@$core.Deprecated('Use findReqDescriptor instead')
const FindReq$json = const {
  '1': 'FindReq',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `FindReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findReqDescriptor = $convert.base64Decode('CgdGaW5kUmVxEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M=');
@$core.Deprecated('Use findResDescriptor instead')
const FindRes$json = const {
  '1': 'FindRes',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `FindRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findResDescriptor = $convert.base64Decode('CgdGaW5kUmVzEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use relayReqDescriptor instead')
const RelayReq$json = const {
  '1': 'RelayReq',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'noreply', '3': 2, '4': 1, '5': 8, '10': 'noreply'},
  ],
};

/// Descriptor for `RelayReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List relayReqDescriptor = $convert.base64Decode('CghSZWxheVJlcRIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEhgKB25vcmVwbHkYAiABKAhSB25vcmVwbHk=');
@$core.Deprecated('Use relayResDescriptor instead')
const RelayRes$json = const {
  '1': 'RelayRes',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RelayRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List relayResDescriptor = $convert.base64Decode('CghSZWxheVJlcxIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');
