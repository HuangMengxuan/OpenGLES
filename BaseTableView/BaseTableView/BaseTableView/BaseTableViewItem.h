//
//  BaseTableViewItem.h
//  BaseTableView
//
//  Created by 不介 on 2019/4/15.
//  Copyright © 2019 不介. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern CGFloat const BaseCellInvalidHeight;

@interface BaseTableViewItem : NSObject

@property (nonatomic, copy) NSString *itemTitle;
@property (nonatomic, copy) NSString *itemSubTitle;
@property (nonatomic, strong) UIImage *itemPlaceholderImage;
@property (nonatomic, strong) UIImage *itemImage;
@property (nonatomic, strong) UIView *itemAccessoryView;

@property (nonatomic, assign) CGFloat cellHeight;   // 缓存行高

- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle placeholderImage:(UIImage *)placeholderImage image:(UIImage *)image;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image accessoryView:(UIView *)accessoryView;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSString *)subTitle placeholderImage:(nullable UIImage *)placeholderImage image:(nullable UIImage *)image accessoryView:(nullable UIView *)accessoryView;

@end

NS_ASSUME_NONNULL_END
