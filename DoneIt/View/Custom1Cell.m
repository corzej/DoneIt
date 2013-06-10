//
//  Custom1Cell.m
//  DoneIt
//
//  Created by eungJin on 5/22/13.
//  Copyright (c) 2013 rollintiger. All rights reserved.
//

#import "Custom1Cell.h"

@implementation Custom1Cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addContentText];
        [self addTimeText];
        [self setupBackground];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupBackground {
    UIImage *bg = [UIImage imageNamed:@"cell-bg.png"];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:bg];
    self.backgroundView = backgroundView;
    
    UIImage *highlight = [UIImage imageNamed:@"cell-bg-highlighted.png"];
    UIImageView *highlightImageView = [[UIImageView alloc] initWithImage:highlight];
    self.selectedBackgroundView = highlightImageView;
}
- (void)addContentText {
    self.contentText = [[UILabel alloc] init];
    self.contentText.font = [UIFont boldSystemFontOfSize:16];
    self.contentText.textColor = [UIColor colorWithWhite:0.45 alpha:1.0];
    self.contentText.shadowColor = [UIColor whiteColor];
    self.contentText.shadowOffset = CGSizeMake(0, 1);
    self.contentText.backgroundColor = [UIColor clearColor];
    self.contentText.highlightedTextColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.contentText];
}
- (void)addTimeText {
    self.timeText = [[UILabel alloc] init];
    self.timeText.font = [UIFont systemFontOfSize:14];
    self.timeText.textColor = [UIColor colorWithWhite:0.55 alpha:1.0];
    self.timeText.shadowColor = [UIColor whiteColor];
    self.timeText.shadowOffset = CGSizeMake(0, 1);
    self.timeText.backgroundColor = [UIColor clearColor];
    self.timeText.highlightedTextColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.timeText];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    const CGFloat HorizontalMargin = 10;
    const CGFloat VerticalMargin = 4;
    
    CGFloat x = HorizontalMargin;
    CGFloat y = VerticalMargin;
    CGSize textSize = [self.contentText.text sizeWithFont:self.contentText.font];
    CGFloat width = textSize.width;
    CGFloat height = self.contentView.frame.size.height - (2 * VerticalMargin);
    self.contentText.frame = CGRectMake(x, y, width, height);
    
    x += width + HorizontalMargin;
    textSize = [self.timeText.text sizeWithFont:self.timeText.font];
    width = textSize.width;
    self.timeText.frame = CGRectMake(x, y, width, height);
}

@end
