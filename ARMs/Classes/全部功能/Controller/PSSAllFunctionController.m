//
//  AllFunctionController.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/27.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSAllFunctionController.h"
#import "PSSItemCell.h"
#import "PSSCollectionGroup.h"
#import "PSSCollectionItem.h"
#import "PSSHeaderReusableView.h"

@interface PSSAllFunctionController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

/** collectionView */
@property(nonatomic, weak) UICollectionView *collectionView;

/** layout */
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

/** dataStrs */
@property (nonatomic, strong) NSArray<NSString *> *dataStrs;

/** GroupdataStrs */
@property (nonatomic, strong) NSMutableArray<PSSCollectionGroup *> *Groupdata;

@end

@implementation PSSAllFunctionController


#pragma mark - 
#pragma mark - lazy 

- (UICollectionViewFlowLayout *)flowLayout {
    return PSS_LAZY(_flowLayout, ({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout = flowLayout;
        
        /* flowLayout的参数属性设置
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2 , 44);
        flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH , 44);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
         */
        
        flowLayout;
    }));
}

- (UICollectionView *)collectionView {
    return PSS_LAZY(_collectionView, ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.flowLayout];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = Color(210, 210, 210);
        collectionView.bounces = NO;
        
        // 注册cell和header
        [self registerCollectionCellWithCollection:collectionView];
        
        collectionView;
    }));
}

#pragma mark -
#pragma mark - privite method

// 注册cell和header
- (void)registerCollectionCellWithCollection:(UICollectionView *)collectionView {
    // cell
    [collectionView registerClass:[PSSItemCell class] forCellWithReuseIdentifier:NSStringFromClass([PSSItemCell class])];
    
    // header
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PSSHeaderReusableView class]) bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([PSSHeaderReusableView class])];
}

- (void)getData {
    PSSCollectionGroup *group1 = [[PSSCollectionGroup alloc] init];
    PSSCollectionGroup *group2 = [[PSSCollectionGroup alloc] init];
    PSSCollectionGroup *group3 = [[PSSCollectionGroup alloc] init];
    
    NSArray *dataStrs1 = @[@"1",@"2",@"3",@"11",@"22",@"33",@"111",@"222",@"333",@"1111",@"2222",@"3333",@"11111",@"22222",@"33333"];
    
    NSArray *dataStrs2 = @[@"厉害了1",@"厉害了2",@"厉害了3",@"厉害了4",@"厉害了5",@"厉害了6",@"厉害了7",@"厉害了8"];
    
    NSArray *dataStrs3 = @[@"iPhone1",@"iPhone2",@"iPhone3",@"iPhone4",@"iPhone5",@"iPhone6",@"iPhone7",@"iPhone8",@"iPhone9"];
    
    group1.headerStr = @"第1组";
    group2.headerStr = @"第2组";
    group3.headerStr = @"第3组";
    
    group1.items = dataStrs1;
    group2.items = dataStrs2;
    group3.items = dataStrs3;
    
    self.Groupdata = [NSMutableArray arrayWithObjects:group1,group2,group3, nil];
    
    // 刷新列表
    [self.collectionView reloadData];
    
}

- (void)changeFrame:(NSNotification *)notice {
    // _flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 2 , 44);
    [self.collectionView reloadData];
}

#pragma mark -
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全部功能";
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.view);
    }];

    // 获取数据
    [self getData];
    
    // 横竖屏竖屏
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFrame:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}

#pragma mark -
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.Groupdata.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    PSSCollectionGroup *group = self.Groupdata[section];
    return group.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PSSItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([PSSItemCell class]) forIndexPath:indexPath];
    PSSCollectionGroup *group = self.Groupdata[indexPath.section];
    cell.name = group.items[indexPath.row];
    cell.backgroundColor = ColorWhite;
    
    return cell;
}

// header
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    if (kind == UICollectionElementKindSectionHeader) {
        PSSHeaderReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([PSSHeaderReusableView class]) forIndexPath:indexPath];
        PSSCollectionGroup *group = self.Groupdata[indexPath.section];
        header.title = group.headerStr;
        return header;
    } return nil;
    
}

#pragma mark -
#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = ColorWhite;
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark -
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake((SCREEN_WIDTH - 3)/ 2  , CellH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(1, 1, 1, 1);
    // return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return 1;
}

// 调节同一行的cell之间的距离的
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.5;
}

// Header的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {

    return CGSizeMake(SCREEN_WIDTH , CellH);
}

// Footer的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeZero;
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
