//
//  MeCell.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/27.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSSMeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UILabel *nameL;

@property (weak, nonatomic) IBOutlet UILabel *countL;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
