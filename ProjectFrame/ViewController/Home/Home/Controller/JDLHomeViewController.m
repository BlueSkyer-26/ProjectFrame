//
//  Test1ViewController.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLHomeViewController.h"

#import "JDLHomeViewModel.h"
#import "JDLHomeUIService.h"

@interface JDLHomeViewController ()

@property (nonatomic,strong)JDLHomeViewModel *viewModel;
@property (nonatomic,strong)JDLHomeUIService *homeUIService;

@end

@implementation JDLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KPurpleColor;
    self.navigationItem.title = @"首页(3)";
    [self.navigationController.tabBarItem setBadgeValue:@"300"];
    
    self.viewModel = [[JDLHomeViewModel alloc] init];
    self.homeUIService = [[JDLHomeUIService alloc] initWithVC:self ViewModel:self.viewModel];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
