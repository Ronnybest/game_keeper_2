// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingGame,
    required TResult Function(
            FullGameModel game, GameScreenshotsModel screenshots)
        loadedGame,
    required TResult Function(dynamic message) errorGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingGame,
    TResult? Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult? Function(dynamic message)? errorGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingGame,
    TResult Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult Function(dynamic message)? errorGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingGame value) loadingGame,
    required TResult Function(_LoadedGame value) loadedGame,
    required TResult Function(_ErrorGame value) errorGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingGame value)? loadingGame,
    TResult? Function(_LoadedGame value)? loadedGame,
    TResult? Function(_ErrorGame value)? errorGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingGame value)? loadingGame,
    TResult Function(_LoadedGame value)? loadedGame,
    TResult Function(_ErrorGame value)? errorGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameViewStateCopyWith<$Res> {
  factory $GameViewStateCopyWith(
          GameViewState value, $Res Function(GameViewState) then) =
      _$GameViewStateCopyWithImpl<$Res, GameViewState>;
}

/// @nodoc
class _$GameViewStateCopyWithImpl<$Res, $Val extends GameViewState>
    implements $GameViewStateCopyWith<$Res> {
  _$GameViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GameViewStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GameViewState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingGame,
    required TResult Function(
            FullGameModel game, GameScreenshotsModel screenshots)
        loadedGame,
    required TResult Function(dynamic message) errorGame,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingGame,
    TResult? Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult? Function(dynamic message)? errorGame,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingGame,
    TResult Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult Function(dynamic message)? errorGame,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingGame value) loadingGame,
    required TResult Function(_LoadedGame value) loadedGame,
    required TResult Function(_ErrorGame value) errorGame,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingGame value)? loadingGame,
    TResult? Function(_LoadedGame value)? loadedGame,
    TResult? Function(_ErrorGame value)? errorGame,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingGame value)? loadingGame,
    TResult Function(_LoadedGame value)? loadedGame,
    TResult Function(_ErrorGame value)? errorGame,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GameViewState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingGameImplCopyWith<$Res> {
  factory _$$LoadingGameImplCopyWith(
          _$LoadingGameImpl value, $Res Function(_$LoadingGameImpl) then) =
      __$$LoadingGameImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingGameImplCopyWithImpl<$Res>
    extends _$GameViewStateCopyWithImpl<$Res, _$LoadingGameImpl>
    implements _$$LoadingGameImplCopyWith<$Res> {
  __$$LoadingGameImplCopyWithImpl(
      _$LoadingGameImpl _value, $Res Function(_$LoadingGameImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingGameImpl implements _LoadingGame {
  const _$LoadingGameImpl();

  @override
  String toString() {
    return 'GameViewState.loadingGame()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingGameImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingGame,
    required TResult Function(
            FullGameModel game, GameScreenshotsModel screenshots)
        loadedGame,
    required TResult Function(dynamic message) errorGame,
  }) {
    return loadingGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingGame,
    TResult? Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult? Function(dynamic message)? errorGame,
  }) {
    return loadingGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingGame,
    TResult Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult Function(dynamic message)? errorGame,
    required TResult orElse(),
  }) {
    if (loadingGame != null) {
      return loadingGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingGame value) loadingGame,
    required TResult Function(_LoadedGame value) loadedGame,
    required TResult Function(_ErrorGame value) errorGame,
  }) {
    return loadingGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingGame value)? loadingGame,
    TResult? Function(_LoadedGame value)? loadedGame,
    TResult? Function(_ErrorGame value)? errorGame,
  }) {
    return loadingGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingGame value)? loadingGame,
    TResult Function(_LoadedGame value)? loadedGame,
    TResult Function(_ErrorGame value)? errorGame,
    required TResult orElse(),
  }) {
    if (loadingGame != null) {
      return loadingGame(this);
    }
    return orElse();
  }
}

abstract class _LoadingGame implements GameViewState {
  const factory _LoadingGame() = _$LoadingGameImpl;
}

/// @nodoc
abstract class _$$LoadedGameImplCopyWith<$Res> {
  factory _$$LoadedGameImplCopyWith(
          _$LoadedGameImpl value, $Res Function(_$LoadedGameImpl) then) =
      __$$LoadedGameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FullGameModel game, GameScreenshotsModel screenshots});
}

/// @nodoc
class __$$LoadedGameImplCopyWithImpl<$Res>
    extends _$GameViewStateCopyWithImpl<$Res, _$LoadedGameImpl>
    implements _$$LoadedGameImplCopyWith<$Res> {
  __$$LoadedGameImplCopyWithImpl(
      _$LoadedGameImpl _value, $Res Function(_$LoadedGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? game = null,
    Object? screenshots = null,
  }) {
    return _then(_$LoadedGameImpl(
      null == game
          ? _value.game
          : game // ignore: cast_nullable_to_non_nullable
              as FullGameModel,
      null == screenshots
          ? _value.screenshots
          : screenshots // ignore: cast_nullable_to_non_nullable
              as GameScreenshotsModel,
    ));
  }
}

/// @nodoc

class _$LoadedGameImpl implements _LoadedGame {
  const _$LoadedGameImpl(this.game, this.screenshots);

  @override
  final FullGameModel game;
  @override
  final GameScreenshotsModel screenshots;

  @override
  String toString() {
    return 'GameViewState.loadedGame(game: $game, screenshots: $screenshots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedGameImpl &&
            (identical(other.game, game) || other.game == game) &&
            (identical(other.screenshots, screenshots) ||
                other.screenshots == screenshots));
  }

  @override
  int get hashCode => Object.hash(runtimeType, game, screenshots);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedGameImplCopyWith<_$LoadedGameImpl> get copyWith =>
      __$$LoadedGameImplCopyWithImpl<_$LoadedGameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingGame,
    required TResult Function(
            FullGameModel game, GameScreenshotsModel screenshots)
        loadedGame,
    required TResult Function(dynamic message) errorGame,
  }) {
    return loadedGame(game, screenshots);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingGame,
    TResult? Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult? Function(dynamic message)? errorGame,
  }) {
    return loadedGame?.call(game, screenshots);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingGame,
    TResult Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult Function(dynamic message)? errorGame,
    required TResult orElse(),
  }) {
    if (loadedGame != null) {
      return loadedGame(game, screenshots);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingGame value) loadingGame,
    required TResult Function(_LoadedGame value) loadedGame,
    required TResult Function(_ErrorGame value) errorGame,
  }) {
    return loadedGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingGame value)? loadingGame,
    TResult? Function(_LoadedGame value)? loadedGame,
    TResult? Function(_ErrorGame value)? errorGame,
  }) {
    return loadedGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingGame value)? loadingGame,
    TResult Function(_LoadedGame value)? loadedGame,
    TResult Function(_ErrorGame value)? errorGame,
    required TResult orElse(),
  }) {
    if (loadedGame != null) {
      return loadedGame(this);
    }
    return orElse();
  }
}

abstract class _LoadedGame implements GameViewState {
  const factory _LoadedGame(
          final FullGameModel game, final GameScreenshotsModel screenshots) =
      _$LoadedGameImpl;

  FullGameModel get game;
  GameScreenshotsModel get screenshots;
  @JsonKey(ignore: true)
  _$$LoadedGameImplCopyWith<_$LoadedGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorGameImplCopyWith<$Res> {
  factory _$$ErrorGameImplCopyWith(
          _$ErrorGameImpl value, $Res Function(_$ErrorGameImpl) then) =
      __$$ErrorGameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class __$$ErrorGameImplCopyWithImpl<$Res>
    extends _$GameViewStateCopyWithImpl<$Res, _$ErrorGameImpl>
    implements _$$ErrorGameImplCopyWith<$Res> {
  __$$ErrorGameImplCopyWithImpl(
      _$ErrorGameImpl _value, $Res Function(_$ErrorGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorGameImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ErrorGameImpl implements _ErrorGame {
  const _$ErrorGameImpl(this.message);

  @override
  final dynamic message;

  @override
  String toString() {
    return 'GameViewState.errorGame(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorGameImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorGameImplCopyWith<_$ErrorGameImpl> get copyWith =>
      __$$ErrorGameImplCopyWithImpl<_$ErrorGameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadingGame,
    required TResult Function(
            FullGameModel game, GameScreenshotsModel screenshots)
        loadedGame,
    required TResult Function(dynamic message) errorGame,
  }) {
    return errorGame(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadingGame,
    TResult? Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult? Function(dynamic message)? errorGame,
  }) {
    return errorGame?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadingGame,
    TResult Function(FullGameModel game, GameScreenshotsModel screenshots)?
        loadedGame,
    TResult Function(dynamic message)? errorGame,
    required TResult orElse(),
  }) {
    if (errorGame != null) {
      return errorGame(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingGame value) loadingGame,
    required TResult Function(_LoadedGame value) loadedGame,
    required TResult Function(_ErrorGame value) errorGame,
  }) {
    return errorGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingGame value)? loadingGame,
    TResult? Function(_LoadedGame value)? loadedGame,
    TResult? Function(_ErrorGame value)? errorGame,
  }) {
    return errorGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingGame value)? loadingGame,
    TResult Function(_LoadedGame value)? loadedGame,
    TResult Function(_ErrorGame value)? errorGame,
    required TResult orElse(),
  }) {
    if (errorGame != null) {
      return errorGame(this);
    }
    return orElse();
  }
}

abstract class _ErrorGame implements GameViewState {
  const factory _ErrorGame(final dynamic message) = _$ErrorGameImpl;

  dynamic get message;
  @JsonKey(ignore: true)
  _$$ErrorGameImplCopyWith<_$ErrorGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameViewEvent {
  int get gameId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int gameId) fetchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int gameId)? fetchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int gameId)? fetchGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchGame value) fetchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchGame value)? fetchGame,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchGame value)? fetchGame,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameViewEventCopyWith<GameViewEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameViewEventCopyWith<$Res> {
  factory $GameViewEventCopyWith(
          GameViewEvent value, $Res Function(GameViewEvent) then) =
      _$GameViewEventCopyWithImpl<$Res, GameViewEvent>;
  @useResult
  $Res call({int gameId});
}

/// @nodoc
class _$GameViewEventCopyWithImpl<$Res, $Val extends GameViewEvent>
    implements $GameViewEventCopyWith<$Res> {
  _$GameViewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
  }) {
    return _then(_value.copyWith(
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchGameImplCopyWith<$Res>
    implements $GameViewEventCopyWith<$Res> {
  factory _$$FetchGameImplCopyWith(
          _$FetchGameImpl value, $Res Function(_$FetchGameImpl) then) =
      __$$FetchGameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int gameId});
}

/// @nodoc
class __$$FetchGameImplCopyWithImpl<$Res>
    extends _$GameViewEventCopyWithImpl<$Res, _$FetchGameImpl>
    implements _$$FetchGameImplCopyWith<$Res> {
  __$$FetchGameImplCopyWithImpl(
      _$FetchGameImpl _value, $Res Function(_$FetchGameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
  }) {
    return _then(_$FetchGameImpl(
      null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchGameImpl implements _FetchGame {
  const _$FetchGameImpl(this.gameId);

  @override
  final int gameId;

  @override
  String toString() {
    return 'GameViewEvent.fetchGame(gameId: $gameId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchGameImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gameId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchGameImplCopyWith<_$FetchGameImpl> get copyWith =>
      __$$FetchGameImplCopyWithImpl<_$FetchGameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int gameId) fetchGame,
  }) {
    return fetchGame(gameId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int gameId)? fetchGame,
  }) {
    return fetchGame?.call(gameId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int gameId)? fetchGame,
    required TResult orElse(),
  }) {
    if (fetchGame != null) {
      return fetchGame(gameId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchGame value) fetchGame,
  }) {
    return fetchGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchGame value)? fetchGame,
  }) {
    return fetchGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchGame value)? fetchGame,
    required TResult orElse(),
  }) {
    if (fetchGame != null) {
      return fetchGame(this);
    }
    return orElse();
  }
}

abstract class _FetchGame implements GameViewEvent {
  const factory _FetchGame(final int gameId) = _$FetchGameImpl;

  @override
  int get gameId;
  @override
  @JsonKey(ignore: true)
  _$$FetchGameImplCopyWith<_$FetchGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
