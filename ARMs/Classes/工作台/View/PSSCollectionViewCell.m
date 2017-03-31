//
//  CollectionViewCell.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSCollectionViewCell.h"

@interface PSSCollectionViewCell ()

/** imageV */
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

/** nameL */
@property (weak, nonatomic) IBOutlet UILabel *nameL;

/** 删除按钮 */
@property (weak, nonatomic) IBOutlet UIButton *deletBtn;

@end

@implementation PSSCollectionViewCell

#pragma mark -
#pragma mark - set mothed

- (void)setName:(NSString *)name {
    _name = name;
    self.nameL.text = name;
}

- (void)setSeletBtnBool:(BOOL)seletBtnBool {
    _seletBtnBool = seletBtnBool;
    
    _deletBtn.hidden = seletBtnBool;
}

#pragma mark -
#pragma mark - init mothed

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PSSCollectionViewCell class]) owner:self options:nil].lastObject;
        
        [self.deletBtn addTarget:self action:@selector(deleteCellBlockClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark -
#pragma mark - privite mothed

- (void)deleteCellBlockClick {
    if (_deleteCellBlock) {
        _deleteCellBlock();
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
