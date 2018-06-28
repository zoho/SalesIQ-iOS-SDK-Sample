//
//  UIView+Glow.m
//

#import <UIKit/UIKit.h>

@interface UIView (Glow)

@property (nonatomic, readonly) UIView* glowView;

// Fade up, then down.
- (void) glowOnce;

// Useful for indicating "this object should be over there"
- (void) glowOnceAtLocation:(CGPoint)point inView:(UIView*)view;

- (void) startGlowing;
- (void) startGlowingWithColor:(UIColor*)color intensity:(CGFloat)intensity;

- (void) stopGlowing;

@end
