
import 'package:grpc/grpc.dart';
import 'package:sky/background.dart';
import 'package:sky/modules/jwt.dart';
import 'package:sky/protogen/google/protobuf/timestamp.pb.dart';
import 'package:sky/protogen/sky.pbgrpc.dart';

Future<HostRes> handleHostRequest(
  {required String otp, required signedOut, required address, required f0}) async {
  // Verify sign of otp, using address and f0s
  try {
    await OTPManager().assertOTP(otp);
    Token accessToken = AccessToken.get(address: address, f0: f0);
    Token refreshToken = RefreshToken.get(address: address, f0: f0);

    return HostRes(
      accessToken: HostRes_AccessToken(
        token: accessToken.token,
        expiry: Timestamp.fromDateTime(accessToken.expiry),
      ),
      refreshToken: HostRes_RefreshToken(
        token: refreshToken.token,
        expiry: Timestamp.fromDateTime(refreshToken.expiry),
      )
    );
  } on AssertionError catch(e) {
    throw GrpcError.permissionDenied(e.toString());
  } catch(e) {
    print(e);
    throw GrpcError.unknown();
  }
}
