import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mami_onesignal_flutter/service/ecommerce_api_model.dart';
import 'package:mami_onesignal_flutter/service/ecommerce_api_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final EcommerceApiService apiService = EcommerceApiService();

  HomeBloc()
      : super(
          const HomeState(
            status: HomeStatus.init,
            ecommerceList: [],
            allProducts: [],
            selectedIndex: 0,
            isBasketButtonTapped: false,
            basketProducts: [],
          ),
        ) {
    on<FetchEcommerceEvent>(_onFetchEcommerceEvent);
    on<SetSelectedIndexEvent>(onSetSelectedIndex);
    on<BasketButtonTappedEvent>(_onBasketButtonTapped);
      on<FavoriteButtonTappedEvent>(_onFavoriteButtonTapped);
    on<AscendingSortbyPriceActivity>(_onFiyataGoreArtanSiralama);
    on<AccordingtoPriceDescendingSorting>(_onFiyataGoreAzalanSiralama);
    on<RatingGoreDescendingRankEvent>(_onRatingeGoreAzalanSiralama);
    on<DiscountByDescendingSortingEvent>(_onIndirimeGoreAzalanSiralama);
    on<FilterByCategoryEvent>(_onFilterByCategory);
    on<ShowAllProductsEvent>(_onShowAllProducts);
  }

  Future<void> _onFetchEcommerceEvent(
    FetchEcommerceEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final productList = await apiService.fetchProducts();
      emit(state.copyWith(
        status: HomeStatus.success,
        ecommerceList: productList,
        allProducts: productList, 
      ));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
   void _onFavoriteButtonTapped(
    FavoriteButtonTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    final item = event.item;
    var favoriteProducts = state.favoriteProducts == null
        ? <EcommerceApimodel>[]
        : [...state.favoriteProducts!];
    if (favoriteProducts.any((element) => element.name == item.name)) {
      favoriteProducts.removeWhere((element) => element.name == item.name);
    } else {
      favoriteProducts.add(item);
    }

    emit(state.copyWith(favoriteProducts: favoriteProducts));
  }

  void onSetSelectedIndex(
      SetSelectedIndexEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
        selectedIndex: event.selectedIndex,
      ),
    );
  }

  void _onBasketButtonTapped(
    BasketButtonTappedEvent event,
    Emitter<HomeState> emit,
  ) {
    final item = event.item;
    var basketProducts = state.basketProducts == null
        ? <EcommerceApimodel>[]
        : [...state.basketProducts!];
    if (basketProducts.any((element) => element.name == item.name)) {
      basketProducts.removeWhere((element) => element.name == item.name);
    } else {
      basketProducts.add(item);
    }

    emit(state.copyWith(
      basketProducts: basketProducts,
      isBasketButtonTapped: basketProducts.isNotEmpty,
    ));
  }

  void _onFiyataGoreArtanSiralama(
    AscendingSortbyPriceActivity event,
    Emitter<HomeState> emit,
  ) {
    List<EcommerceApimodel> siraliListe = List.from(state.ecommerceList);
    siraliListe.sort((a, b) => a.price!.compareTo(b.price!));
    emit(state.copyWith(ecommerceList: siraliListe));
  }

  void _onFiyataGoreAzalanSiralama(
    AccordingtoPriceDescendingSorting event,
    Emitter<HomeState> emit,
  ) {
    List<EcommerceApimodel> siraliListe = List.from(state.ecommerceList);
    siraliListe.sort((a, b) => b.price!.compareTo(a.price!));
    emit(state.copyWith(ecommerceList: siraliListe));
  }

  void _onRatingeGoreAzalanSiralama(
    RatingGoreDescendingRankEvent event,
    Emitter<HomeState> emit,
  ) {
    List<EcommerceApimodel> siraliListe = List.from(state.ecommerceList);
    siraliListe.sort((a, b) => b.rating!.compareTo(a.rating!));
    emit(state.copyWith(ecommerceList: siraliListe));
  }

  void _onIndirimeGoreAzalanSiralama(
    DiscountByDescendingSortingEvent event,
    Emitter<HomeState> emit,
  ) {
    List<EcommerceApimodel> siraliListe = List.from(state.ecommerceList);
    siraliListe.sort((a, b) => b.discount!.compareTo(a.discount!));
    emit(state.copyWith(ecommerceList: siraliListe));
  }

  void _onFilterByCategory(
    FilterByCategoryEvent event,
    Emitter<HomeState> emit,
  ) {
    List<EcommerceApimodel> filteredList = state.allProducts
        .where((product) => product.category == event.category)
        .toList();
    emit(state.copyWith(
        ecommerceList: filteredList, selectedCategory: event.category));
  }

  void _onShowAllProducts(
    ShowAllProductsEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(ecommerceList: state.allProducts));
  }
}
