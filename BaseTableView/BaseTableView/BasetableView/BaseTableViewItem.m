//
//  BaseTableViewItem.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewItem.h"

@implementation BaseTableViewItem

- (instancetype)initWithTitle:(NSString *)title {
    return [[BaseTableViewItem alloc] initWithTitle:title subTitle:nil image:nil accessoryView:nil];
}

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image {
    return [[BaseTableViewItem alloc] initWithTitle:title subTitle:nil image:image accessoryView:nil];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image {
    return [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle image:image accessoryView:nil];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image accessoryView:(UIView *)accessoryView {
    if (self = [super init]) {
        _cellHeight = BaseCellInvalidHeight;
        
        _itemTitle = title;
        _itemSubTitle = subTitle;
        _itemImage = image;
        _itemAccessoryView = accessoryView;
    }
    return self;
}

@end
