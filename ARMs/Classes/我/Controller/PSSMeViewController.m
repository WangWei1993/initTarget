//
//  PSSMeViewController.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/27.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSMeViewController.h"
#import "PSSMeCell.h"
#import "PSSBackoutCell.h"
#import "PSSLoginViewController.h"
#import "AppDelegate.h"

@interface PSSMeViewController () <UITableViewDelegate, UITableViewDataSource>

/**
 *  tableView
 */
@property(nonatomic, weak) UITableView *tableView;

@end

@implementation PSSMeViewController

#pragma mark -
#pragma mark - Lazy Methods
- (UITableView *)tableView {
    
    return PSS_LAZY(_tableView, ({
        
        // 设置tableView的类型为Group
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = Color(245, 245, 245);
        _tableView = tableView;
        tableView.bounces = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
       
        tableView;
    }));
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置标题
    self.title = @"我";
    
    // 设置tableView
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
    
}


#pragma mark -
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
        
    } else if (section == 1) {
        return 3;
        
    } else if (section == 2) {
        return 1;
        
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        PSSMeCell *cell = [PSSMeCell cellWithTableView:tableView];
        cell.nameL.text = @"厂长";
        cell.countL.text = @"10086";
        cell.imageV.image = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
        cell.titleL.text = @"";
        return cell;
        
    } else if (indexPath.section == 1) {
        PSSMeCell *cell = [PSSMeCell cellWithTableView:tableView];
        cell.imageV.image = [UIImage imageNamed:@"tabBar_friendTrends_click_icon"];
        cell.titleL.text = @"修改密码";
        cell.nameL.text = @"";
        cell.countL.text = @"";
        return cell;
        
    } else if (indexPath.section == 2) {
        
        // 退出
        PSSBackoutCell *cell = [PSSBackoutCell cellWithTableView:tableView];
        return cell;
        
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return CellH;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    // 设置header的高度
    if (section == 0) {
        return 18;
    }
    return 22;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // 取消多余的下划线
    return 0.1;
}
 

#pragma mark -
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        // 点击cell
        UIViewController *vc = [[UIViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    } else if (indexPath.section == 2) {
        // 用户退出
        AppDelegate *app = PSSAPPDelegate;
        app.window.rootViewController = [[PSSLoginViewController alloc] init];
        
    } else {
        
    }

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
