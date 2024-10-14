// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_history_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletHistoryRecord _$WalletHistoryRecordFromJson(Map<String, dynamic> json) {
  return _WalletHistoryRecord.fromJson(json);
}

/// @nodoc
mixin _$WalletHistoryRecord {
  String get walletId => throw _privateConstructorUsedError;
  String get network => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;
  int get blockNumber => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get txHash => throw _privateConstructorUsedError;
  String? get index => throw _privateConstructorUsedError;
  String? get contract => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get fee => throw _privateConstructorUsedError;
  WalletHistoryMetadata get metadata => throw _privateConstructorUsedError;

  /// Serializes this WalletHistoryRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletHistoryRecordCopyWith<WalletHistoryRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoryRecordCopyWith<$Res> {
  factory $WalletHistoryRecordCopyWith(
          WalletHistoryRecord value, $Res Function(WalletHistoryRecord) then) =
      _$WalletHistoryRecordCopyWithImpl<$Res, WalletHistoryRecord>;
  @useResult
  $Res call(
      {String walletId,
      String network,
      String kind,
      String direction,
      int blockNumber,
      DateTime timestamp,
      String txHash,
      String? index,
      String? contract,
      String from,
      String to,
      String value,
      String fee,
      WalletHistoryMetadata metadata});

  $WalletHistoryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$WalletHistoryRecordCopyWithImpl<$Res, $Val extends WalletHistoryRecord>
    implements $WalletHistoryRecordCopyWith<$Res> {
  _$WalletHistoryRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = null,
    Object? network = null,
    Object? kind = null,
    Object? direction = null,
    Object? blockNumber = null,
    Object? timestamp = null,
    Object? txHash = null,
    Object? index = freezed,
    Object? contract = freezed,
    Object? from = null,
    Object? to = null,
    Object? value = null,
    Object? fee = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      blockNumber: null == blockNumber
          ? _value.blockNumber
          : blockNumber // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as WalletHistoryMetadata,
    ) as $Val);
  }

  /// Create a copy of WalletHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletHistoryMetadataCopyWith<$Res> get metadata {
    return $WalletHistoryMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletHistoryRecordImplCopyWith<$Res>
    implements $WalletHistoryRecordCopyWith<$Res> {
  factory _$$WalletHistoryRecordImplCopyWith(_$WalletHistoryRecordImpl value,
          $Res Function(_$WalletHistoryRecordImpl) then) =
      __$$WalletHistoryRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String walletId,
      String network,
      String kind,
      String direction,
      int blockNumber,
      DateTime timestamp,
      String txHash,
      String? index,
      String? contract,
      String from,
      String to,
      String value,
      String fee,
      WalletHistoryMetadata metadata});

  @override
  $WalletHistoryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$WalletHistoryRecordImplCopyWithImpl<$Res>
    extends _$WalletHistoryRecordCopyWithImpl<$Res, _$WalletHistoryRecordImpl>
    implements _$$WalletHistoryRecordImplCopyWith<$Res> {
  __$$WalletHistoryRecordImplCopyWithImpl(_$WalletHistoryRecordImpl _value,
      $Res Function(_$WalletHistoryRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletId = null,
    Object? network = null,
    Object? kind = null,
    Object? direction = null,
    Object? blockNumber = null,
    Object? timestamp = null,
    Object? txHash = null,
    Object? index = freezed,
    Object? contract = freezed,
    Object? from = null,
    Object? to = null,
    Object? value = null,
    Object? fee = null,
    Object? metadata = null,
  }) {
    return _then(_$WalletHistoryRecordImpl(
      walletId: null == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      network: null == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
      blockNumber: null == blockNumber
          ? _value.blockNumber
          : blockNumber // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      txHash: null == txHash
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as String,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String?,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as WalletHistoryMetadata,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletHistoryRecordImpl implements _WalletHistoryRecord {
  const _$WalletHistoryRecordImpl(
      {required this.walletId,
      required this.network,
      required this.kind,
      required this.direction,
      required this.blockNumber,
      required this.timestamp,
      required this.txHash,
      required this.index,
      required this.contract,
      required this.from,
      required this.to,
      required this.value,
      required this.fee,
      required this.metadata});

  factory _$WalletHistoryRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletHistoryRecordImplFromJson(json);

  @override
  final String walletId;
  @override
  final String network;
  @override
  final String kind;
  @override
  final String direction;
  @override
  final int blockNumber;
  @override
  final DateTime timestamp;
  @override
  final String txHash;
  @override
  final String? index;
  @override
  final String? contract;
  @override
  final String from;
  @override
  final String to;
  @override
  final String value;
  @override
  final String fee;
  @override
  final WalletHistoryMetadata metadata;

  @override
  String toString() {
    return 'WalletHistoryRecord(walletId: $walletId, network: $network, kind: $kind, direction: $direction, blockNumber: $blockNumber, timestamp: $timestamp, txHash: $txHash, index: $index, contract: $contract, from: $from, to: $to, value: $value, fee: $fee, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletHistoryRecordImpl &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.blockNumber, blockNumber) ||
                other.blockNumber == blockNumber) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.txHash, txHash) || other.txHash == txHash) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      walletId,
      network,
      kind,
      direction,
      blockNumber,
      timestamp,
      txHash,
      index,
      contract,
      from,
      to,
      value,
      fee,
      metadata);

  /// Create a copy of WalletHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletHistoryRecordImplCopyWith<_$WalletHistoryRecordImpl> get copyWith =>
      __$$WalletHistoryRecordImplCopyWithImpl<_$WalletHistoryRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletHistoryRecordImplToJson(
      this,
    );
  }
}

abstract class _WalletHistoryRecord implements WalletHistoryRecord {
  const factory _WalletHistoryRecord(
          {required final String walletId,
          required final String network,
          required final String kind,
          required final String direction,
          required final int blockNumber,
          required final DateTime timestamp,
          required final String txHash,
          required final String? index,
          required final String? contract,
          required final String from,
          required final String to,
          required final String value,
          required final String fee,
          required final WalletHistoryMetadata metadata}) =
      _$WalletHistoryRecordImpl;

  factory _WalletHistoryRecord.fromJson(Map<String, dynamic> json) =
      _$WalletHistoryRecordImpl.fromJson;

  @override
  String get walletId;
  @override
  String get network;
  @override
  String get kind;
  @override
  String get direction;
  @override
  int get blockNumber;
  @override
  DateTime get timestamp;
  @override
  String get txHash;
  @override
  String? get index;
  @override
  String? get contract;
  @override
  String get from;
  @override
  String get to;
  @override
  String get value;
  @override
  String get fee;
  @override
  WalletHistoryMetadata get metadata;

  /// Create a copy of WalletHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletHistoryRecordImplCopyWith<_$WalletHistoryRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
