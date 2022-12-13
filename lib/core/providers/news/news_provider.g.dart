// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_provider.dart';

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

String $newsServiceHash() => r'fa70587e811b5150a7f95a4fda414bb550f3288d';

/// Creating news services with code generations
///
/// Copied from [newsService].
class NewsServiceProvider extends AutoDisposeProvider<NewsService> {
  NewsServiceProvider({
    required this.cancelToken,
  }) : super(
          (ref) => newsService(
            ref,
            cancelToken: cancelToken,
          ),
          from: newsServiceProvider,
          name: r'newsServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $newsServiceHash,
        );

  final CancelToken cancelToken;

  @override
  bool operator ==(Object other) {
    return other is NewsServiceProvider && other.cancelToken == cancelToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cancelToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef NewsServiceRef = AutoDisposeProviderRef<NewsService>;

/// Creating news services with code generations
///
/// Copied from [newsService].
final newsServiceProvider = NewsServiceFamily();

class NewsServiceFamily extends Family<NewsService> {
  NewsServiceFamily();

  NewsServiceProvider call({
    required CancelToken cancelToken,
  }) {
    return NewsServiceProvider(
      cancelToken: cancelToken,
    );
  }

  @override
  AutoDisposeProvider<NewsService> getProviderOverride(
    covariant NewsServiceProvider provider,
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
  String? get name => r'newsServiceProvider';
}
