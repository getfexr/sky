import 'package:grpc/grpc.dart';
import 'package:sky/background.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/sky.pbgrpc.dart';
import 'package:sky/rpc/challenge.dart';

class SkyService extends SkyServiceBase {
  @override
  Future<ChallengeRes> challenge(ServiceCall call, ChallengeReq request) async {
    String challenge = '';
    if(validateExpiry(request.expiryAt, request.expiryIn) && checkAuthLink(request.authLink)) {
      while (challenge == '') {
        challenge = await genCharacterGroupChallenge(
            request.purposeMessage, request.purpose, request.permission);
      }
    }
    checkAddressIfHosted(request.receiver).then((value) {
      if (value) {
        //bounce request to relay
        return notifyUser(request, challenge);
      }
      else {
        throw GrpcError.notFound('User not hosted');
      }
    });
    return Future.value(ChallengeRes(
        challengePayload: challenge,
        ok: false,
        message: 'Failed. Address owner is not hosted on Sky'));
  }

  @override
  Future<FindRes> find(ServiceCall call, FindReq request) {
    // TODO: implement find

    throw UnimplementedError();
  }

  @override
  Future<HostRes> host(ServiceCall call,HostReq request) {
    // checkSignedOTP(request.)
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
  
  @override
  Future<RelayRes> relay(ServiceCall call, RelayReq request) {
    // TODO: implement relay
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
