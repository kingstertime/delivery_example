/*
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

const double kTabHeight = 46.0;
const double addToCartButtonHeight = 36.0;

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  TabController? tabController;
  final scrollController = AutoScrollController();
  late final BehaviorSubject<bool> tabPressScrollRunning;

  @override
  void initState() {
    super.initState();
    tabPressScrollRunning = BehaviorSubject<bool>.seeded(false);
    addSubscription(service<ProductService>().productsStream.listen((positionList) {
      tabController?.dispose();
      if (mounted) {
        tabController = TabController(length: positionList.length, vsync: this);
      }
    }));

    addSubscription(tabPressScrollRunning
        .delay(const Duration(milliseconds: 500))
        .switchMap<VisibilityInfoWrapper>(
            (isRunning) => isRunning ? NeverStream() : scrollItemVisibility)
        .listen((infoWrapper) {
      final currentOffset = scrollController.offset;
      final ctx = scrollController.tagMap[infoWrapper.index]?.context;
      if (ctx != null) {
        final revealedOffset = _offsetToRevealInViewport(ctx, 0.0);
        final localTabController = tabController;
        final shiftedCurrentOffset = currentOffset + 80;
        if (shiftedCurrentOffset > revealedOffset.offset &&
            shiftedCurrentOffset < revealedOffset.offset + infoWrapper.info.size.height &&
            localTabController != null &&
            localTabController.index != infoWrapper.index) {
          localTabController.animateTo(infoWrapper.index,
              duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
        }
      }
    }));
  }

  // Method copied from scroll_to_index lib
  //
  /// return offset, which is a absolute offset to bring the target index object into the center of the viewport
  /// see also: _directionalOffsetToRevealInViewport()
  */
/*RevealedOffset _offsetToRevealInViewport(BuildContext ctx, double alignment) {
    final renderBox = ctx.findRenderObject()!;
    assert(Scrollable.of(ctx) != null);
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(renderBox)!;
    final revealedOffset = viewport.getOffsetToReveal(renderBox, alignment);
    return revealedOffset;
  }*/ /*


  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    final themeData = Theme.of(context);
    return StreamBuilder<Iterable<Section>?>(
        stream: productsStream,
        builder: (context, positionsSnapshot) {
          final positionsSnapshotData = positionsSnapshot.data;
          return DefaultTabController(
              length: positionsSnapshotData == null ? 0 : positionsSnapshotData.length,
              child: Scaffold(
                  backgroundColor: designExtension?.secondaryBackgroundColor,
                  body: _buildSectionList(themeData, positionsSnapshotData)));
        });
  }

  Widget _buildSectionList(ThemeData themeData, Iterable<Section>? positionsSnapshotData) {
    return positionsSnapshotData == null
        ? const SizedBox.expand()
        : _buildCustomScrollView(themeData, positionsSnapshotData);
  }

  Widget _buildCustomScrollView(ThemeData themeData, Iterable<Section> positionsSnapshotData) {
    final designExtension = themeData.extension<AppDesignExtension>();
    return CustomScrollView(controller: scrollController, slivers: [
      _buildSliverAppBar(themeData, positionsSnapshotData),
      SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: designExtension?.grid == ProductListStyle.twoPhotos ? 12 : 16),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  _buildIndexedItemBuilder(themeData, positionsSnapshotData),
                  childCount: positionsSnapshotData.length)))
    ]);
  }

  IndexedWidgetBuilder _buildIndexedItemBuilder(
      ThemeData themeData, Iterable<Section> positionsSnapshotData) {
    final secondaryFontColor = themeData.extension<AppDesignExtension>()?.secondaryFontColor;
    return (BuildContext context, int index) {
      final section = positionsSnapshotData.elementAt(index);
      return AutoScrollTag(
          key: ValueKey(index),
          controller: scrollController,
          index: index,
          child: VisibilityDetector(
              key: ValueKey(index),
              onVisibilityChanged: (VisibilityInfo info) {
                if (!scrollItemVisibility.isClosed) {
                  scrollItemVisibility.add(VisibilityInfoWrapper(index: index, info: info));
                }
              },
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                    height: sectionHeaderHeight,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(section.name.toUpperCase(),
                            style: Styles.displayBold12
                                .copyWith(color: secondaryFontColor?.withOpacity(0.5))))),
                ...(AppDesignExtension? appDesignExtension) {
                  Iterable<Widget> result;
                  switch (appDesignExtension?.grid) {
                    case ProductListStyle.onePhoto:
                      result = _buildProductListLargeItems(themeData, section.products);
                      break;
                    case ProductListStyle.list:
                      result = _buildProductListSmallItems(themeData, section.products);
                      break;
                    case ProductListStyle.twoPhotos:
                    default:
                      result = _buildProductGrid(themeData, section.products);
                  }
                  return result;
                }(themeData.extension<AppDesignExtension>()),
                const SizedBox(height: 16)
              ])));
    };
  }

  Widget _buildSliverAppBar(ThemeData themeData, Iterable<Section> positionsSnapshotData) {
    final designExtension = themeData.extension<AppDesignExtension>();
    final appDesignSchema = designExtension?.appDesignSchema;
    return SliverAppBar(
        title: Text(appDesignSchema?.name ?? ''),
        leading: const MenuButton(),
        floating: true,
        pinned: true,
        snap: true,
        bottom: positionsSnapshotData.length < 2
            ? const PreferredSize(preferredSize: Size.fromHeight(0), child: SizedBox.shrink())
            : PreferredSize(
            preferredSize: const Size.fromHeight(kTabHeight),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    controller: tabController,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                    isScrollable: true,
                    tabs: positionsSnapshotData
                        .map<Tab>((section) => Tab(height: 28, text: section.name))
                        .toList(),
                    onTap: (sectionIndex) async {
                      tabPressScrollRunning.add(true);
                      await scrollController.scrollToIndex(
                        sectionIndex,
                        preferPosition: AutoScrollPosition.begin,
                      );
                      tabPressScrollRunning.add(false);
                    }))));
  }

  Iterable<Widget> _buildProductGrid(ThemeData themeData, Iterable<Product> products) {
    final secondaryFontColor = themeData.extension<AppDesignExtension>()?.secondaryFontColor;
    const itemsInRow = 2;
    return divideTiles(
        tiles: products.slices(itemsInRow).map<Widget>((productsSlice) {
          return IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: divideTiles(tiles: [
                    ...productsSlice.map<Widget>((product) {
                      return Expanded(
                          child: Card(
                              margin: EdgeInsets.zero,
                              child: InkWell(
                                onTap: () {
                                  _showBottomSheet(themeData, product);
                                },
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  AspectRatio(
                                      aspectRatio: 1.33, child: ProductImage(src: product.image)),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                    child: CurrencyWidget(
                                        amount: product.price,
                                        style: Styles.displayBold17.copyWith(color: secondaryFontColor)),
                                  ),
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                          child: Text(product.name,
                                              style: Styles.displayRegular12
                                                  .copyWith(color: secondaryFontColor)))),
                                  if (product.addition != null)
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                        child: Text(product.addition!,
                                            style: Styles.displayRegular12
                                                .copyWith(color: secondaryFontColor?.withOpacity(0.5)))),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                                    child: SizedBox(
                                        height: addToCartButtonHeight,
                                        width: double.infinity,
                                        child: _buildAddToCartButton(themeData, product)),
                                  )
                                ]),
                              )));
                    }),
                    if (productsSlice.length < itemsInRow)
                      ...List<Widget>.generate(
                          itemsInRow - productsSlice.length, (index) => Expanded(child: Container()))
                  ], divider: const SizedBox(width: 16))
                      .toList()));
        }),
        divider: const SizedBox(height: 16));
  }

  Iterable<Widget> _buildProductListSmallItems(ThemeData themeData, Iterable<Product> products) {
    final secondaryFontColor = themeData.extension<AppDesignExtension>()?.secondaryFontColor;
    return divideTiles(
        tiles: products.map<Widget>((product) {
          return Card(
              margin: EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  _showBottomSheet(themeData, product);
                },
                child: BaseListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minHeight: 56,
                    leading: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                            width: 40,
                            height: 40,
                            child: ProductImage(
                              src: product.image,
                              progressSize: 15,
                              progressStrokeWidth: 2,
                            ))),
                    title: Text(product.name,
                        style: Styles.displayRegular10.copyWith(color: secondaryFontColor)),
                    content: product.addition == null
                        ? null
                        : Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: Text(product.addition!,
                          style: Styles.displayRegular10
                              .copyWith(color: secondaryFontColor?.withOpacity(0.5))),
                    ),
                    trailing: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: SizedBox(
                            height: addToCartButtonHeight,
                            width: 96,
                            child: SizedBox(
                                height: addToCartButtonHeight,
                                child: _buildAddToCartButton(themeData, product, showPrice: true))))),
              ));
        }),
        divider: const SizedBox(height: 8));
  }

  Iterable<Widget> _buildProductListLargeItems(ThemeData themeData, Iterable<Product> products) {
    final secondaryFontColor = themeData.extension<AppDesignExtension>()?.secondaryFontColor;
    return divideTiles(
        tiles: products.map<Widget>((product) {
          final description = product.description;
          return Card(
            margin: EdgeInsets.zero,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AspectRatio(aspectRatio: 1.33, child: ProductImage(src: product.image)),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Text(product.name,
                    style: Styles.displayBolder17.copyWith(color: secondaryFontColor)),
              ),
              if (product.addition != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text(product.addition!,
                      style:
                      Styles.displayRegular12.copyWith(color: secondaryFontColor?.withOpacity(0.5))),
                ),
              if (description != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text(description,
                      style: Styles.displayRegular12.copyWith(color: secondaryFontColor)),
                ),
              BaseListTile(
                  padding: const EdgeInsets.all(16),
                  leading: CurrencyWidget(
                      amount: product.price,
                      style: Styles.displayBold17.copyWith(color: secondaryFontColor)),
                  trailing: SizedBox(
                      height: addToCartButtonHeight,
                      width: 130,
                      child: _buildAddToCartButton(themeData, product)))
            ]),
          );
        }),
        divider: const SizedBox(height: 24));
  }

  Widget _buildAddToCartButton(ThemeData themeData, Product product, {bool showPrice = false}) {
    onAddPressed() {
      service<OrderBloc>().positionBasket.addPosition(product);
    }

    return StreamBuilderHelper<Map<ProductId, OrderItem>>(
        stream: service<OrderBloc>().positionBasket.addedPositions,
        builder: (context, addedPositions) {
          Widget result;
          final addedPosition = addedPositions[product.id];
          if (addedPosition == null) {
            result = showPrice
                ? ElevatedButton(
                onPressed: onAddPressed,
                child: CurrencyWidget(amount: product.price, style: Styles.displayBold12))
                : ElevatedButton.icon(
                onPressed: onAddPressed,
                label: const OneLineText('Add to cart', // i18n !!
                    style: Styles.display600x12),
                icon: const Icon(Icons.add, size: 20));
          } else {
            result = Material(
                color: themeData.elevatedButtonTheme.style?.backgroundColor?.resolve({}),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Styles.buttonBorderRadius))),
                child: BaseListTile(
                    leading: SizedBox(
                        width: addToCartButtonHeight,
                        child: IconButton(
                            iconSize: 20,
                            onPressed: () {
                              service<OrderBloc>().positionBasket.removePosition(product);
                            },
                            icon: const Icon(Icons.remove))),
                    trailing: SizedBox(
                        width: addToCartButtonHeight,
                        child: IconButton(
                            iconSize: 20, onPressed: onAddPressed, icon: const Icon(Icons.add))),
                    content: Text(addedPosition.quantity.toString(),
                        textAlign: TextAlign.center,
                        style: Styles.display600x12.copyWith(
                            color: themeData.elevatedButtonTheme.style?.foregroundColor?.resolve({})))));
          }
          return result;
        });
  }

  static const sectionHeaderHeight = 44.0;

  @override
  Widget buildErrorMessage(Widget errorMessage) {
    return Positioned(top: MediaQuery.of(context).padding.top, left: 0, right: 0, child: errorMessage);
  }

  void _showBottomSheet(ThemeData themeData, Product product) {
    final secondaryFontColor = themeData.extension<AppDesignExtension>()?.secondaryFontColor;
    final description = product.description;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    AspectRatio(
                        aspectRatio: 1.33,
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(Styles.mainBorderRadius)),
                            child: ProductImage(src: product.image))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                      child: Text(product.name,
                          style: Styles.displayBolder17.copyWith(color: secondaryFontColor)),
                    ),
                    if (product.addition != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Text(product.addition!,
                            style: Styles.displayRegular12
                                .copyWith(color: secondaryFontColor?.withOpacity(0.5))),
                      ),
                    if (description != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Text(description,
                            style: Styles.displayRegular12.copyWith(color: secondaryFontColor)),
                      ),
                    BaseListTile(
                        padding: const EdgeInsets.all(16),
                        leading: CurrencyWidget(
                            amount: product.price,
                            style: Styles.displayBold17.copyWith(color: secondaryFontColor)),
                        trailing: SizedBox(
                            height: addToCartButtonHeight,
                            width: 130,
                            child: _buildAddToCartButton(themeData, product)))
                  ])));
        });
  }
}

class VisibilityInfoWrapper {
  final VisibilityInfo info;
  final int index;

  VisibilityInfoWrapper({required this.info, required this.index});
}
*/
