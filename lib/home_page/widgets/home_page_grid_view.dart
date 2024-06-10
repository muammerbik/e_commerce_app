import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mami_onesignal_flutter/home_page/bloc/home_bloc.dart';
import 'package:mami_onesignal_flutter/home_page/widgets/custom_card.dart';

class HomePgaeGridView extends StatefulWidget {
  const HomePgaeGridView({super.key});

  @override
  State<HomePgaeGridView> createState() => _HomePgaeGridViewState();
}

class _HomePgaeGridViewState extends State<HomePgaeGridView> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: "credential");
    debugPrint(" ÇIKTI: $value");
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<HomeBloc>();
    bloc.add(const FetchEcommerceEvent());
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.status == HomeStatus.success) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: state.ecommerceList.length,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.50,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = state.ecommerceList[index];
                    final isSelected = state.basketProducts
                            ?.any((element) => element.name == item.name) ??
                        false;
                    return CustomCard(
                      discount: 0,
                      item: item,
                      index: index,
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
              child: Text("An error occurred while loading products"));
        }
      },
    );
  }
}
