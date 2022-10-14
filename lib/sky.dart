import 'package:grpc/grpc.dart';
import 'package:sky/background.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/sky.pbgrpc.dart';
import 'package:sky/rpc/challenge.dart';

class SkyService extends SkyServiceBase {
  @override
  Future<ChallengeRes> challenge(ServiceCall call, ChallengeReq request) async {
    String challenge = '';
    // TODO: implement challenge
    validateExpiry(request.expiryAt, request.expiryIn);
    checkAddressOwnership(request.address);
    while (challenge == '') {
      challenge = await genCharecterGroupChallenge(
          request.purposeMessage, request.purpose, request.permission);
    }
    logChallenge(request);
    return Future.value(ChallengeRes(
        challengePayload: challenge,
        ok: true,
        message: 'Success. Address owner will be notified soon..'));
  }

  @override
  Future<FindRes> find(ServiceCall call, FindReq request) {
    // TODO: implement find

    throw UnimplementedError();
  }

  @override
  Future<HostRes> host(ServiceCall call, Stream<HostReq> request) {
    // TODO: implement host
    throw UnimplementedError();
  }

  @override
  Future<NativeInteractionRes> nativeInteraction(
      ServiceCall call, NativeInteractionReq request) {
    // TODO: implement nativeInteraction
    throw UnimplementedError();
  }

  @override
  Future<NotificationRes> notification(ServiceCall call, Empty request) {
    // TODO: implement notification
    throw UnimplementedError();
  }

  @override
  Stream<PayRes> pay(ServiceCall call, Stream<PayReq> request) {
    // TODO: implement pay
    throw UnimplementedError();
  }

  @override
  Stream<SyncRes> sync(ServiceCall call, SyncReq request) {
    // TODO: implement sync
    throw UnimplementedError();
  }

  @override
  Future<VerifyRes> verify(ServiceCall call, VerifyReq request) {
    // TODO: implement verify
    throw UnimplementedError();
  }
}

void startRPCDaemon() async {
  final server = Server(
    [SkyService()],
    const <Interceptor>[],
    // CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 6942);
  print('\nSky RPC daemon started on port 6942\n');
  skyInfo();
}

void shutdownRPCDaemon() {}
