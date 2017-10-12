//
//  JDLSocietyViewController.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/11.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLSocietyViewController.h"

#import "JDLSocietyNewsModel.h"

@interface JDLSocietyViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong)UITableView *tableview;

@property (nonatomic,strong)SDCycleScrollView *cycleScrollview;

@property (nonatomic , strong) NSMutableArray *topArray;
@property (nonatomic , strong) NSMutableArray *titleArray;
@property (nonatomic , strong) NSMutableArray *imagesArray;

@end

@implementation JDLSocietyViewController

- (NSMutableArray *)imagesArray
{
    if (!_imagesArray) {
        _imagesArray = [NSMutableArray array];
    }
    return _imagesArray;
}
- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}
- (NSMutableArray *)topArray
{
    if (!_topArray) {
        _topArray = [NSMutableArray array];
    }
    return _topArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KOrangeColor;
    
    [self initTableview];
    [self initScrollview];
    
    [self requestScrollViewData];
    
    //
    // Do any additional setup after loading the view.
}

-(void)initTableview{
    
    UITableView *tableview =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -113) style:UITableViewStylePlain];
    tableview.backgroundColor = KYellowColor;
    tableview.delegate = self;
    tableview.dataSource =self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    self.tableview.tableFooterView =[[UIView alloc] init];
}
-(void)initScrollview{
    
    SDCycleScrollView *cycleScrollview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight *0.25) imageNamesGroup:nil];
    cycleScrollview.delegate =self;
    cycleScrollview.backgroundColor = KPurpleColor;
    cycleScrollview.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cycleScrollview.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollview.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//    cycleScrollview.placeholderImage =kImageName(@"idpf");
//    cycleScrollview.pageDotImage = kImageName(@"idpf");
//    cycleScrollview.currentPageDotImage = kImageName(@"idpd");
    cycleScrollview.autoScrollTimeInterval = 3.0f;
    
    self.tableview.tableHeaderView = cycleScrollview;
    self.cycleScrollview = cycleScrollview;
}
-(void)requestScrollViewData{
    
    WEAKSELF;
    NSString *url =@"http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html";
    [JDLRequestTools HTTPSGetDataWithUrl:url Parames:nil complete:^(id request, NSInteger statusCode) {
        
        NSArray *dataarray = [JDLSocietyNewsModel mj_objectArrayWithKeyValuesArray:request[@"T1348647853363"][0][@"ads"]];
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        NSMutableArray *titleArray = [NSMutableArray array];
        NSMutableArray *topArray = [NSMutableArray array];
        for (JDLSocietyNewsModel *data in dataarray) {
            [topArray addObject:data];
            [statusFrameArray addObject:data.imgsrc];
            [titleArray addObject:data.title];
        }
        [weakSelf.topArray addObjectsFromArray:topArray];
        [weakSelf.imagesArray addObjectsFromArray:statusFrameArray];
        [weakSelf.titleArray addObjectsFromArray:titleArray];
        
        weakSelf.cycleScrollview.imageURLStringsGroup = [weakSelf.imagesArray copy];
        weakSelf.cycleScrollview.titlesGroup =[weakSelf.titleArray copy];
    } failure:^(NSError *error, NSInteger statusCode) {
      
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:showUserInfoCellIdentifier];
    }
 
    cell.textLabel.text=@"签名";
    cell.detailTextLabel.text = @"ll";

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//
//    return 400;
//}

@end
