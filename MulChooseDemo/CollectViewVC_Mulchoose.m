//
//  CollectViewMulchoose.m
//  MulChooseDemo
//
//  Created by L2H on 16/7/13.
//  Copyright © 2016年 ailk. All rights reserved.
//

#import "CollectViewVC_Mulchoose.h"
#import "MulChooseCollectView.h"

@interface CollectViewVC_Mulchoose (){
    MulChooseCollectView * MyCollectView;
    NSMutableArray * dataArr;
}

@end

@implementation CollectViewVC_Mulchoose
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //增加数据
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"AddArr" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    MyCollectView = [MulChooseCollectView ShareCollectviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.frame.size.height) HeaderTitle:@"全选"];
    MyCollectView.dataArr = dataArr;
    MyCollectView.block = ^(NSString *chooseContent,NSMutableArray *chooseArr){
        NSLog(@"%@ %@",chooseContent,chooseArr);
    };
    [self.view addSubview:MyCollectView];
}


//增加数据刷新（可根据实际情况修改）
-(void)click{
    NSUInteger CurrentCount = dataArr.count;
    for (int i=1; i<=10; i++) {
        [dataArr addObject:[NSString stringWithFormat:@"%lu",CurrentCount+i]];
    }
    MyCollectView.dataArr = dataArr;
    [MyCollectView ReloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
