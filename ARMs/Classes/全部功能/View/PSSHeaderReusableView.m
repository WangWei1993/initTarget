//
//  HeaderReusableView.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSHeaderReusableView.h"

@interface PSSHeaderReusableView ()

@property (weak, nonatomic) IBOutlet UILabel *titleL;


@end

@implementation PSSHeaderReusableView


- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleL.text = title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.titleL.backgroundColor = Color(245, 245, 245);
    
}

@end
