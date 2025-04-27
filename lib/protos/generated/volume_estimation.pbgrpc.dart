//
//  Generated code. Do not modify.
//  source: volume_estimation.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'volume_estimation.pb.dart' as $0;

export 'volume_estimation.pb.dart';

@$pb.GrpcServiceName('VolumeEstimator')
class VolumeEstimatorClient extends $grpc.Client {
  static final _$ping = $grpc.ClientMethod<$0.PingRequest, $0.PingResponse>(
      '/VolumeEstimator/Ping',
      ($0.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PingResponse.fromBuffer(value));
  static final _$processProject =
      $grpc.ClientMethod<$0.ProjectChunk, $0.ProcessingStatus>(
          '/VolumeEstimator/ProcessProject',
          ($0.ProjectChunk value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProcessingStatus.fromBuffer(value));
  static final _$getProjectStatus =
      $grpc.ClientMethod<$0.ProjectRequest, $0.ProcessingStatus>(
          '/VolumeEstimator/GetProjectStatus',
          ($0.ProjectRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ProcessingStatus.fromBuffer(value));

  VolumeEstimatorClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.PingResponse> ping($0.PingRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  $grpc.ResponseStream<$0.ProcessingStatus> processProject(
      $async.Stream<$0.ProjectChunk> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$processProject, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProcessingStatus> getProjectStatus(
      $0.ProjectRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProjectStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('VolumeEstimator')
abstract class VolumeEstimatorServiceBase extends $grpc.Service {
  $core.String get $name => 'VolumeEstimator';

  VolumeEstimatorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PingRequest, $0.PingResponse>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PingRequest.fromBuffer(value),
        ($0.PingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProjectChunk, $0.ProcessingStatus>(
        'ProcessProject',
        processProject,
        true,
        true,
        ($core.List<$core.int> value) => $0.ProjectChunk.fromBuffer(value),
        ($0.ProcessingStatus value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProjectRequest, $0.ProcessingStatus>(
        'GetProjectStatus',
        getProjectStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProjectRequest.fromBuffer(value),
        ($0.ProcessingStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.PingResponse> ping_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PingRequest> $request) async {
    return ping($call, await $request);
  }

  $async.Future<$0.ProcessingStatus> getProjectStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ProjectRequest> $request) async {
    return getProjectStatus($call, await $request);
  }

  $async.Future<$0.PingResponse> ping(
      $grpc.ServiceCall call, $0.PingRequest request);
  $async.Stream<$0.ProcessingStatus> processProject(
      $grpc.ServiceCall call, $async.Stream<$0.ProjectChunk> request);
  $async.Future<$0.ProcessingStatus> getProjectStatus(
      $grpc.ServiceCall call, $0.ProjectRequest request);
}
