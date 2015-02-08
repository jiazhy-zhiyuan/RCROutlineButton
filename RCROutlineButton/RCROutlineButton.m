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


@interface RCROutlineButton ()

@property (nonatomic, strong) UIColor *primaryColor;
@property (nonatomic, strong) UIColor *highlightedColor;
@property (nonatomic, strong) UIColor *disabledColor;

@end


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
    _primaryColor = self.titleLabel.textColor;
    _highlightedColor = [self makeHighlightedColor];
    _disabledColor = [self makeDisabledColor];
    
    self.layer.cornerRadius = DefaultCornerRadius;
    self.clipsToBounds = YES;
    self.layer.borderWidth = DefaultBorderWidth;
    
    [self updateToColor:self.normalColor];
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

#pragma mark - Overridden UIControl methods

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
 
    [self updateToColor:self.normalColor];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        [self updateToColor:self.highlightedColor];
    }
    else {
        [self updateToColor:self.normalColor];
    }
}

#pragma mark - Methods for dealing with color

- (void)updateToColor:(UIColor *)color {
    dispatch_async(dispatch_get_main_queue(), ^{
        // We set the color in two ways, which seems to get things behaving as we want for both iOS 7 and iOS 8
        self.titleLabel.textColor = color;
        [self setTitleColor:color forState:UIControlStateNormal];
        
        self.layer.borderColor = color.CGColor;
    });
}

- (UIColor *)normalColor {
    return self.isEnabled ? self.primaryColor : self.disabledColor;
}

- (UIColor *)makeHighlightedColor {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [_primaryColor getRed:&red green:&green blue:&blue alpha:NULL];
    
    red *= HighlightBrightnessFactor;
    green *= HighlightBrightnessFactor;
    blue *= HighlightBrightnessFactor;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (UIColor *)makeDisabledColor {
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat oldAlpha;
    
    [_primaryColor getRed:&red green:&green blue:&blue alpha:&oldAlpha];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:DisabledAlpha];
}

@end
