//
//  JDLVideoViewController.m
//  ProjectFrame
//
//  Created by 胜炫电子 on 2017/10/12.
//  Copyright © 2017年 BlueSkyer-25. All rights reserved.
//

#import "JDLVideoViewController.h"

#import "JDLVideoFrame.h"
#import "JDLVideoModel.h"

#import "WMPlayer.h"
#import "GYPlayer.h"
#import "JDLVideoCell.h"

@interface JDLVideoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableview;

@property (nonatomic,strong)NSMutableArray *topArray;
@property (nonatomic , assign)int  count;

@property (nonatomic , strong) GYPlayer     *               player;
@property (nonatomic , strong) WMPlayer     *               dragPlayerView;


@property (nonatomic , assign) int                          currtRow;

@property (nonatomic ,assign) CGFloat   currentOriginY;

@end

@implementation JDLVideoViewController

-(NSMutableArray *)topArray{
    
    if (!_topArray) {
        _topArray =[NSMutableArray array];
    }
    return _topArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableview];
    
    self.view.backgroundColor =KRedColor;
    // Do any additional setup after loading the view.
}

-(void)initTableview{
    
    UITableView *tableview =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight -113) style:UITableViewStylePlain];
    tableview.backgroundColor = KYellowColor;
    tableview.delegate = self;
    tableview.dataSource =self;
    [self.view addSubview:tableview];
    self.tableview = tableview;
    self.tableview.tableHeaderView =[[UIView alloc] init];
    self.tableview.tableFooterView =[[UIView alloc] init];
    WEAKSELF;
    self.tableview.mj_header =[JDLRefreshGifHeader headerWithRefreshingBlock:^{
        weakSelf.count =0;
        [weakSelf requestScrollViewData];
    }];
    self.tableview.mj_footer =[JDLRefreshGifFooter footerWithRefreshingBlock:^{
        [weakSelf requestScrollViewData];
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    JDLVideoCell *cell =[JDLVideoCell cellWithTableView:tableView];
    JDLVideoFrame *frameModel =self.topArray[indexPath.row];
    cell.model =frameModel;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JDLVideoFrame *videoframe = self.topArray[indexPath.row];
    JDLVideoModel *videodata = videoframe.videodata;
    
//    if (self.dragPlayerView) {
//        [self.dragPlayerView resetWMPlayer];
//        self.dragPlayerView = nil;
//    }
//    CGFloat originY = videoframe.cellH*indexPath.row;
//    self.currentOriginY = originY;
//    self.dragPlayerView = [[WMPlayer alloc] initWithFrame:CGRectMake(0, originY, kScreenWidth, kScreenWidth*0.56)];
//    self.dragPlayerView.URLString = videodata.mp4_url;
//    [self.tableview addSubview:self.dragPlayerView];
//    self.dragPlayerView.closeBtn.hidden = YES;
//    [self.dragPlayerView play];
    
    //创建播放器
    if (self.player) {
        [self.player removePlayer];
        self.player = nil;
    }
//    CGFloat originY = videoframe.cellH*indexPath.row+videoframe.coverF.origin.y+SCREEN_WIDTH * 0.25;
    CGFloat originY = videoframe.cellH*indexPath.row;
    self.currentOriginY = originY;
    self.player = [[GYPlayer alloc] initWithFrame:CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_WIDTH * 0.56)];
    self.player.mp4_url = videodata.mp4_url;
    self.player.title = videodata.title;
    self.player.currentOriginY = originY;
    WEAKSELF;
    self.player.currentRowBlock = ^(){
        [weakSelf.tableview addSubview:weakSelf.player];
    };
    [self.tableview addSubview:self.player];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JDLVideoFrame *frameModel =self.topArray[indexPath.row];
    return frameModel.cellH;
}


-(void)requestScrollViewData{
    
    WEAKSELF;
    NSString *getstr = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%d-10.html",self.count];
    [JDLRequestTools HTTPSGetDataWithUrl:getstr Parames:nil complete:^(id request, NSInteger statusCode) {

        NSMutableArray *dataarray = [JDLVideoModel mj_objectArrayWithKeyValuesArray:request[@"videoList"]];

        NSMutableArray *statusFrameArray = [NSMutableArray array];
        for (JDLVideoModel *model in dataarray) {
            JDLVideoFrame *frameModel =[[JDLVideoFrame alloc] init];
            frameModel.videodata =model;
            [statusFrameArray addObject:frameModel];
        }
        if (self.count ==0) {
            weakSelf.topArray = statusFrameArray;
        }else{
            [weakSelf.topArray addObjectsFromArray:statusFrameArray];
        }
        self.count +=10;
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
        self.tableview.mj_footer.hidden =dataarray.count <10;

    } failure:^(NSError *error, NSInteger statusCode) {
        [self.tableview.mj_header endRefreshing];
        [self.tableview.mj_footer endRefreshing];
    }];
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
