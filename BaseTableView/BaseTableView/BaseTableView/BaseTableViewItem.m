//
//  BaseTableViewItem.m
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import "BaseTableViewItem.h"

const CGFloat BaseCellInvalidHeight = -1.0f;

@implementation BaseTableViewItem

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image {
    return [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle placeholderImage:nil image:image accessoryView:nil];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle placeholderImage:(UIImage *)placeholderImage image:(UIImage *)image {
    return [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle placeholderImage:placeholderImage image:image accessoryView:nil];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image accessoryView:(UIView *)accessoryView {
    return [[BaseTableViewItem alloc] initWithTitle:title subTitle:subTitle placeholderImage:nil image:image accessoryView:accessoryView];
}

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle placeholderImage:(UIImage *)placehoderImage image:(UIImage *)image accessoryView:(UIView *)accessoryView {
    if (self = [super init]) {
        self.itemTitle = title;
        self.itemSubTitle = subTitle;
        self.itemPlaceholderImage = placehoderImage;
        self.itemImage = image;
        self.itemAccessoryView = accessoryView;
    }
    return self;
}

@end
