//
//  JFAllBasicViewController.m
//  JFAnimation
//
//  Created by 保修一站通 on 15/11/2.
//  Copyright © 2015年 JF. All rights reserved.
//  demo详解:http://www.jianshu.com/p/d4c516a2d82a
//  github :https://github.com/tubie/JFAnimation
#define JFIMAGE1 @"01.jpeg"
#define JFIMAGE2 @"02.jpeg"
#define JFDURATION 0.7f
#import "JFAllBasicViewController.h"

@interface JFAllBasicViewController ()
@property (nonatomic, assign) int subtype;

@end

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;

@implementation JFAllBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 [self addBgImageWithImageName:JFIMAGE2];}

- (IBAction)buttonClick:(id)sender {
    
    UIButton *button = sender;
    AnimationType animationType = button.tag;
    
    NSString *subtypeString;
    
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    _subtype += 1;
    if (_subtype > 3) {
        _subtype = 0;
    }
    
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
            break;
            
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
            break;
            
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
            break;
            
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
            
        default:
            break;
    }
    
    static int i = 0;
    if (i == 0) {
        [self addBgImageWithImageName:JFIMAGE1];
        i = 1;
    }
    else
    {
        [self addBgImageWithImageName:JFIMAGE2];
        i = 0;
    }
    
}


#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = JFDURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
}



#pragma UIView实现动画
- (void) animationWithView : (UIView *)view WithAnimationTransition : (UIViewAnimationTransition) transition
{
    [UIView animateWithDuration:JFDURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}



#pragma 给View添加背景图
-(void)addBgImageWithImageName:(NSString *) imageName
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
