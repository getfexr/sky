import 'package:sky/modules/auth_util.dart';
import 'package:sky/modules/utils.dart' as util;
import 'package:sky/native_interaction/rubix/rubix_platform_calls.dart';
import 'package:grpc/grpc.dart';
import 'package:sky/protogen/google/protobuf/empty.pb.dart';
import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/protogen/native-interaction/rubix-native.pbgrpc.dart';
import 'package:sky/native_interaction/rubix/rubix_util.dart' as rubix_util;

class RubixService extends RubixServiceBase {
  static rubix_util.AccessTokenJWTClaim getAuthUser(ServiceCall call,
      {bool checkExpiry = true}) {
    try {
      String token = extractBearerToken(call);
      return rubix_util.AccesToken.verify(token, checkExpiry: checkExpiry);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      throw GrpcError.unauthenticated('Invalid auth token');
    }
  }

  Future<ChallengeString> _createDIDChallenge({required String publicKey}) {
    final challengeToken = rubix_util.ChallengeToken.get(publicKey: publicKey);
    return Future.value(ChallengeString(
      challenge: challengeToken.token,
    ));
  }

  @override
  Future<ChallengeString> createDIDChallenge(
      ServiceCall call, ChallengeReq request) {
    try {
      return _createDIDChallenge(publicKey: request.publicKey);
    } catch (e, stackTrace) {
      throw util.getGrpcError(e, stackTrace, 'Failed to create challenge');
    }
  }

  @override
  Future<CreateDIDRes> createDID(ServiceCall call, CreateDIDReq request) async {
    try {
      var challengeJWT = request.ecdsaChallengeResponse.payload;
      var publicKeyString = rubix_util.ChallengeToken.getPublicKey(
          challengeJWT); // throws if invalid
      rubix_util.SecondarySignature().ecdsaVerify(
          payload: challengeJWT,
          publicKey: publicKeyString,
          signature: request.ecdsaChallengeResponse.signature);
      CreateDIDRes result = await RubixPlatform().createDID(
          didImgFile: request.didImage,
          pubImgFile: request.publicShare,
          pubKey: publicKeyString);
      return result;
    } catch (e, stackTrace) {
      throw util.getGrpcError(e, stackTrace, 'Failed to create challenge');
    }
  }

  @override
  Future<RequestTransactionPayloadRes> initiateTransaction(
      ServiceCall call, RequestTransactionPayloadReq request) async {
    try {
      var user = getAuthUser(call);

      RequestTransactionPayloadRes result =
          await RubixPlatform().initiateTransactionPayload(
        receiver: request.receiver,
        senderDID: user.getDid(),
        tokenCount: request.tokenCount,
        comment: request.comment,
        type: request.type,
        peerId: user.getPeerId(),
      );

      return result;
    } catch (e, stackTrace) {
      throw util.getGrpcError(
          e, stackTrace, 'Failed to request transaction payload');
    }
  }

  @override
  Future<Status> signResponse(ServiceCall call, HashSigned request) {
    try {
      var user = getAuthUser(call);
      return RubixPlatform()
          .signResponse(request: request, peerId: user.getPeerId());
    } catch (e, stackTrace) {
      throw util.getGrpcError(e, stackTrace, 'Failed to sign response');
    }
  }

  @override
  Future<RequestTransactionPayloadRes> generateRbt(
      ServiceCall call, GenerateReq request) {
    try {
      var user = getAuthUser(call);
      return RubixPlatform().generateTestRbt(
        did: request.did,
        tokenCount: request.tokenCount,
        peerId: user.getPeerId(),
      );
    } catch (e, stackTrace) {
      throw util.getGrpcError(e, stackTrace, 'Failed to generate RBT');
    }
  }

  @override
  Future<GetBalanceRes> getBalance(ServiceCall call, Empty request) {
    try {
      var user = getAuthUser(call);
      return RubixPlatform()
          .getBalance(peerId: user.getPeerId(), dId: user.getDid());
    } catch (e, stackTrace) {
      throw util.getGrpcError(e, stackTrace, 'Failed to get balance');
    }
  }

  @override
  Stream<IncomingTxnDetails> streamIncomingTxn(
      ServiceCall call, Empty request) {
    try {
      var user = getAuthUser(call);
      return RubixPlatform()
          .streamIncomingTxn(peerId: user.getPeerId(), did: user.getDid());
    } catch (e, stackTrace) {
      throw util.getGrpcError(e, stackTrace, 'Failed to stream incoming txn');
    }
  }

  @override
  Future<ChallengeString> getAccessTokenChallenge(
      ServiceCall call, Empty request) {
    try {
      var user = getAuthUser(call, checkExpiry: false);
      var challengeToken =
          rubix_util.ChallengeToken.get(publicKey: user.getPublicKey());
      return Future.value(ChallengeString(challenge: challengeToken.token));
    } catch (e, stackTrace) {
      throw util.getGrpcError(
          e, stackTrace, 'Failed to generate refresh token');
    }
  }

  @override
  Future<Token> generateAccessToken(ServiceCall call, SignedPayload request) {
    var user = getAuthUser(call, checkExpiry: false);
    var challengeJWT = request.payload;
    var publicKeyString = rubix_util.ChallengeToken.getPublicKey(
        challengeJWT); // throws if invalid
    rubix_util.SecondarySignature().ecdsaVerify(
        payload: challengeJWT,
        publicKey: publicKeyString,
        signature: request.signature);
    var accessToken = rubix_util.AccesToken.get(
        did: user.getDid(),
        peerId: user.getPeerId(),
        publicKey: user.getPublicKey());
    return Future.value(Token(
        accessToken: accessToken.token,
        expiry: Timestamp.fromDateTime(accessToken.expiry)));
  }
  
  @override
  Future<TransactionHistory> getTransactionHistory(ServiceCall call, Empty request) {
<<<<<<< HEAD
    // TODO: implement getTransactionHistory once rubix is ready
=======
    // TODO: implement getTransactionHistory
>>>>>>> a68e34c (Add external api)
    throw UnimplementedError();
  }
}
