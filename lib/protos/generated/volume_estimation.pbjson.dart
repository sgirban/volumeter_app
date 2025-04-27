//
//  Generated code. Do not modify.
//  source: volume_estimation.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use pingRequestDescriptor instead')
const PingRequest$json = {
  '1': 'PingRequest',
};

/// Descriptor for `PingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingRequestDescriptor = $convert.base64Decode(
    'CgtQaW5nUmVxdWVzdA==');

@$core.Deprecated('Use pingResponseDescriptor instead')
const PingResponse$json = {
  '1': 'PingResponse',
  '2': [
    {'1': 'is_available', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
  ],
};

/// Descriptor for `PingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingResponseDescriptor = $convert.base64Decode(
    'CgxQaW5nUmVzcG9uc2USIQoMaXNfYXZhaWxhYmxlGAEgASgIUgtpc0F2YWlsYWJsZQ==');

@$core.Deprecated('Use projectChunkDescriptor instead')
const ProjectChunk$json = {
  '1': 'ProjectChunk',
  '2': [
    {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
    {'1': 'chunk_data', '3': 2, '4': 1, '5': 12, '10': 'chunkData'},
    {'1': 'chunk_index', '3': 3, '4': 1, '5': 5, '10': 'chunkIndex'},
    {'1': 'is_last_chunk', '3': 4, '4': 1, '5': 8, '10': 'isLastChunk'},
  ],
};

/// Descriptor for `ProjectChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectChunkDescriptor = $convert.base64Decode(
    'CgxQcm9qZWN0Q2h1bmsSHQoKcHJvamVjdF9pZBgBIAEoCVIJcHJvamVjdElkEh0KCmNodW5rX2'
    'RhdGEYAiABKAxSCWNodW5rRGF0YRIfCgtjaHVua19pbmRleBgDIAEoBVIKY2h1bmtJbmRleBIi'
    'Cg1pc19sYXN0X2NodW5rGAQgASgIUgtpc0xhc3RDaHVuaw==');

@$core.Deprecated('Use projectRequestDescriptor instead')
const ProjectRequest$json = {
  '1': 'ProjectRequest',
  '2': [
    {'1': 'project_id', '3': 1, '4': 1, '5': 9, '10': 'projectId'},
  ],
};

/// Descriptor for `ProjectRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List projectRequestDescriptor = $convert.base64Decode(
    'Cg5Qcm9qZWN0UmVxdWVzdBIdCgpwcm9qZWN0X2lkGAEgASgJUglwcm9qZWN0SWQ=');

@$core.Deprecated('Use processingStatusDescriptor instead')
const ProcessingStatus$json = {
  '1': 'ProcessingStatus',
  '2': [
    {'1': 'current_stage', '3': 1, '4': 1, '5': 14, '6': '.ProcessingStatus.Stage', '10': 'currentStage'},
    {'1': 'progress', '3': 2, '4': 1, '5': 2, '10': 'progress'},
  ],
  '4': [ProcessingStatus_Stage$json],
};

@$core.Deprecated('Use processingStatusDescriptor instead')
const ProcessingStatus_Stage$json = {
  '1': 'Stage',
  '2': [
    {'1': 'UPLOADING', '2': 0},
    {'1': 'FUSING', '2': 1},
    {'1': 'OBJECT_DETECTION', '2': 2},
    {'1': 'POISSON_PROCESSING', '2': 3},
    {'1': 'COMPLETED', '2': 4},
  ],
};

/// Descriptor for `ProcessingStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processingStatusDescriptor = $convert.base64Decode(
    'ChBQcm9jZXNzaW5nU3RhdHVzEjwKDWN1cnJlbnRfc3RhZ2UYASABKA4yFy5Qcm9jZXNzaW5nU3'
    'RhdHVzLlN0YWdlUgxjdXJyZW50U3RhZ2USGgoIcHJvZ3Jlc3MYAiABKAJSCHByb2dyZXNzIl8K'
    'BVN0YWdlEg0KCVVQTE9BRElORxAAEgoKBkZVU0lORxABEhQKEE9CSkVDVF9ERVRFQ1RJT04QAh'
    'IWChJQT0lTU09OX1BST0NFU1NJTkcQAxINCglDT01QTEVURUQQBA==');

