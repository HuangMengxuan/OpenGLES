//
//  HMXTableViewDataSource.m
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import "HMXTableViewDataSource.h"

@implementation HMXTableViewDataSource

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HMXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[HMXTableViewCell cellIdentifier]];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewDataSource:didSelectIndexPath:)]) {
        [self.delegate tableViewDataSource:self didSelectIndexPath:indexPath];
    }
}

#pragma mark - Properties
- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray.copy;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewDataSourceChanged:)]) {
        [self.delegate tableViewDataSourceChanged:self];
    }
}

@end
