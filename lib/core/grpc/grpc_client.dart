import 'package:grpc/grpc.dart' show ChannelCredentials, ChannelOptions;
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:grpc/service_api.dart';
import 'package:volumeter/core/constants/network_constants.dart';
import 'package:volumeter/protos/generated/volume_estimation.pbgrpc.dart';

class GrpcClient {
  late final ClientChannel channel;
  late final VolumeEstimatorClient client;

  GrpcClient() {
    channel = GrpcOrGrpcWebClientChannel.grpc(
      kServerIP,
      port: kServerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    client = VolumeEstimatorClient(channel);
  }
  Future<bool> ping() async {
    final response = await client.ping(PingRequest());
    return response.isAvailable;
  }
}
