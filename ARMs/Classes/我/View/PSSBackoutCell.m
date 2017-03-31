//
//  BackoutCell.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/27.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSBackoutCell.h"

@implementation PSSBackoutCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *str = @"PSSBackoutCell";
    PSSBackoutCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil){
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] lastObject];
    }
    
    // 对cell的默认设置
    // 取消cell的选中效果
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    //cell.backgroundColor = [UIColor redColor];
    return cell;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
