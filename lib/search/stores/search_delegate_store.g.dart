// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_delegate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchDelegateStore on _SearchDelegateStore, Store {
  final _$queryAtom = Atom(name: '_SearchDelegateStore.query');

  @override
  String get query {
    _$queryAtom.context.enforceReadPolicy(_$queryAtom);
    _$queryAtom.reportObserved();
    return super.query;
  }

  @override
  set query(String value) {
    _$queryAtom.context.conditionallyRunInAction(() {
      super.query = value;
      _$queryAtom.reportChanged();
    }, _$queryAtom, name: '${_$queryAtom.name}_set');
  }

  final _$resultsAtom = Atom(name: '_SearchDelegateStore.results');

  @override
  ObservableFuture<GithubRepositories> get results {
    _$resultsAtom.context.enforceReadPolicy(_$resultsAtom);
    _$resultsAtom.reportObserved();
    return super.results;
  }

  @override
  set results(ObservableFuture<GithubRepositories> value) {
    _$resultsAtom.context.conditionallyRunInAction(() {
      super.results = value;
      _$resultsAtom.reportChanged();
    }, _$resultsAtom, name: '${_$resultsAtom.name}_set');
  }

  final _$_SearchDelegateStoreActionController =
      ActionController(name: '_SearchDelegateStore');

  @override
  void setQuery(String param) {
    final _$actionInfo = _$_SearchDelegateStoreActionController.startAction();
    try {
      return super.setQuery(param);
    } finally {
      _$_SearchDelegateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void search() {
    final _$actionInfo = _$_SearchDelegateStoreActionController.startAction();
    try {
      return super.search();
    } finally {
      _$_SearchDelegateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'query: ${query.toString()},results: ${results.toString()}';
    return '{$string}';
  }
}
