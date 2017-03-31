//
//  HomeAddCell.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSHomeAddCell.h"

@implementation PSSHomeAddCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([PSSHomeAddCell class]) owner:self options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
