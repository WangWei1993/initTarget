//
//  ItemCell.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSItemCell.h"

@interface PSSItemCell ()

/** 外层View */
@property(nonatomic, weak) UIView *contentV;

/** 图片 */
@property(nonatomic, weak) UIImageView *imageV;

/** 标题 */
@property(nonatomic, weak) UILabel *nameL;

@end

@implementation PSSItemCell

- (void)setName:(NSString *)name {
    _name = name;
    self.nameL.text = name;
}

#pragma mark -
#pragma mark - lazy method

- (UIView *)contentV {
    return PSS_LAZY(_contentV, ({
        UIView *contentV = [[UIView alloc] init];
        contentV.backgroundColor = [UIColor whiteColor];
        _contentV = contentV;
        [self addSubview:contentV];
        contentV;
    }));
}

- (UILabel *)nameL {
    return PSS_LAZY(_nameL, ({
        UILabel *nameL = [[UILabel alloc] init];
        [self.contentV addSubview:nameL];
        nameL.textAlignment = NSTextAlignmentCenter;
        _nameL = nameL;
        nameL;
    }));
}

- (UIImageView *)imageV {
    return PSS_LAZY(_imageV, ({
        UIImageView *imageV = [[UIImageView alloc] init];
        [self.contentV addSubview:imageV];
        // imageV.contentMode = UIViewContentModeScaleAspectFill;
        _imageV = imageV;
        imageV;
    }));
}


#pragma mark -
#pragma mark - init method

// 自定义CollectionViewCell中最重要的一个方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 创建子控件
        [self setChildView];
        
    }
    return self;

}

#pragma mark - 
#pragma mark - privite method

// 创建和布局子控件
- (void)setChildView {
    
    static CGFloat padding = 10;
    
    [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.top.mas_equalTo(self);
        //make.right.bottom.mas_equalTo(-0.5);
    }];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(padding);
        make.width.height.mas_equalTo(self.mas_height).offset(-padding*2);
    }];
    
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageV.mas_right).offset(padding);
        make.centerY.mas_equalTo(self);
    }];
    
    self.imageV.image = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
}

@end
