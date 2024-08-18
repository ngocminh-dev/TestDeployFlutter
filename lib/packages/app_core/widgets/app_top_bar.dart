import 'package:flutter/services.dart';
import 'package:photo_ai/generated/assets.dart';
import 'package:photo_ai/generated/l10n.dart';
import 'package:photo_ai/packages/index.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final PreferredSizeWidget? top;
  final Widget? leading;
  final Widget? action;
  final Color? backButtonColor;
  final GlobalKey? widgetKey;
  final Widget? title;
  final Color color;
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

  const AppTopBar({
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
    required this.color,
    this.scrolledUnderElevation = 2,
    this.elevation = 0,
    this.backButtonColor,
    this.centerTitle = false,
    this.showLiveChat = true,
    this.showSearchButton = false,
    this.searching = false,
    this.onSearchingTextChange,
    this.onSubmitted,
    this.sliverAppbar = false,
    this.floating = true,
    this.pinned = true,
    this.expandedHeight = 150,
    this.forceElevated = true,
    this.leadingWidth = 56,
    this.searchController,
    this.onClearSearch,
    this.searchHintText,
  });

  @override
  Widget build(BuildContext context) {
    return sliverAppbar
        ? SliverAppBar(
            floating: floating,
            pinned: pinned,
            expandedHeight: expandedHeight,
            forceElevated: forceElevated,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: context.color.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: color,
            scrolledUnderElevation: scrolledUnderElevation,
            surfaceTintColor: color,
            shadowColor: context.color.colorShadow,
            elevation: elevation,
            bottom: bottom,
            titleSpacing: 0,
            leading: leading ??
                IconButton(
                  splashRadius: 25,
                  onPressed: leadingCallback ??
                      () {
                        Navigator.of(context).pop();
                      },
                  icon: AppImage(
                    asset: Assets.outlineArrowLeft2,
                    height: 40,
                    width: 40,
                    color: backButtonColor ?? context.color.black,
                    fit: BoxFit.scaleDown,
                  ),
                ),
            title: searching ? _buildSearchWidget(context) : title,
            centerTitle: centerTitle,
            actions: searching
                ? null
                : [
                    if (showSearchButton)
                      Container(
                        margin: EdgeInsets.only(left: context.padding4X),
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: IconButton(
                          splashRadius: 25,
                          onPressed: navigateSearchPage,
                          icon: const AppImage(
                            asset: Assets.customSearchNormal,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    if (showLiveChat)
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          splashRadius: 25,
                          onPressed: navigateLiveChat,
                          icon: const AppImage(
                            asset: Assets.customZalo,
                            width: 40,
                            height: 40,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    if (action != null) action!,
                  ],
          )
        : AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: context.color.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: color,
            scrolledUnderElevation: scrolledUnderElevation,
            surfaceTintColor: color,
            shadowColor: context.color.colorShadow,
            leadingWidth: leadingWidth,
            elevation: elevation,
            bottom: bottom,
            titleSpacing: 0,
            leading: leading ??
                IconButton(
                  splashRadius: 25,
                  onPressed: leadingCallback ??
                      () {
                        Navigator.of(context).pop();
                      },
                  icon: AppImage(
                    asset: Assets.outlineArrowLeft2,
                    height: 40,
                    width: 40,
                    color: backButtonColor ?? context.color.black,
                    fit: BoxFit.scaleDown,
                  ),
                ),
            title: searching ? _buildSearchWidget(context) : title,
            centerTitle: centerTitle,
            actions: searching && action == null
                ? null
                : [
                    if (showSearchButton)
                      Container(
                        margin: EdgeInsets.only(left: context.padding4X),
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: IconButton(
                          splashRadius: 25,
                          onPressed: navigateSearchPage,
                          icon: const AppImage(
                            asset: Assets.customSearchNormal,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    if (showLiveChat)
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          splashRadius: 25,
                          onPressed: navigateLiveChat,
                          icon: const AppImage(
                            asset: Assets.customZalo,
                            width: 40,
                            height: 40,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    if (action != null) action!,
                  ],
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight +
            (bottom?.preferredSize.height ?? 0) +
            (top?.preferredSize.height ?? 0),
      );

  Widget _buildSearchWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.padding16X),
      child: AppSearchFormField(
        hint: searchHintText ?? AppLocale.of(context).common_search,
        autofocus: true,
        textEditingController: searchController,
        hasPrefix: false,
        onSubmitted: onSubmitted,
        onChanged: (value) {
          if (onSearchingTextChange != null) {
            onSearchingTextChange!(value);
          }
        },
        onEditingComplete: () {},
        onCancel: onClearSearch,
        backgroundColor: context.color.backgroundLight1,
        borderColor: context.color.backgroundLight1,
      ),
    );
  }
}
