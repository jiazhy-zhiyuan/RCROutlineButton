//
//  RCROutlineButton.m
//
//  Created by Rich Robinson on 01/02/2015.
//  Copyright (c) 2015 Rich Robinson. All rights reserved.
//

#import "RCROutlineButton.h"


CGFloat const DefaultCornerRadius = 5.0f;
CGFloat const DefaultBorderWidth = 1.5f;
CGFloat const HighlightBrightnessFactor = 0.5f;
CGFloat const DisabledAlpha = 0.5f;

@implementation RCROutlineButton

#pragma mark - Initialization

// Cater for initialization via code
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

// Cater for initialization via a decoder (specifically, we're catering for use of RCROutlineButton via Interface Builder)
- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = DefaultCornerRadius;
    self.layer.borderWidth = DefaultBorderWidth;
    
    [self automaticallySetHighlightedAndDisabledTitleColors];
    [self updateBorderColorToMatchTitleLabel];
}

#pragma mark - Getter and setter methods for our IBInspectable properties

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

#pragma mark - Overridden UIButton methods

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    
    if (state == UIControlStateNormal) {
        [self automaticallySetHighlightedAndDisabledTitleColors];
    }
}

#pragma mark - Overridden UIControl methods

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    [self updateBorderColorToMatchTitleLabel];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    [self updateBorderColorToMatchTitleLabel];
}

#pragma mark - Methods for dealing with color

- (void)automaticallySetHighlightedAndDisabledTitleColors {
    [self setTitleColor:[self makeHighlightedColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[self makeDisabledColor] forState:UIControlStateDisabled];
}

- (void)updateBorderColorToMatchTitleLabel {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.layer.borderColor = self.titleLabel.textColor.CGColor;
    });
}

- (UIColor *)makeHighlightedColor {
    CGFloat red;
    CGFloat green;
    CGFloat blue;

    [[self titleColorForState:UIControlStateNormal] getRed:&red green:&green blue:&blue alpha:NULL];
    
    CGFloat highlightRed = red*HighlightBrightnessFactor;
    CGFloat highlightGreen = green*HighlightBrightnessFactor;
    CGFloat highlightBlue = blue*HighlightBrightnessFactor;
    
    return [UIColor colorWithRed:highlightRed green:highlightGreen blue:highlightBlue alpha:1.0];
}

- (UIColor *)makeDisabledColor {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [[self titleColorForState:UIControlStateNormal] getRed:&red green:&green blue:&blue alpha:NULL];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:DisabledAlpha];
}

@end
