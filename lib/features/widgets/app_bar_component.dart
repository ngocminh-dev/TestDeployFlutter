import '../../packages/index.dart';

class AppBarComponent extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final PreferredSizeWidget? top;
  final Widget? leading;
  final Widget? action;
  final Color color;
  final Color? backButtonColor;
  final GlobalKey? widgetKey;
  final Widget? title;
  final GestureTapCallback? leadingCallback;
  final GestureTapCallback? navigateLiveChat;
  final GestureTapCallback? navigateSearchPage;
  final double scrolledUnderElevation;
  final double elevation;
  final bool centerTitle;
  final bool showLiveChat;
  final bool showSearchButton;
  final bool searching;
  final ValueChanged<String>? onSearchingTextChange;
  final Function(String)? onSubmitted;
  final TextEditingController? searchController;
  final VoidCallback? onClearSearch;
  final String? searchHintText;

  final bool sliverAppbar;
  final bool floating;
  final bool pinned;
  final double expandedHeight;
  final bool forceElevated;
  final double leadingWidth;

  /// field check overlay
  final bool overlay;

  const AppBarComponent({
    super.key,
    this.bottom,
    this.leading,
    this.action,
    this.top,
    this.widgetKey,
    this.title,
    this.leadingCallback,
    this.navigateLiveChat,
    this.navigateSearchPage,
    this.color = AppColor.white,
    this.scrolledUnderElevation = 4,
    this.elevation = 0,
    this.centerTitle = false,
    this.showSearchButton = false,
    this.searching = false,
    this.backButtonColor,
    this.onSearchingTextChange,
    this.showLiveChat = false,
    this.onSubmitted,
    this.sliverAppbar = false,
    this.floating = true,
    this.pinned = true,
    this.expandedHeight = 150,
    this.forceElevated = true,
    this.leadingWidth = 56,
    this.searchController,
    this.overlay = false,
    this.onClearSearch,
    this.searchHintText,
  });

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight +
            (bottom?.preferredSize.height ?? 0) +
            (top?.preferredSize.height ?? 0),
      );
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    Widget appbar = AppTopBar(
      key: widget.key,
      bottom: widget.bottom,
      leading: widget.leading,
      action: widget.action,
      top: widget.top,
      color: widget.color,
      widgetKey: widget.widgetKey,
      title: widget.title,
      scrolledUnderElevation: widget.scrolledUnderElevation,
      elevation: widget.elevation,
      backButtonColor: widget.backButtonColor,
      centerTitle: widget.centerTitle,
      showLiveChat: widget.showLiveChat,
      showSearchButton: widget.showSearchButton,
      searching: widget.searching,
      onSearchingTextChange: widget.onSearchingTextChange,
      searchController: widget.searchController,
      onSubmitted: widget.onSubmitted,
      sliverAppbar: widget.sliverAppbar,
      pinned: widget.pinned,
      floating: widget.floating,
      expandedHeight: widget.expandedHeight,
      forceElevated: widget.forceElevated,
      leadingWidth: widget.leadingWidth,
      onClearSearch: widget.onClearSearch,
      searchHintText: widget.searchHintText,
      leadingCallback: widget.leadingCallback ??
          () {
            Navigator.of(context).pop();
          },
      navigateSearchPage: widget.navigateSearchPage ?? () {},
      navigateLiveChat: widget.navigateLiveChat ?? () {},
    );
    if (!widget.overlay) {
      return appbar;
    }
    return Stack(
      children: [
        appbar,
        Container(
          width: context.width,
          height: widget.preferredSize.height + YDCache.topViewPadding,
          color: context.color.textTitle.withOpacity(0.6),
        )
      ],
    );
  }
}
