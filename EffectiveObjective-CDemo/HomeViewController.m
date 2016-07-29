//
//  HomeViewController.m
//  EffectiveObjective-CDemo
//
//  Created by bbigcd on 16/7/29.
//  Copyright © 2016年 cd. All rights reserved.
//

#import "HomeViewController.h"


@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *textLabelArray;
@property (nonatomic, strong) NSArray *detailTextLabelArray;

@end

static NSString *cellIdentifier = @"CellIdentifier";

@implementation HomeViewController


- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [_tableView setFrame:self.view.bounds];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小种🐷";
    [self.tableView reloadData];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.textLabelArray = @[@"关联对象用法", @"恩"];
    self.detailTextLabelArray = @[@"关联对象用法", @"恩"];
    NSString *string = [[NSBundle mainBundle] pathForResource:@"array" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:string];
    
    NSLog(@"%@", dic);
}




#pragma mark ------uitabelview data source------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.textLabelArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    /** 带箭头样式*/
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.textLabelArray[indexPath.row];
    cell.detailTextLabel.text = self.detailTextLabelArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /** 检测Example中是否有Base%@Controller,有则创建ViewController并且push*/
    Class cls = NSClassFromString([NSString stringWithFormat:@"Example%@ViewController",@(indexPath.row+1)]);
    if (cls) {
        [self.navigationController pushViewController:[[cls alloc] init] animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
