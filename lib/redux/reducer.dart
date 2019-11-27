import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

final reducer = combineReducers<AppState>([
  TypedReducer<AppState, NavigateToNext>(_navigateToNextReducer),
  TypedReducer<AppState, NavigateToNextAndReplace>(_navigateToNextAndReplaceReducer),
  TypedReducer<AppState, NavigateBack>(_navigateBackReducer)
]);

AppState _navigateToNextReducer(AppState appState, NavigateToNext action) {
  return appState.copy(
      activePages: appState.activePages..add(action.destination)
  );
}

AppState _navigateToNextAndReplaceReducer(AppState appState, NavigateToNextAndReplace action) {
  return appState.copy(
      activePages: appState.activePages..removeLast()..add(action.destination)
  );
}

AppState _navigateBackReducer(AppState appState, NavigateBack action) {
  return appState.copy(
      activePages: appState.activePages..removeLast()
  );
}