RCROutlineButton
================

An iOS `UIButton` subclass with an outline border whose colour matches that of the title label, updating appropriately when the button is disabled or pressed.

![Sample app screenshot](./screenshot.png)

## What it Depends on

`RCROutlineButton` has been verified as working with Xcode 6.1, iOS 7.1 and iOS 8.1.

All code uses ARC.

## How to Use it

Add the `RCROutlineButton` folder and code to your project. You can then use the button programmatically or via Interface Builder as you would any other `UIButton`.

The simplest way to use `RCROutlineButton` is with Interface Builder.

First, drag a regular `UIButton` out into your view. Then, using the Identity Inspector, set the button’s class to be `RCROutlineButton`. Finally, using the Attributes Inspector, change the type of the button to be ‘Custom’.

You can then customize the button’s title font and text colour for the ‘Default’ Config State as usual. The button’s outline border colour will be set to match the title text.

Note that the text colour attribute of `RCROutlineButton` is intended to be configured for the button’s ‘normal’ control state only. In Interface Builder this is represented by the ‘Default’ value of the State Config attribute. Setting the colour for this default state will result in the colour for the Highlighted and Disabled states being set automatically by the button. As such, please ensure the ‘Default’ value is selected when changing the title colour. 

If you want to customize the button’s corner radius and border width, you can do this using the corresponding attributes in the Outline Button section of the Attributes Inspector.

Examples of using `RCROutlineButton` with Interface Builder in this way can be seen in the sample project.

Should you wish to use `RCROutlineButton` programmatically, you can do so essentially as you would any other `UIButton` (bearing in mind the above information regarding the button attributes and control state that should be represented in code form).

## Sample Project

A sample project containing examples of buttons can be found in the `RCROutlineButtonSample` folder.

## API Docs

The [latest API documentation](http://cocoadocs.org/docsets/RCROutlineButton/) can be found on CocoaDocs.

## License

MIT License (see `LICENSE` in the root of the repository).
