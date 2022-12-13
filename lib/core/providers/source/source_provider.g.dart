// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $sourceServiceHash() => r'f4fe5f0bc915d5546ad3131661bf5d355edf11b1';

/// Creating source service with code generations
///
/// Copied from [sourceService].
class SourceServiceProvider extends AutoDisposeProvider<SourceService> {
  SourceServiceProvider({
    required this.cancelToken,
  }) : super(
          (ref) => sourceService(
            ref,
            cancelToken: cancelToken,
          ),
          from: sourceServiceProvider,
          name: r'sourceServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $sourceServiceHash,
        );

  final CancelToken cancelToken;

  @override
  bool operator ==(Object other) {
    return other is SourceServiceProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SourceServiceRef = AutoDisposeProviderRef<SourceService>;

/// Creating source service with code generations
///
/// Copied from [sourceService].
final sourceServiceProvider = SourceServiceFamily();

class SourceServiceFamily extends Family<SourceService> {
  SourceServiceFamily();

  SourceServiceProvider call({
    required CancelToken cancelToken,
  }) {
    return SourceServiceProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  AutoDisposeProvider<SourceService> getProviderOverride(
    covariant SourceServiceProvider provider,
  ) {
    return call(
      cancelToken: provider.cancelToken,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sourceServiceProvider';
}
