//
//  CollectionViewCell.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CollectionViewCellBlock)(void);

@interface PSSCollectionViewCell : UICollectionViewCell

/** 删除按钮是否显示 */
@property (nonatomic, assign) BOOL seletBtnBool;

/** CollectionViewCellBlock */
@property (nonatomic, copy) CollectionViewCellBlock deleteCellBlock;

/** <#name#> */
@property (nonatomic, copy) NSString *name;

@end
