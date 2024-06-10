part of 'home_bloc.dart';

enum HomeStatus { init, loading, success, error }


class HomeState extends Equatable {
  final HomeStatus status;
  final List<EcommerceApimodel> ecommerceList;
  final List<EcommerceApimodel> allProducts;
  final int selectedIndex;
  final bool isBasketButtonTapped;
  final String? selectedCategory;
  final List<EcommerceApimodel>? basketProducts;
  final List<EcommerceApimodel>? favoriteProducts;

  const HomeState({
    required this.status,
    required this.ecommerceList,
    required this.allProducts,
    required this.selectedIndex,
    required this.isBasketButtonTapped,
    this.selectedCategory,
    this.basketProducts,
    this.favoriteProducts,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<EcommerceApimodel>? ecommerceList,
    List<EcommerceApimodel>? allProducts,
    int? selectedIndex,
    bool? isBasketButtonTapped,
    String? selectedCategory,
    List<EcommerceApimodel>? basketProducts,
    List<EcommerceApimodel>? favoriteProducts,
  }) {
    return HomeState(
      status: status ?? this.status,
      ecommerceList: ecommerceList ?? this.ecommerceList,
      allProducts: allProducts ?? this.allProducts,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isBasketButtonTapped: isBasketButtonTapped ?? this.isBasketButtonTapped,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      basketProducts: basketProducts ?? this.basketProducts,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  @override
  List<Object?> get props => [
        status,
        ecommerceList,
        allProducts,
        selectedIndex,
        isBasketButtonTapped,
        selectedCategory ?? '',
        basketProducts,
        favoriteProducts,
      ];
}
