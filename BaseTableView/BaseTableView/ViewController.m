//
//  ViewController.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import "ViewController.h"
//#import "BaseTableView/BaseTableView.h"

@interface ViewController ()

//@property (nonatomic, strong) NSMutableArray<BaseTableViewItemSection *> *sections;
//@property (nonatomic, strong) BaseTableView *tableView;
//@property (nonatomic, strong) BaseTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    BaseTableViewItemSection *firstSection = [[BaseTableViewItemSection alloc] initWithItems:
//                                              [NSMutableArray arrayWithObjects:
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第一条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第二条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第三条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第四条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第五条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第六条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第七条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第八条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第九条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十一条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十二条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十三条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十四条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十五条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十六条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十七条消息" subTitle:nil image:nil],
//                                               [[BaseTableViewItem alloc] initWithTitle:@"第十八条消息" subTitle:nil image:nil],
//                                               nil]];
//    self.sections = [NSMutableArray arrayWithObject: firstSection];
//    self.dataSource.itemSections = self.sections;
//
//    [self.tableView reloadData];
}

- (void)createTableView {
//    if (!self.tableView) {
//        
//        self.dataSource = [[BaseTableViewDataSource alloc] init];
//        
//        
//        self.tableView = [[BaseTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        self.tableView.baseDataSource = self.dataSource;
////        self.tableView.baseDelegate = self;
//        [self.view addSubview:self.tableView];
//    }
}



@end
