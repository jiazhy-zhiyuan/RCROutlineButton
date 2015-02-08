//
//  RCROutlineButton.h
//
//  Created by Rich Robinson on 01/02/2015.
//  Copyright (c) 2015 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 A <tt>UIButton</tt> subclass with an outline border whose colour matches that of the title label.
 */
IB_DESIGNABLE
@interface RCROutlineButton : UIButton

/**
 The corner radius of the button. Note that this property is <tt>IBInspectable</tt> and can be set directly in Interface Builder.
 */
@property (nonatomic) IBInspectable CGFloat cornerRadius;

/**
 The border width of the button. Note that this property is <tt>IBInspectable</tt> and can be set directly in Interface Builder.
 */
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
