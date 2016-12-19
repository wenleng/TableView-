//
//  ViewController.m
//  TableView定制（微博）
//
//  Created by liu on 16/9/19.
//  Copyright © 2016年 liu. All rights reserved.
//

#import "ViewController.h"
#import "WeiBoModel.h"
#import "WeiBoTableViewCell.h"
#import "FrameModel.h"

//遵守TableView的协议
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
    //声明一个成员变量
    UITableView *_tableView;
}

//数据源数组
@property (nonatomic, strong) NSMutableArray *dataArray;

//存储每一个CEll的位置（frame)
@property (nonatomic, strong) NSMutableArray *frameArray;

@end



@implementation ViewController

#pragma mark - 懒加载（创建数据源）
- (NSMutableArray *)dataArray{
    
    if (_dataArray == nil) {
        
        _dataArray = [[NSMutableArray alloc]init];
        _frameArray = [[NSMutableArray alloc]init];
        
        //准备数据
        
        for (NSDictionary *dict in [self prepareData]) {
            
            WeiBoModel *model = [[WeiBoModel alloc]initWithDict:dict];
            
            FrameModel *fModel = [[FrameModel alloc] init];
            
            fModel.model = model;
            
            [_dataArray addObject:model];
            
            [_frameArray addObject:fModel];
            
                        
        }
    }
    return _dataArray;
    
}

#pragma mark - 准备数据
//返回值为一个数组（plist文件root为一个数组）
- (NSArray *)prepareData{
    
    //通过路径拿到资源
    NSString *path = [[NSBundle mainBundle]pathForResource:@"statuses" ofType:@"plist"];
    
    //用一个数组进行接收数据
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    //返回数据
    return array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建界面
    [self createUI];
}

#pragma mark - 创建界面
- (void)createUI{
    
    //创建TableView，风格设置为扁平型，默认只有一组
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    //添加到界面上去
    [self.view addSubview:_tableView];
    
}

#pragma mark - 实现协议方法
//返回的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"acell";
    
    WeiBoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[WeiBoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }

    
    WeiBoModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.frameModel = self.frameArray[indexPath.row];
    
    return cell;
    
}

#pragma mark - 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.frameArray[indexPath.row] cellHight];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
