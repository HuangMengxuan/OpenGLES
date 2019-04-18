//
//  BaseTableViewItem.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/18.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static CGFloat const BaseCellInvalidHeight = -1.0f;

@interface BaseTableViewItem : NSObject

@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *itemSubTitle;
@property (nonatomic, strong) UIImage *itemImage;
@property (nonatomic, strong) UIView *itemAccessoryView;

@property (nonatomic, assign) CGFloat cellHeight;   // 缓存行高

- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image;
- (instancetype)initWithTitle:(nullable NSString *)title subTitle:(nullable NSString *)subTitle image:(nullable UIImage *)image accessoryView:(nullable UIView *)accessoryView;

@end

NS_ASSUME_NONNULL_END
