//
//  HMXTableViewCell.m
//  UnitTestDemo
//
//  Created by 不介 on 2019/4/9.
//  Copyright © 2019 不介. All rights reserved.
//

#import "HMXTableViewCell.h"

@implementation HMXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Properties
+ (NSString *)cellIdentifier {
    return @"TableViewCellIdentifier";
}

- (void)setModel:(HMXModel *)model {
    _model = model;
}

@end
