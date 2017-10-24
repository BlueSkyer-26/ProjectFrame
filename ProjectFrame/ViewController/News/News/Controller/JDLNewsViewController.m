//
//  Test2ViewController.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/9/26.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLNewsViewController.h"

#import "JDLSocietyViewController.h"
#import "JDLVideoViewController.h"
#import "JDLOtherNewsViewController.h"

@interface JDLNewsViewController ()

@end

@implementation JDLNewsViewController

- (instancetype)init {
    if (self = [super init]) {
        
        //title segment url  http://qt.qq.com/lua/lol_news/channel?plat=ios&version=9751
        
        
        
        self.viewFrame = CGRectMake(0, 64, KScreenWidth, KScreenHeight -69);
        
//        self.menuView.frame = CGRectMake(20, 100, KScreenWidth -40, 30);
        
        self.menuBGColor =KRedColor;
        
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 18;
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuHeight = 44;
        self.titleColorSelected = KOrangeColor;

        self.menuViewContentMargin = 0;
        self.itemMargin =15.0;
        self.showOnNavigationBar = NO;
        
        self.automaticallyCalculatesItemWidths =YES;  //bottom line长度自动变化
        
//        self.menuItemWidth = 100 * KSCALE_WIDTH;
//        self.progressWidth = 40 * KSCALE_WIDTH;
        self.progressHeight = 3;
        //启用系统自带的左滑手势
        self.otherGestureRecognizerSimultaneously = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =KWhiteColor;
    
    //kk
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    NSArray *namearray = [NSArray array];
    
    namearray = @[@"社会",@"视频",@"国内",@"国际",@"娱乐",@"体育",@"科技",@"奇闻趣事",@"生活健康"];
    NSArray *contentarray = [NSArray array];
    contentarray = @[@"shehui",@"shipin",@"guonei",@"world",@"huabian",@"tiyu",@"keji",@"qiwen",@"health"];
    
    _contentArray = [NSArray array];
    _contentArray = contentarray;
    
    _subViewControllers = [NSArray array];
    _subViewControllers = namearray;
    return _subViewControllers.count;
}

- (NSInteger)numbersOfTitlesInMenuView:(WMMenuView *)menu{
    return _subViewControllers.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    switch (index) {
        case 0:
        {
            JDLSocietyViewController *DetailVC = [[JDLSocietyViewController alloc]init];
            return DetailVC;
        }
            break;
            
        case 1:
        {
            JDLVideoViewController *VideoVC = [[JDLVideoViewController alloc]init];
            return VideoVC;
        }
            break;
            
        default:
        {
            JDLOtherNewsViewController * WithdrawalsVC = [[JDLOtherNewsViewController alloc]init];
            WithdrawalsVC.content =_contentArray[index];
            return WithdrawalsVC;
        }
            break;
    }
    return nil;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {

    return _subViewControllers[index];
}

//-(CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index{
//
//    CGFloat lineWidth =[_subViewControllers[index] widthForFont:KSYSTEMFONT(KAdaptX(16))];
//    return lineWidth;
//}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    
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
