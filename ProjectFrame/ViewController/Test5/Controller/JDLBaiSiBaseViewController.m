//
//  JDLBaiSiBaseViewController.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/16.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLBaiSiBaseViewController.h"

#import "JDLBaseNewsCell.h"

#import "JDLAllNewsFrameModel.h"
#import "JDLAllNewsModel.h"


@interface JDLBaiSiBaseViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , assign)int  count;
@property (nonatomic , copy)NSString * np;

@property (nonatomic,strong)NSMutableArray *topArray;

@property(nonatomic,strong)UITableView *tableview;

@end

@implementation JDLBaiSiBaseViewController

-(NSMutableArray *)topArray{
    
    if (!_topArray) {
        _topArray =[NSMutableArray array];
    }
    return _topArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =KPurpleColor;
    
    [self initTableview];
    // Do any additional setup after loading the view.
}

-(void)initTableview{
    
    UITableView *tableview =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -104) style:UITableViewStylePlain];
    tableview.backgroundColor = KWhiteColor;
    tableview.delegate = self;
    tableview.dataSource =self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    self.tableview.tableHeaderView =[[UIView alloc] init];
    self.tableview.tableFooterView =[[UIView alloc] init];
    WEAKSELF;
    self.tableview.mj_header =[JDLRefreshGifHeader headerWithRefreshingBlock:^{
//        weakSelf.count =0;
        [weakSelf requestNewScrollViewData];
    }];
    self.tableview.mj_footer =[JDLRefreshGifFooter footerWithRefreshingBlock:^{
        [weakSelf requestMoreScrollViewData];
//        [weakSelf requestNewScrollViewData];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.topArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JDLBaseNewsCell *cell =[JDLBaseNewsCell cellWithTableView:tableView];
    JDLAllNewsFrameModel *frameModel =self.topArray[indexPath.row];
    cell.frameModel =frameModel;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JDLAllNewsFrameModel *model =self.topArray[indexPath.row];
    return model.cellH;
}

-(void)requestNewScrollViewData{
    
    WEAKSELF;
 
    [JDLRequestTools HTTPSGetDataWithUrl:[self requestUrlString:@"0"] Parames:nil complete:^(id request, NSInteger statusCode) {
        
        NSMutableArray *dataArray = [JDLAllNewsModel mj_objectArrayWithKeyValuesArray:request[@"list"]];
 
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (JDLAllNewsModel *model in dataArray) {
            JDLAllNewsFrameModel *frameModel =[[JDLAllNewsFrameModel alloc] init];
            frameModel.allNewsModel =model;
            [statusFrameArray addObject:frameModel];
        }

        weakSelf.topArray = statusFrameArray;

        self.np =request[@"info"][@"np"];
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
//        self.tableview.mj_footer.hidden =dataarray.count <20;
        
    } failure:^(NSError *error, NSInteger statusCode) {
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    }];
}

-(void)requestMoreScrollViewData{
    
    WEAKSELF;
    
    [JDLRequestTools HTTPSGetDataWithUrl:[self requestUrlString:self.np] Parames:nil complete:^(id request, NSInteger statusCode) {
        
        
        NSMutableArray *dataArray = [JDLAllNewsModel mj_objectArrayWithKeyValuesArray:request[@"list"]];
        
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (JDLAllNewsModel *model in dataArray) {
            JDLAllNewsFrameModel *frameModel =[[JDLAllNewsFrameModel alloc] init];
            frameModel.allNewsModel =model;
            [statusFrameArray addObject:frameModel];
        }
        [weakSelf.topArray addObjectsFromArray:statusFrameArray];

        self.np =request[@"info"][@"np"];
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
//        self.tableview.mj_footer.hidden =dataarray.count <20;
        
    } failure:^(NSError *error, NSInteger statusCode) {
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    }];
}

-(NSString *)requestUrlString:(NSString *)np{
    NSString *getstr = kNSStringFormat(@"%@%@-20.json",self.requestUrl,np);
    WMLog(@"666===%@",getstr);
    return getstr;
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
