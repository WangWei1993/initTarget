//
//  HomeController.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSHomeController.h"
#import "PSSCollectionViewCell.h"
#import "PSSHomeAddCell.h"
#import "PSSHomeHeader.h"

#define ColCount 3
#define ColRowPadding 1

@interface PSSHomeController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/** 长按BOOL */
@property (nonatomic, assign) BOOL seletBtnBool;

/** header */
//@property (nonatomic, weak) UIView *contentView1;

/** header */
@property (nonatomic, weak) PSSHomeHeader *headerView;

/** collectionView */
@property (nonatomic, weak) UICollectionView *collectionView;

/** flowLayout */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

/** dataStrs */
@property (nonatomic, strong) NSMutableArray<NSString *> *dataStrs;

/** 长按手势 */
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGestureRecognizer;

@end

@implementation PSSHomeController

#pragma mark -
#pragma mark - lazy mothod

- (NSMutableArray<NSString *> *)dataStrs {
    return PSS_LAZY(_dataStrs, ({
        NSMutableArray *dataStrs = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",nil];
        _dataStrs = dataStrs;
        dataStrs;
    }));
}

/*
- (UIView *)contentView1 {
    return PSS_LAZY(_contentView1, ({
        UIView *contentView1 = [[UIView alloc] init];
        _contentView1 = contentView1;
        [self.view addSubview:contentView1];
        contentView1.backgroundColor = [UIColor redColor];
        contentView1;
    }));
}
 */

- (PSSHomeHeader *)headerView {
    return PSS_LAZY(_headerView, ({
        PSSHomeHeader *headerView = [[PSSHomeHeader alloc] init];
        [self.view addSubview:headerView];
        _headerView = headerView;
        _headerView.backgroundColor = ColorBlue;
        headerView;
    }));
}

- (UICollectionView *)collectionView {
    return PSS_LAZY(_collectionView, ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        [self.view addSubview:collectionView];
        collectionView.bounces = NO;
        _collectionView = collectionView;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = Color(210, 210, 210);
        [self registerCollectionCellWithCollection:collectionView];
        collectionView;
    }));
}

- (UICollectionViewFlowLayout *)flowLayout {
    return PSS_LAZY(_flowLayout, ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout = flowLayout;
        
    }));
}

#pragma mark -
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* 添加frame变化通知（相同点：UIDeviceOrientationDidChangeNotification和UIApplicationDidChangeStatusBarFrameNotification一样可以监听手机是否横竖屏。
    区别： 当全局禁掉自动旋转屏幕的功能后，手机旋转UIApplicationDidChangeStatusBarFrameNotification不会再发出通知。但UIDeviceOrientationDidChangeNotification会发出通知，无论是否支持横竖屏，都会发出通知。这样可以方便的处理横屏后的页面显示问题。）
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeView:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    self.seletBtnBool = YES;
    
    // 初始化数据
    [self initData];
    
    // 初始化控件
    [self initView];
    
    // 给collectionView添加手势
    [self addPressGestureRecognizer];
}

#pragma mark -
#pragma mark - privite method

// 横竖屏切换调用方法
- (void)changeView:(NSNotification *)notice {

    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait
        || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {
        //竖屏
        [self initView];
        [self.collectionView reloadData];
    } else {
        //横屏
        [self initView];
        [self.collectionView reloadData];
    }
}

// 添加点击事件
- (void)panPress:(UIPanGestureRecognizer *)panPress {
    
    // 将所有的cell中的删除按钮取消
    self.seletBtnBool = YES;
    [self.collectionView reloadData];
}

// 长按事件触发
- (void)gestureRecognizerStateBeganAction {
    // 根据长按手势获取当前索引
    NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPressGestureRecognizer locationInView:self.collectionView]];
    
    // 获取当前cell
    PSSCollectionViewCell *cell = (PSSCollectionViewCell *)[_collectionView cellForItemAtIndexPath:selectIndexPath];
    cell.seletBtnBool = NO;
    
    if (selectIndexPath.item ==  self.dataStrs.count-1) {
        return;
    }
    
    // 长按bool
    self.seletBtnBool = NO;
    
    // 移动这个cell
    // 触发这方法的时候回自动调用collectionView的代理方法
    [self.collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
    // NSLog(@"我开始移动了");
    
    // 刷新
    [self.collectionView reloadData];
}

// 长按改变
- (void)gestureRecognizerStateChangeAction {

    // NSLog(@"我正在移动");
    // 根据collectionView长按手势获取位置，进而获取collectionView中的location对应cell
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[_longPressGestureRecognizer locationInView:self.collectionView]];
    
    // 最后一个加号是不让动的
    if (indexPath.item == self.dataStrs.count - 1) return;
    
    [self.collectionView updateInteractiveMovementTargetPosition:[_longPressGestureRecognizer locationInView:_collectionView]];
    
    // 是最后一个cell位置不变
    // NSIndexPath *lastIndexPath = [NSIndexPath indexPathWithIndex:self.dataStrs.count -1];
    // CollectionViewCell *lastCell = (CollectionViewCell *)[self.collectionView cellForItemAtIndexPath:lastIndexPath];
}

// 结束长按
- (void)gestureRecognizerStateEndAction {

    // NSLog(@"我结束移动了");
    [_collectionView endInteractiveMovement];
}

// 长按触发touch
- (void)longPressMoving:(UILongPressGestureRecognizer *)longPress {
    
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:
            // 开始长按
            [self gestureRecognizerStateBeganAction];
            break;
            
            
        case UIGestureRecognizerStateChanged:
            // 长按改变
            [self gestureRecognizerStateChangeAction];
            break;
            
        case UIGestureRecognizerStateEnded:
            // 结束长按
            [self gestureRecognizerStateEndAction];
            break;
            
        default:
            // collectionView 取消移动
            [self.collectionView cancelInteractiveMovement];
            break;
            
    }
}

// 给collectionView添加手势
- (void)addPressGestureRecognizer {
    
    // 1.长按手势
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressMoving:)];
    
    // 长按相应时间
    longPressGestureRecognizer.minimumPressDuration = 0.3;
    self.longPressGestureRecognizer = longPressGestureRecognizer;
    [self.collectionView addGestureRecognizer:longPressGestureRecognizer];
    
    // 2. pan
    // UITapGestureRecognizer
    UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(panPress:)];
    [self.headerView addGestureRecognizer:pan];
    
}

// 初始化控件
- (void)initView {
    CGFloat navH = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat tabBarH = TabBarH;
    // CGFloat visiW = SCREEN_WIDTH;
    CGFloat visiH = SCREEN_HEIGHT - navH - tabBarH;
    
    /*
    [self.contentView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navH);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(visiH);
        // make.top.bottom.left.right.mas_equalTo(self.view);
    }];
     */
    
    [self.headerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navH);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(visiH * 0.4);
    }];
    
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerView.mas_bottom);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(visiH * 0.6);
    }];
    
}

// 初始化数据
- (void)initData {
    
}

// 注册cell和header
- (void)registerCollectionCellWithCollection:(UICollectionView *)collectionView {
    // cell
    [collectionView registerClass:[PSSCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([PSSCollectionViewCell class])];
    [collectionView registerClass:[PSSHomeAddCell class] forCellWithReuseIdentifier:NSStringFromClass([PSSHomeAddCell class])];
}

#pragma mark -
#pragma mark - UICollectionView DataSource

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0) {
    return YES;
    
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath NS_AVAILABLE_IOS(9_0) {
    
    // 获取当前的object
    id obj = [_dataStrs objectAtIndex:sourceIndexPath.item];
    
    // 先移除sourceIndexPath
    [_dataStrs removeObject:obj];
    
    // 添加到 destinationIndexPath
    [_dataStrs insertObject:obj atIndex:destinationIndexPath.item];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataStrs.count;
}

/** cell */
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    if (indexPath.item == _dataStrs.count - 1) {
        // 最后一个是加号
        PSSHomeAddCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PSSHomeAddCell class]) forIndexPath:indexPath];
        return cell;
    }
    
    // 普通的cell
    PSSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PSSCollectionViewCell class]) forIndexPath:indexPath];
    cell.name = self.dataStrs[indexPath.item];
    cell.seletBtnBool = self.seletBtnBool;
    // 删除选中的cell
    cell.deleteCellBlock = ^{
        [_dataStrs removeObjectAtIndex:indexPath.item];
        // self.seletBtnBool = YES;
        [self.collectionView reloadData];
    };
    return cell;
}


#pragma mark -
#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 判断是否处于删除cell的状态
    if (!self.seletBtnBool) {
        self.seletBtnBool = !self.seletBtnBool;
        [self.collectionView reloadData];
        
    } else {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = ColorWhite;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}


#pragma mark -
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat wh = (SCREEN_WIDTH)/ ColCount;
    return CGSizeMake(wh, wh);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    //return UIEdgeInsetsMake(ColRowPadding, ColRowPadding, ColRowPadding, ColRowPadding);
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    //return ColRowPadding;
    return 0;
}

// 调节同一行的cell之间的距离的
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    //return ColRowPadding;
    return 0;
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
