part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchEcommerceEvent extends HomeEvent {
  const FetchEcommerceEvent();

  @override
  List<Object> get props => [];
}

class SetSelectedIndexEvent extends HomeEvent {
  final int selectedIndex;
  const SetSelectedIndexEvent({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [
        selectedIndex,
      ];
}

class BasketButtonTappedEvent extends HomeEvent {
  final EcommerceApimodel item;

  const BasketButtonTappedEvent(this.item);
  @override
  List<Object> get props => [];
}

class AscendingSortbyPriceActivity extends HomeEvent {
  const AscendingSortbyPriceActivity();
  @override
  List<Object> get props => [];
}

class AccordingtoPriceDescendingSorting extends HomeEvent {
  const AccordingtoPriceDescendingSorting();
  @override
  List<Object> get props => [];
}

class RatingGoreDescendingRankEvent extends HomeEvent {
  const RatingGoreDescendingRankEvent();
  @override
  List<Object> get props => [];
}

class DiscountByDescendingSortingEvent extends HomeEvent {
  const DiscountByDescendingSortingEvent();
  @override
  List<Object> get props => [];
}

class FilterByCategoryEvent extends HomeEvent {
  final String category;
  const FilterByCategoryEvent({required this.category});

  @override
  List<Object> get props => [category];
}

class ShowAllProductsEvent extends HomeEvent {
  const ShowAllProductsEvent();

  @override
  List<Object> get props => [];
}
class FavoriteButtonTappedEvent extends HomeEvent {
  final EcommerceApimodel item;

  const FavoriteButtonTappedEvent(this.item);

  @override
  List<Object> get props => [item];
}