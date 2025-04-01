import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/providers/shared_preferences_provider.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(ref);
});

final currentPageProvider = Provider<int>((ref) {
  return ref.watch(homeControllerProvider).currentPage;
});

class HomeController extends StateNotifier<HomeState> {
  final Ref ref;
  HomeController(this.ref)
      : super(HomeState(
          currentPage: ref.read(sharedPreferencesProvider).getPageNumber(),
        )) {
    carouselController = CarouselSliderController();
  }

  late CarouselSliderController carouselController;

  SharedPreferencesService get prefs => ref.read(sharedPreferencesProvider);

  void toggleMenu() {
    state = state.toggleMenu();
  }

  void toggleBookmarkMenu() {
    state = state.toggleBookmarkMenu();
  }

  void goToPage(int page) {
    carouselController.jumpToPage(page - 1);
    state = state.setCurrentPageWithJump(page);
    updatePageInPrefs();
  }

  void setCurrentPage(int page) {
    state = state.setCurrentPage(page);
    updatePageInPrefs();
  }

  void updatePageInPrefs() {
    prefs.setPageNumber(state.currentPage);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.currentPage = 1,
    this.isShowMenu = false,
    this.isShowBookmarkMenu = false,
  });

  final int currentPage;
  final bool isShowMenu;
  final bool isShowBookmarkMenu;

  HomeState copyWith({
    int? currentPage,
    bool? isShowMenu,
    bool? isShowBookmarkMenu,
  }) {
    return HomeState(
      currentPage: currentPage ?? this.currentPage,
      isShowMenu: isShowMenu ?? this.isShowMenu,
      isShowBookmarkMenu: isShowBookmarkMenu ?? this.isShowBookmarkMenu,
    );
  }

  HomeState setCurrentPage(int currentPage) {
    return copyWith(currentPage: currentPage);
  }

  HomeState setCurrentPageWithJump(int currentPage) {
    return copyWith(
      currentPage: currentPage,
      isShowBookmarkMenu: false,
      isShowMenu: false,
    );
  }

  HomeState toggleMenu() {
    return copyWith(
      isShowMenu: !isShowMenu,
      isShowBookmarkMenu: false,
    );
  }

  HomeState toggleBookmarkMenu() {
    return copyWith(isShowBookmarkMenu: !isShowBookmarkMenu);
  }

  @override
  List<Object?> get props => [currentPage, isShowBookmarkMenu, isShowMenu];
}
