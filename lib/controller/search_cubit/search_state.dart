part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchByCityLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchByCitySuccessState extends SearchState {

  const SearchByCitySuccessState();
  @override
  List<Object> get props => [];
}

class SearchByCityErrorState extends SearchState {
  final String error;

  const SearchByCityErrorState({required this.error});
  @override
  List<Object> get props => [error];
}