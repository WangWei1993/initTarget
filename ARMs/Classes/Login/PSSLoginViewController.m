//
//  SNLoginViewController.m
//  PSSAPP
//
//  Created by 王伟 on 2017/3/24.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import "PSSLoginViewController.h"
#import "AppDelegate.h"
#import "IQKeyboardManager.h"

@interface PSSLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation PSSLoginViewController

#pragma mark -
#pragma mark - privite Mothed

- (void)awakeFromNib {
    [super awakeFromNib];
    
   
}

- (IBAction)comeToHome:(id)sender {
    
    AppDelegate *app = PSSAPPDelegate;
    [app setRootController];
    
    
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentView.layer.borderColor = ColorBlue.CGColor;
    self.contentView.layer.borderWidth = 1.0;
   
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
     [IQKeyboardManager sharedManager].enable = NO;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enable = YES;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
