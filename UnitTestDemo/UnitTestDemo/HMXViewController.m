//
//  HMXViewController.m
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import "HMXViewController.h"
#import "HMXTableViewDataSource.h"

typedef NS_ENUM(NSInteger, CassFontWeightStyle) {
    CassFontWeightStyleMedium, // 中黑体
    CassFontWeightStyleSemibold, // 中粗体
    CassFontWeightStyleLight, // 细体
    CassFontWeightStyleUltralight, // 极细体
    CassFontWeightStyleRegular, // 常规体
    CassFontWeightStyleThin, // 纤细体
};

@interface HMXViewController () <HMXTableViewDataSourceDelegate>

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;

@end

@implementation HMXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tableView.dataSource = self;
}

#pragma mark - HMXTableViewDataSourceDelegate
- (void)tableViewDataSourceChanged:(HMXTableViewDataSource *)tableViewDataSource {
    [self.tableView reloadData];
}

- (void)tableViewDataSource:(HMXTableViewDataSource *)tableViewDataSource didSelectIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Private Methods
- (void)pushViewControllerWithType:(NSString *)type {
    
}

#pragma mark - Properties
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)setDataSource:(id<UITableViewDelegate, UITableViewDataSource>)dataSource {
    _dataSource = dataSource;
    
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = dataSource;
    
    ((HMXTableViewDataSource *)dataSource).delegate = self;
}

@end
