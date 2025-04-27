import 'package:volumeter/core/grpc/grpc_client.dart';

/// Attempts to ping the server using a gRPC client.
///
/// Returns a [Future] containing a [bool] indicating whether the server is
/// available. If an exception occurs during the ping attempt, the function
/// returns `false`.

Future<bool> pingServer() async {
  try {
    final grpcClient = GrpcClient();
    final isAvailable = await grpcClient.ping();
    return isAvailable;
  } catch (e) {
    return false;
  }
}
