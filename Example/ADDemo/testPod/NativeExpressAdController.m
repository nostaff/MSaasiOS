
//
//  NativeExpressAdController.m
//  TestAdA
//
//  Created by lurich on 2019/8/26.
//  Copyright © 2019 . All rights reserved.
//

#import "NativeExpressAdController.h"
#import "ADInfo.h"

@interface NativeExpressAdController ()<UITableViewDelegate,UITableViewDataSource,SFTemplateDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *managerArray;
@property (nonatomic, assign) NSInteger index;


@end

@implementation NativeExpressAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"模板广告";
    // Do any additional setup after loading the view.
    self.managerArray = [NSMutableArray array];
    self.dataArray = [NSMutableArray array];
    for (int i=0; i<10; i++) {
        NSString *title = [NSString stringWithFormat:@"Number:%d  点击插入广告",i];
        [self.dataArray addObject:title];
    }
    [self.view addSubview:self.tableView];
    
    self.index = 0;
    [self loadAD];
}

- (void)loadAD{
    SFTemplateManager *manager = [[SFTemplateManager alloc] init];
    manager.mediaId = template_id;
    manager.adCount = 1;
    manager.size = CGSizeMake(SF_ScreenW, 0);
    manager.showAdController = self;
    manager.delegate = self;
    [manager setTheme:SFTemplateExpressNativeNormalTheme];
    [manager loadAdData];
    [self.managerArray addObject:manager];
}

- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id objc = self.dataArray[indexPath.row];
    if ([objc isKindOfClass:[UIView class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellID"];
        }
        cell.contentView.backgroundColor = [UIColor whiteColor];
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        UIView *view = objc;
        [cell.contentView addSubview:view];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCellID"];
        }
        cell.textLabel.text = objc;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id objc = self.dataArray[indexPath.row];
    if ([objc isKindOfClass:[UIView class]]) {
        UIView *view = objc;
        return view.bounds.size.height;
    }else{
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"tableView cell 被点击");
    self.index = indexPath.row;
    [self loadAD];
}


- (void)templateAdDidLoadViews:(NSArray<__kindof UIView *> *)views{
    [self.dataArray insertObjects:views atIndexes:[NSIndexSet indexSetWithIndex:self.index]];
}
- (void)templateAdDidRenderSuccessWithADView:(UIView *)templateAdView{
    [self.tableView reloadData];
}
- (void)templateAdDidCloseWithADView:(UIView *)templateAdView{
    [self.dataArray removeObject:templateAdView];
    [self.tableView reloadData];
}

- (void)dealloc{
    NSLog(@"%s",__func__);
    [self.managerArray removeAllObjects];
}

@end
