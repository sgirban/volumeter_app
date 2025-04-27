//
//  Generated code. Do not modify.
//  source: volume_estimation.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ProcessingStatus_Stage extends $pb.ProtobufEnum {
  static const ProcessingStatus_Stage UPLOADING = ProcessingStatus_Stage._(0, _omitEnumNames ? '' : 'UPLOADING');
  static const ProcessingStatus_Stage FUSING = ProcessingStatus_Stage._(1, _omitEnumNames ? '' : 'FUSING');
  static const ProcessingStatus_Stage OBJECT_DETECTION = ProcessingStatus_Stage._(2, _omitEnumNames ? '' : 'OBJECT_DETECTION');
  static const ProcessingStatus_Stage POISSON_PROCESSING = ProcessingStatus_Stage._(3, _omitEnumNames ? '' : 'POISSON_PROCESSING');
  static const ProcessingStatus_Stage COMPLETED = ProcessingStatus_Stage._(4, _omitEnumNames ? '' : 'COMPLETED');

  static const $core.List<ProcessingStatus_Stage> values = <ProcessingStatus_Stage> [
    UPLOADING,
    FUSING,
    OBJECT_DETECTION,
    POISSON_PROCESSING,
    COMPLETED,
  ];

  static final $core.Map<$core.int, ProcessingStatus_Stage> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProcessingStatus_Stage? valueOf($core.int value) => _byValue[value];

  const ProcessingStatus_Stage._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
