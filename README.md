##  iOS逆向工程开发 越狱Jailbreak Cydia deb插件开发
![touch4](https://github.com/XLsn0w/Cydia/blob/master/iOS%206.1.6%20jailbreak.JPG?raw=true)

![SE](https://github.com/XLsn0w/Cydia/blob/master/iOS%209.3.2%20jailbreak.JPG?raw=true)
# 我的微信公众号: Cydiapple
![cydiapple](https://github.com/XLsn0w/XLsn0w/raw/XLsn0w/XLsn0w/Cydiapple.png?raw=true)
## Cycript / Class-dump / Theos / Reveal / Dumpdecrypted  逆向工具使用介绍

越狱开发常见的工具OpenSSH，Dumpdecrypted，class-dump、Theos、Reveal、IDA，Hopper，

# 添加我的Github个人Cydia插件源: 
```
https://xlsn0w.github.io/CydiaRepo
https://xlsn0w.github.io/ipas
//                     _0_
//                   _oo0oo_
//                  o8888888o
//                  88" . "88
//                  (| -_- |)
//                  0\  =  /0
//                ___/`---'\___
//              .' \\|     |// '.
//             / \\|||  :  |||// \
//            / _||||| -:- |||||- \
//           |   | \\\  -  /// |   |
//           | \_|  ''\---/''  |_/ |
//           \  .-\__  '-'  ___/-. /
//         ___'. .'  /--.--\  `. .'___
//      ."" '<  `.___\_<|>_/___.' >' "".
//     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//     \  \ `_.   \_ __\ /__ _/   .-` /  /
// XL---`-.____`.___ \_____/___.-`___.-'---sn0w
//                   `=---='
```

![CydiaRepo](https://github.com/XLsn0w/Cydia/blob/master/xlsn0w.github.io:CydiaRepo.png?raw=true)

# iOS Jailbreak Material - 推荐阅读iOS越狱资料
清单:
```
iOS 8.4.1 Yalu Open Source Jailbreak Project: https://github.com/kpwn/yalu

OS-X-10.11.6-Exp-via-PEGASUS: https://github.com/zhengmin1989/OS-X-10.11.6-Exp-via-PEGASUS

iOS 9.3.* Trident exp: https://github.com/benjamin-42/Trident

iOS 10.1.1 mach_portal incomplete jailbreak: https://bugs.chromium.org/p/project-zero/issues/detail?id=965#c2

iOS 10.2 jailbreak source code: https://github.com/kpwn/yalu102

Local Privilege Escalation for macOS 10.12.2 and XNU port Feng Shui: https://github.com/zhengmin1989/macOS-10.12.2-Exp-via-mach_voucher

Remotely Compromising iOS via Wi-Fi and Escaping the Sandbox: https://www.youtube.com/watch?v=bP5VP7vLLKo

Pwn2Own 2017 Safari sandbox: https://github.com/maximehip/Safari-iOS10.3.2-macOS-10.12.4-exploit-Bugs

Live kernel introspection on iOS: https://bazad.github.io/2017/09/live-kernel-introspection-ios/

iOS 11.1.2 IOSurfaceRootUserClient double free to tfp0: https://bugs.chromium.org/p/project-zero/issues/detail?id=1417

iOS 11.3.1 MULTIPATH kernel heap overflow to tfp0: https://bugs.chromium.org/p/project-zero/issues/detail?id=1558

iOS 11.3.1 empty_list kernel heap overflow to tfp0: https://bugs.chromium.org/p/project-zero/issues/detail?id=1564
```

```
$ touch .gitattributes

添加文件内容为

*.h linguist-language=Logos
*.m linguist-language=Logos 

含义即将所有的.m文件识别成Logos，也可添加多行相应的内容从而修改到占比，从而改变GitHub项目识别语言

```

# theos 的一些事

( Logos is a component of the Theos development suite that allows method hooking code to be written easily and clearly, using a set of special preprocessor directives. )
Logos是Theos开发套件的一个组件，该套件允许使用一组特殊的预处理程序指令轻松而清晰地编写方法挂钩代码。

This is an [Logos 语法介绍](http://iphonedevwiki.net/index.php/Logos").

// 使用-switch选项可将系统上的Xcode更改为另一个版本：
$ sudo xcode-select --switch /Applications/Xcode.app
$ sudo xcode-select -switch /Applications/Xcode.app

安装命令
```
$ export THEOS=/opt/theos        
$ sudo git clone git://github.com/DHowett/theos.git $THEOS
```

安装ldid 签名工具
```
http://joedj.net/ldid  然后复制到/opt/theos/bin 
然后sudo chmod 777 /opt/theos/bin/ldid
```

配置CydiaSubstrate
用iTools,将iOS上
```
/Library/Frameworks/CydiaSubstrate.framework/CydiaSubstrate
```
拷贝到电脑上, 然后改名为libsubstrate.dylib , 然后拷贝到/opt/theos/lib 中.

安装神器dkpg
```
$ sudo port install dpkg
```
//不需要再下载那个dpkg-deb了

增加nic-templates(可选)
```
从 https://github.com/DHowett/theos-nic-templates 下载 
```
然后将解压后的5个.tar放到/opt/theos/templates/ios/下即可

# 创建deb tweak

/opt/theos/bin/nic.pl
```
NIC 1.0 - New Instance Creator
——————————
  [1.] iphone/application
  [2.] iphone/library
  [3.] iphone/preference_bundle
  [4.] iphone/tool
  [5.] iphone/tweak
Choose a Template (required): 1
Project Name (required): firstdemo
Package Name [com.yourcompany.firstdemo]: 
Author/Maintainer Name [Author Name]: 
Instantiating iphone/application in firstdemo/…
Done.
```
选择 [5.] iphone/tweak
```
Project Name (required): Test
Package Name [com.yourcompany.test]: com.test.firstTest
Author/Maintainer Name [小伍]: xiaowu
[iphone/tweak] MobileSubstrate Bundle filter [com.apple.springboard]: com.apple.springboard
[iphone/tweak] List of applications to terminate upon installation (space-separated, '-' for none) [SpringBoard]: SpringBoard
```
第一个相当于工程文件夹的名字
第二个相当于bundle id
第三个就是作者
第四个是作用对象的bundle identifier
第五个是要重启的应用
b.修改Makefile
```
TWEAK_NAME = iOSRE
iOSRE_FILES = Tweak.xm
include $(THEOS_MAKE_PATH)/tweak.mk
THEOS_DEVICE_IP = 192.168.1.34
iOSRE_FRAMEWORKS=UIKit Foundation
ARCHS = arm64
```
上面的ip必须写, 当然写你测试机的ip , 然后archs 写你想生成对应机型的型号

c.便携Tweak.xm
```
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>

%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {

UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome"
message:@"Welcome to your iPhone!"
delegate:nil
cancelButtonTitle:@"Thanks"
otherButtonTitles:nil];
[alert show];
[alert release];
%orig;

}

%end
```
你默认的Tweak.xm里面的代码都是被注销的

d.设置环境变量
打开terminal输入
```
export THEOS=/opt/theos/
export THEOS_DEVICE_IP=xxx.xxx.xxx.xxx(手机的ip地址)
```
3.构建工程

第一个命令:make

```
$ make
Making all for application firstdemo…
 Compiling main.m…
 Compiling firstdemoApplication.mm…
 Compiling RootViewController.mm…
 Linking application firstdemo…
 Stripping firstdemo…
 Signing firstdemo…
 ```
第二个命令:make package
```
make package
Making all for application firstdemo…
make[2]: Nothing to be done for ‘internal-application-compile’.
Making stage for application firstdemo…
 Copying resource directories into the application wrapper…
dpkg-deb: building package ‘com.yourcompany.firstdemo’ in ‘/Users/author/Desktop/firstdemo/com.yourcompany.firstdemo_0.0.1-1_iphoneos-arm.deb’.
```

第三个命令: make package install
```
$ make package install
Making all for application firstdemo…
make[2]: Nothing to be done for `internal-application-compile’.
Making stage for application firstdemo…
 Copying resource directories into the application wrapper…
dpkg-deb: building package ‘com.yourcompany.firstdemo’ in ‘/Users/author/Desktop/firstdemo/com.yourcompany.firstdemo_0.0.1-1_iphoneos-arm.deb’.
...
root@ip’s password: 
...
```
# 过程会让你输入两次iphoen密码 , 默认是alpine

** 当然你也可以直接 make package install 一步到位, 直接编译, 打包, 安装一气呵成**

# 说一说 遇到的坑
1.在 环境安装 的第二步骤 下载theos , 下载好的theos有可能是有问题的

 /opt/theos/vendor/  里面的文件是否是空的? 仔细检查 否则在make编译的时候回报一个 什么vendor 的错误
2.如果在make成功之后还想make 发现报了Nothing to be done for `internal-library-compile’错误

那就把你刚才创建出来的obj删掉和packages删掉 , 然后显示隐藏文件, 你就会发现和obj同一个目录有一个.theos , 吧.theos里面的东西删掉就好了
3.简单总结下

基本问题就一下几点:
1.代码%hook ClassName 没有修改
2.代码没调用头文件
3.代码注释没有解开(代码写错)
4.makefile里面东西写错
5.makefile里面没有写ip地址
6.没有配置环境地址
7.遇到路径的问题你就 export THEOS_DEVICE_IP=192.168.1.34
8.遇到路径问题你就THEOS=/opt/theos 

# 插件开发(.xm)

dpkg -i package.deb               #安装包
dpkg -r package                      #删除包
dpkg -P package                     #删除包（包括配置文件）
dpkg -L package                     #列出与该包关联的文件
dpkg -l package                      #显示该包的版本
dpkg --unpack package.deb  #解开deb包的内容
dpkg -S keyword                    #搜索所属的包内容
dpkg -l                                    #列出当前已安装的包
dpkg -c package.deb             #列出deb包的内容
dpkg --configure package     #配置包

## deb 大概结构
其中包括：DEBIAN目录 和 软件具体安装目录（模拟安装目录）（如etc, usr, opt, tmp等）。
在DEBIAN目录中至少有control文件，还可能有postinst(postinstallation)、postrm(postremove)、preinst(preinstallation)、prerm(preremove)、copyright (版权）、changlog （修订记录）和conffiles等。

postinst文件：包含了软件在进行正常目录文件拷贝到系统后，所需要执行的配置工作。
prerm文件：软件卸载前需要执行的脚本。
postrm文件：软件卸载后需要执行的脚本。
control文件：这个文件比较重要，它是描述软件包的名称（Package），版本（Version），描述（Description）等，是deb包必须剧本的描述性文件，以便于软件的安装管理和索引。
其中可能会有下面的字段：
-- Package 包名
-- Version 版本
-- Architecture：软件包结构，如基于i386, amd64,m68k, sparc, alpha, powerpc等
-- Priority：申明软件对于系统的重要程度，如required, standard, optional, extra等
-- Essential：申明是否是系统最基本的软件包（选项为yes/no），如果是的话，这就表明该软件是维持系统稳定和正常运行的软件包，不允许任何形式的卸载（除非进行强制性的卸载）
-- Section：申明软件的类别，常见的有utils, net, mail, text, devel 等
-- Depends：软件所依赖的其他软件包和库文件。如果是依赖多个软件包和库文件，彼此之间采用逗号隔开
-- Pre-Depends：软件安装前必须安装、配置依赖性的软件包和库文件，它常常用于必须的预运行脚本需求
-- Recommends：这个字段表明推荐的安装的其他软件包和库文件
-- Suggests：建议安装的其他软件包和库文件
-- Description：对包的描述
-- Installed-Size：安装的包大小
-- Maintainer：包的制作者，联系方式等
我的测试包的control：

Package: kellan-test
Version: 1.0
Architecture: all
Maintainer: Kellan Fan
Installed-Size: 128
Recommends:
Suggests:
Section: devel
Priority: optional
Multi-Arch: foreign
Description: just for test
三 制作包
制作包其实很简单，就一条命令
dpkg -b <包目录> <包名称>.deb

四 其他命令
安装
dpkg -i xxx.deb
卸载
dpkg -r xxx.deb
解压缩包
dpkg -X xxx.deb [dirname]

```
$ dpkg -b /Users/mac/Desktop/debPath debName.deb
dpkg-deb: 正在 'x.deb' 中构建软件包 'com.gtx.gtx'。
```
```
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#define kBundlePath @"/Library/Application Support/Neptune"

BOOL isFluidInterfaceEnabled;
long _homeButtonType = 1;
BOOL isHomeIndicatorEnabled;
BOOL isButtonCombinationOverrideDisabled;
BOOL isTallKeyboardEnabled;
BOOL isPIPEnabled;
int  statusBarStyle;
BOOL isWalletEnabled;
BOOL isNewsIconEnabled;
BOOL prototypingEnabled = NO;

@interface CALayer (CornerAddition)
-(bool)continuousCorners;
@property (assign) bool continuousCorners;
-(void)setContinuousCorners:(bool)arg1;
@end

/// MARK: - Group: Button remap
%group ButtonRemap

// Siri remap
%hook SBLockHardwareButtonActions
- (id)initWithHomeButtonType:(long long)arg1 proximitySensorManager:(id)arg2 {
    return %orig(_homeButtonType, arg2);
}
%end

%hook SBHomeHardwareButtonActions
- (id)initWitHomeButtonType:(long long)arg1 {
    return %orig(_homeButtonType);
}
%end

// Screenshot remap
int applicationDidFinishLaunching;

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application {
    applicationDidFinishLaunching = 2;
    %orig;
}
%end

%hook SBPressGestureRecognizer
- (void)setAllowedPressTypes:(NSArray *)arg1 {
    NSArray * lockHome = @[@104, @101];
    NSArray * lockVol = @[@104, @102, @103];
    if ([arg1 isEqual:lockVol] && applicationDidFinishLaunching == 2) {
        %orig(lockHome);
        applicationDidFinishLaunching--;
        return;
    }
    %orig;
}
%end

%hook SBClickGestureRecognizer
- (void)addShortcutWithPressTypes:(id)arg1 {
    if (applicationDidFinishLaunching == 1) {
        applicationDidFinishLaunching--;
        return;
    }
    %orig;
}
%end

%hook SBHomeHardwareButton
- (id)initWithScreenshotGestureRecognizer:(id)arg1 homeButtonType:(long long)arg2 buttonActions:(id)arg3 gestureRecognizerConfiguration:(id)arg4 {
    return %orig(arg1,_homeButtonType,arg3,arg4);
}
- (id)initWithScreenshotGestureRecognizer:(id)arg1 homeButtonType:(long long)arg2 {
    return %orig(arg1,_homeButtonType);
}
%end

%hook SBLockHardwareButton
- (id)initWithScreenshotGestureRecognizer:(id)arg1 shutdownGestureRecognizer:(id)arg2 proximitySensorManager:(id)arg3 homeHardwareButton:(id)arg4 volumeHardwareButton:(id)arg5 buttonActions:(id)arg6 homeButtonType:(long long)arg7 createGestures:(_Bool)arg8 {
    return %orig(arg1,arg2,arg3,arg4,arg5,arg6,_homeButtonType,arg8);
}
- (id)initWithScreenshotGestureRecognizer:(id)arg1 shutdownGestureRecognizer:(id)arg2 proximitySensorManager:(id)arg3 homeHardwareButton:(id)arg4 volumeHardwareButton:(id)arg5 homeButtonType:(long long)arg6 {
    return %orig(arg1,arg2,arg3,arg4,arg5,_homeButtonType);
}
%end

%hook SBVolumeHardwareButton
- (id)initWithScreenshotGestureRecognizer:(id)arg1 shutdownGestureRecognizer:(id)arg2 homeButtonType:(long long)arg3 {
    return %orig(arg1,arg2,_homeButtonType);
}
%end

%end

%group ControlCenter122UI

// MARK: Control Center media controls transition (from iOS 12.2 beta)
@interface MediaControlsRoutingButtonView : UIView
- (long long)currentMode;
@end

long currentCachedMode = 99;

static CALayer* playbackIcon;
static CALayer* AirPlayIcon;
static CALayer* platterLayer;

%hook MediaControlsRoutingButtonView
- (void)_updateGlyph {

    if (self.currentMode == currentCachedMode) { return; }

    currentCachedMode = self.currentMode;

    if (self.layer.sublayers.count >= 1) {
        if (self.layer.sublayers[0].sublayers.count >= 1) {
            if (self.layer.sublayers[0].sublayers[0].sublayers.count == 2) {

                playbackIcon = self.layer.sublayers[0].sublayers[0].sublayers[1].sublayers[0];
                AirPlayIcon = self.layer.sublayers[0].sublayers[0].sublayers[1].sublayers[1];
                platterLayer = self.layer.sublayers[0].sublayers[0].sublayers[1];

                if (self.currentMode == 2) { // Play/Pause Mode

                    // Play/Pause Icon
                    playbackIcon.speed = 0.5;

                    UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:1 dampingRatio:1 animations:^{
                        playbackIcon.transform = CATransform3DMakeScale(-1, -1, 1);
                        playbackIcon.opacity = 0.75;
                    }];
                    [animator startAnimation];

                    // AirPlay Icon
                    AirPlayIcon.speed = 0.75;

                    UIViewPropertyAnimator *animator2 = [[UIViewPropertyAnimator alloc] initWithDuration:1 dampingRatio:1 animations:^{
                        AirPlayIcon.transform = CATransform3DMakeScale(0.85, 0.85, 1);
                        AirPlayIcon.opacity = -0.75;
                    }];
                    [animator2 startAnimation];

                    platterLayer.backgroundColor = [[UIColor colorWithRed:0 green:0.478 blue:1.0 alpha:0.0] CGColor];

                } else if (self.currentMode == 0 || self.currentMode == 1) { // AirPlay Mode

                    // Play/Pause Icon
                    playbackIcon.speed = 0.75;

                    UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:1 dampingRatio:1 animations:^{
                        playbackIcon.transform = CATransform3DMakeScale(-0.85, -0.85, 1);
                        playbackIcon.opacity = -0.75;
                    }];
                    [animator startAnimation];

                    // AirPlay Icon
                    AirPlayIcon.speed = 0.5;

                    UIViewPropertyAnimator *animator2 = [[UIViewPropertyAnimator alloc] initWithDuration:1 dampingRatio:1 animations:^{
                        AirPlayIcon.transform = CATransform3DMakeScale(1, 1, 1);
                        if (self.currentMode == 0) {
                            AirPlayIcon.opacity = 0.75;
                            platterLayer.backgroundColor = [[UIColor colorWithRed:0 green:0.478 blue:1.0 alpha:0.0] CGColor];
                        } else if (self.currentMode == 1) {
                            AirPlayIcon.opacity = 1;
                            platterLayer.backgroundColor = [[UIColor colorWithRed:0 green:0.478 blue:1.0 alpha:1.0] CGColor];
                            platterLayer.cornerRadius = 18;
                        }
                    }];
                    [animator2 startAnimation];
                }
            }
        }
    }
}
%end

%end

%group SBButtonRefinements

// MARK: App icon selection override

long _iconHighlightInitiationSkipper = 0;

@interface SBIconView : UIView
- (void)setHighlighted:(bool)arg1;
@property(nonatomic, getter=isHighlighted) _Bool highlighted;
@end

%hook SBIconView
- (void)setHighlighted:(bool)arg1 {

    if (_iconHighlightInitiationSkipper) {
        %orig;
        return;
    }

    if (arg1 == YES) {

        if (!self.highlighted) {
            _iconHighlightInitiationSkipper = 1;
            %orig;
            %orig(NO);
            _iconHighlightInitiationSkipper = 0;
        }

        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.125 dampingRatio:1 animations:^{
            %orig;
        }];
        [animator startAnimation];
    } else {
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.3 dampingRatio:1 animations:^{
            %orig;
        }];
        [animator startAnimation];
    }
    return;
}
%end

@interface NCToggleControl : UIView
- (void)setHighlighted:(bool)arg1;
@end

%hook NCToggleControl
- (void)setHighlighted:(bool)arg1 {
    if (arg1 == YES) {

        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.125 curve:UIViewAnimationCurveEaseOut animations:^{
            %orig;
        }];
        [animator startAnimation];
    } else {
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.5 dampingRatio:1 animations:^{
            %orig;
        }];
        [animator startAnimation];
    }
    return;
}
%end


@interface SBEditingDoneButton : UIView
- (void)setHighlighted:(bool)arg1;
@end

%hook SBEditingDoneButton
-(void)layoutSubviews {
    %orig;

    if (!self.layer.masksToBounds) {
        self.layer.continuousCorners = YES;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 13;
    }

    /*
     CGRect _frame = self.frame;

     if (_frame.origin.y != 16) {
     _frame.origin.y = 16;
     self.frame = _frame;
     }*/
}
- (void)setHighlighted:(bool)arg1 {
    if (arg1 == YES) {

        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.1 curve:UIViewAnimationCurveEaseOut animations:^{
            %orig;
        }];
        [animator startAnimation];
    } else {
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.5 dampingRatio:1 animations:^{
            %orig;
        }];
        [animator startAnimation];
    }
    return;
}
%end

@interface SBFolderIconBackgroundView : UIView
@end

%hook SBFolderIconBackgroundView
- (void)layoutSubviews {
    %orig;
    self.layer.continuousCorners = YES;
}
%end
/*
 @interface SBFolderIconImageView : UIView
 @end

 %hook SBFolderIconImageView
 - (void)layoutSubviews {
 if (!self.layer.masksToBounds) {
 self.layer.continuousCorners = YES;
 self.layer.masksToBounds = YES;
 self.layer.cornerRadius = 13.5;
 }
 return %orig;
 }
 %end
 */

// MARK: Widgets screen button highlight
@interface WGShortLookStyleButton : UIView
- (void)setHighlighted:(bool)arg1;
@end

%hook WGShortLookStyleButton
- (void)setHighlighted:(bool)arg1 {
    if (arg1 == YES) {

        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.25 dampingRatio:1 animations:^{
            self.alpha = 0.6;
        }];
        [animator startAnimation];
    } else {
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.6 dampingRatio:1 animations:^{
            self.alpha = 1;
        }];
        [animator startAnimation];
    }
    return;
}
%end

%end

/// MARK: - Group: Springboard modifications
%group FluidInterface

// MARK: Enable fluid switcher
%hook BSPlatform
- (NSInteger)homeButtonType {
    return 2;
}
%end

// MARK: Lock screen quick action toggle implementation

// Define custom springboard method to remove all subviews.
@interface UIView (SpringBoardAdditions)
- (void)sb_removeAllSubviews;
@end

@interface SBDashBoardQuickActionsView : UIView
@end

// Reinitialize quick action toggles
%hook SBDashBoardQuickActionsView
- (void)_layoutQuickActionButtons {

    %orig;
    for (UIView *subview in self.subviews) {
        if (subview.frame.size.width < 50) {
            if (subview.frame.origin.x < 50) {
                CGRect _frame = subview.frame;
                _frame = CGRectMake(46, _frame.origin.y - 90, 50, 50);
                subview.frame = _frame;
                [subview sb_removeAllSubviews];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-value"
                [subview init];
#pragma clang diagnostic pop
            } else if (subview.frame.origin.x > 100) {
                CGFloat _screenWidth = subview.frame.origin.x + subview.frame.size.width / 2;
                CGRect _frame = subview.frame;
                _frame = CGRectMake(_screenWidth - 96, _frame.origin.y - 90, 50, 50);
                subview.frame = _frame;
                [subview sb_removeAllSubviews];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-value"
                [subview init];
#pragma clang diagnostic pop
            }
        }
    }
}
%end

// MARK: Cover sheet control centre grabber initialization
typedef enum {
    Tall=0,
    Regular=1
} NEPStatusBarHeightStyle;

NEPStatusBarHeightStyle _statusBarHeightStyle = Tall;

@interface SBDashBoardTeachableMomentsContainerView : UIView
@property(retain, nonatomic) UIView *controlCenterGrabberView;
@property(retain, nonatomic) UIView *controlCenterGrabberEffectContainerView;
@end

%hook SBDashBoardTeachableMomentsContainerView
- (void)layoutSubviews {
    %orig;

    if (_statusBarHeightStyle == Tall) {
        self.controlCenterGrabberEffectContainerView.frame = CGRectMake(self.frame.size.width - 73,36,46,2.5);
        self.controlCenterGrabberView.frame = CGRectMake(0,0,46,2.5);
    } else if (@available(iOS 12.1, *)) {
        // Rounded status bar visual provider
        self.controlCenterGrabberEffectContainerView.frame = CGRectMake(self.frame.size.width - 85.5,26,60.5,2.5);
        self.controlCenterGrabberView.frame = CGRectMake(0,0,60.5,2.5);
    } else {
        // Non-rounded status bar visual provider
        self.controlCenterGrabberEffectContainerView.frame = CGRectMake(self.frame.size.width - 75.5,24,60.5,2.5);
        self.controlCenterGrabberView.frame = CGRectMake(0,0,60.5,2.5);
    }
}
%end

// MARK: Corner radius implementation
@interface _UIRootWindow : UIView
@property (setter=_setContinuousCornerRadius:, nonatomic) double _continuousCornerRadius;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)arg1;
@end

// Implement system wide continuousCorners.
%hook _UIRootWindow
- (void)layoutSubviews {
    %orig;
    self._continuousCornerRadius = 5;
    self.clipsToBounds = YES;
    return;
}
%end

// Implement corner radius adjustment for when in the app switcher scroll view.
/*%hook SBDeckSwitcherPersonality
- (double)_cardCornerRadiusInAppSwitcher {
    return 17.5;
}
%end*/

// Implement round screenshot preview edge insets.
%hook UITraitCollection
+ (id)traitCollectionWithDisplayCornerRadius:(CGFloat)arg1 {
    return %orig(17);
}
%end

@interface SBAppSwitcherPageView : UIView
@property(nonatomic, assign) double cornerRadius;
@property(nonatomic) _Bool blocksTouches;
- (void)_updateCornerRadius;
@end

BOOL blockerPropagatedEvent = false;
double currentCachedCornerRadius = 0;

/// IMPORTANT: DO NOT MESS WITH THIS LOGIC. EVERYTHING HERE IS DONE FOR A REASON.

// Override rendered corner radius in app switcher page, (for anytime the fluid switcher gestures are running).
%hook SBAppSwitcherPageView

-(void)setBlocksTouches:(BOOL)arg1 {
    if (!arg1 && (self.cornerRadius == 17 || self.cornerRadius == 5 || self.cornerRadius == 3.5)) {
        blockerPropagatedEvent = true;
        self.cornerRadius = 5;
        [self _updateCornerRadius];
        blockerPropagatedEvent = false;
    } else if (self.cornerRadius == 17 || self.cornerRadius == 5 || self.cornerRadius == 3.5) {
        blockerPropagatedEvent = true;
        self.cornerRadius = 17;
        [self _updateCornerRadius];
        blockerPropagatedEvent = false;
    }

    %orig(arg1);
}

- (void)setCornerRadius:(CGFloat)arg1 {

    currentCachedCornerRadius = MSHookIvar<double>(self, "_cornerRadius");

    CGFloat arg1_overwrite = arg1;

    if ((arg1 != 17 || arg1 != 5 || arg1 != 0) && self.blocksTouches) {
        return %orig(arg1);
    }

    if (blockerPropagatedEvent && arg1 != 17) {
        return %orig(arg1);
    }

    if (arg1 == 0 && !self.blocksTouches) {
        %orig(0);
        return;
    }

    if (self.blocksTouches) {
        arg1_overwrite = 17;
    } else if (arg1 == 17) {
        // THIS IS THE ONLY BLOCK YOU CAN CHANGE
        arg1_overwrite = 5;
        // Todo: detect when, in this case, the app is being pulled up from the bottom, and activate the rounded corners.
    }

    UIView* _overlayClippingView = MSHookIvar<UIView*>(self, "_overlayClippingView");
    if (!_overlayClippingView.layer.allowsEdgeAntialiasing) {
        _overlayClippingView.layer.allowsEdgeAntialiasing = true;
    }

    %orig(arg1_overwrite);
}

- (void)_updateCornerRadius {
    /// CAREFUL HERE, WATCH OUT FOR THE ICON MORPH ANIMATION ON APPLICATION LAUNCH
    if ((self.cornerRadius == 5 && currentCachedCornerRadius == 17.0)) {
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.35 dampingRatio:1 animations:^{
            %orig;
        }];
        [animator startAnimation];
    } else {
        %orig;
    }
}
%end

// Override Reachability corner radius.
%hook SBReachabilityBackgroundView
- (double)_displayCornerRadius {
    return 5;
}
%end


// MARK: Reachability settings override
%hook SBReachabilitySettings
- (void)setSystemWideSwipeDownHeight:(double) systemWideSwipeDownHeight {
    return %orig(100);
}
%end

// High Resolution Wallpaper
@interface SBFStaticWallpaperImageView : UIImageView
@end

%hook SBFStaticWallpaperImageView
- (void)setImage:(id)arg1 {

    if (!prototypingEnabled) {
        return %orig;
    }

    NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
    NSString *imagePath = [bundle pathForResource:@"DoubleBubble_Red" ofType:@"png"];
    UIImage *myImage = [UIImage imageWithContentsOfFile:imagePath];

    UIImage *originalDownscaledImage = arg1;

    if (originalDownscaledImage.size.width == 375) {
        return %orig(myImage);
    }

    return %orig(arg1);
}
%end

%end


%group KeyboardDock

%hook UIRemoteKeyboardWindowHosted
- (UIEdgeInsets)safeAreaInsets {
    UIEdgeInsets orig = %orig;
    orig.bottom = 44;
    return orig;
}
%end

%hook UIKeyboardImpl
+(UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(NSInteger)orientation inputMode:(id)mode {
    UIEdgeInsets orig = %orig;
    orig.bottom = 44;
    return orig;
}

%end

@interface UIKeyboardDockView : UIView
@end

%hook UIKeyboardDockView

- (CGRect)bounds {
    CGRect bounds = %orig;
    if (bounds.origin.y == 0) {
        bounds.origin.y -=13;
    }
    return bounds;
}

- (void)layoutSubviews {
    %orig;
}

%end

%hook UIInputWindowController
- (UIEdgeInsets)_viewSafeAreaInsetsFromScene {
    return UIEdgeInsetsMake(0,0,44,0);
}
%end

%end

int _controlCenterStatusBarInset = -10;

// MARK: - Group: Springboard modifications (Control Center Status Bar inset)
%group ControlCenterModificationsStatusBar

@interface CCUIHeaderPocketView : UIView
@end

%hook CCUIHeaderPocketView
- (void)layoutSubviews {
    %orig;

    CGRect _frame = self.frame;
    _frame.origin.y = _controlCenterStatusBarInset;
    self.frame = _frame;
}
%end

%end

%group StatusBarProvider

// MARK: - Variable modern status bar implementation

%hook _UIStatusBarVisualProvider_iOS
+ (Class)class {
    if (statusBarStyle == 0) {
        return NSClassFromString(@"_UIStatusBarVisualProvider_Split58");
    } else if (@available(iOS 12.1, *)) {
        return NSClassFromString(@"_UIStatusBarVisualProvider_RoundedPad_ForcedCellular");
    }
    return NSClassFromString(@"_UIStatusBarVisualProvider_Pad_ForcedCellular");
}
%end

%hook _UIStatusBar
+ (double)heightForOrientation:(long long)arg1 {
    if (arg1 == 1 || arg1 == 2) {
        if (statusBarStyle == 0) {
            return %orig - 10;
        } else if (statusBarStyle == 1) {
            return %orig - 4;
        }
    }
    return %orig;
}
%end

%end


%group StatusBarModern

%hook UIStatusBarWindow
+ (void)setStatusBar:(Class)arg1 {
    return %orig(NSClassFromString(@"UIStatusBar_Modern"));
}
%end

%hook UIStatusBar_Base
+ (Class)_implementationClass {
    return NSClassFromString(@"UIStatusBar_Modern");
}
+ (void)_setImplementationClass:(Class)arg1 {
    return %orig(NSClassFromString(@"UIStatusBar_Modern"));
}
%end

%hook _UIStatusBarData
- (void)setBackNavigationEntry:(id)arg1 {
    return;
}
%end

%end


float _bottomInset = 21;

%group TabBarSizing

// MARK: - Inset behavior modifications
%hook UITabBar

- (void)layoutSubviews {
    %orig;
    CGRect _frame = self.frame;
    if (_frame.size.height == 49) {
        _frame.size.height = 70;
        _frame.origin.y = [[UIScreen mainScreen] bounds].size.height - 70;
    }
    self.frame = _frame;
}

%end

%hook UIApplicationSceneSettings

- (UIEdgeInsets)safeAreaInsetsLandscapeLeft {
    UIEdgeInsets _insets = %orig;
    _insets.bottom = _bottomInset;
    return _insets;
}
- (UIEdgeInsets)safeAreaInsetsLandscapeRight {
    UIEdgeInsets _insets = %orig;
    _insets.bottom = _bottomInset;
    return _insets;
}
- (UIEdgeInsets)safeAreaInsetsPortrait {
    UIEdgeInsets _insets = %orig;
    _insets.bottom = _bottomInset;
    return _insets;
}
- (UIEdgeInsets)safeAreaInsetsPortraitUpsideDown {
    UIEdgeInsets _insets = %orig;
    _insets.bottom = _bottomInset;
    return _insets;
}

%end

%end

// MARK: - Toolbar resizing implementation
%group ToolbarSizing
/*
 @interface UIToolbar (modification)
 @property (setter=_setBackgroundView:, nonatomic, retain) UIView *_backgroundView;
 @end

 %hook UIToolbar

 - (void)layoutSubviews {
 %orig;
 CGRect _frame = self.frame;
 if (_frame.size.height == 44) {
 _frame.origin.y = [[UIScreen mainScreen] bounds].size.height - 54;
 }
 self.frame = _frame;

 _frame = self._backgroundView.frame;
 _frame.size.height = 54;
 self._backgroundView.frame = _frame;
 }

 %end
 */
%end

%group HideLuma

// Hide Home Indicator
%hook UIViewController
- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}
%end

%end

%group CompletelyHideLuma

// Hide HomeBar
@interface MTLumaDodgePillView : UIView
@end

%hook MTLumaDodgePillView
- (id)initWithFrame:(struct CGRect)arg1 {
      return NULL;
}
%end

%end

// MARK: - Shortcuts
%group Shortcuts

@interface WFFloatingLayer : CALayer
@end

%hook WFFloatingLayer
-(BOOL)continuousCorners {
    return YES;
}
%end

%end

// MARK: - Twitter
%group Twitter

@interface TFNCustomTabBar : UIView
@end

%hook TFNCustomTabBar

- (void)layoutSubviews {
    %orig;
    CGRect _frame = self.frame;
    if (_frame.origin.y != [[UIScreen mainScreen] bounds].size.height - _frame.size.height) {
        _frame.origin.y -= 3.5;
    }
    self.frame = _frame;
}

%end

%end

// MARK: - Calendar
%group Calendar

@interface CompactMonthDividedListSwitchButton : UIView
@end

%hook CompactMonthDividedListSwitchButton
- (void)layoutSubviews {
    %orig;

    self.layer.cornerRadius = 3;
    self.layer.continuousCorners = YES;
    self.clipsToBounds = YES;
}
%end;

%end

// MARK: - Picture in Picture
%group PIPOverride

// Override MobileGestalt to always return true for PIP key - Acknowledgements: Andrew Wiik (LittleX)
extern "C" Boolean MGGetBoolAnswer(CFStringRef);
%hookf(Boolean, MGGetBoolAnswer, CFStringRef key) {
#define k(key_) CFEqual(key, CFSTR(key_))
    if (k("nVh/gwNpy7Jv1NOk00CMrw"))
        return YES;
    return %orig;
}

%end

@interface _UITableViewCellSeparatorView : UIView
- (id)_viewControllerForAncestor;
@end

@interface UITableViewHeaderFooterView (WalletAdditions)
- (id)_viewControllerForAncestor;
@end

@interface UITableViewCell (WalletAdditions)
- (id)_viewControllerForAncestor;
@end

@interface UISegmentedControl (WalletAdditions)
@property (nonatomic, retain) UIColor *tintColor;
- (id)_viewControllerForAncestor;
@end

@interface UITextView (WalletAdditions)
- (id)_viewControllerForAncestor;
@end

@interface PKContinuousButton : UIView
@end



%group NEPThemeEngine

@interface SBApplicationIcon : NSObject
@end

%hook SBApplicationIcon
- (id)getCachedIconImage:(int)arg1 {

    NSString *_applicationBundleID = MSHookIvar<NSString*>(self, "_applicationBundleID");

    if (/*[_applicationBundleID isEqualToString:@"com.atebits.Tweetie2"] || */[_applicationBundleID isEqualToString:@"com.apple.news"]) {

        NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
        NSString *imagePath = [bundle pathForResource:_applicationBundleID ofType:@"png"];
        UIImage *myImage = [UIImage imageWithContentsOfFile:imagePath];

        return myImage;
    }
    return %orig;
}
- (id)getUnmaskedIconImage:(int)arg1 {

    NSString *_applicationBundleID = MSHookIvar<NSString*>(self, "_applicationBundleID");

    if (/*[_applicationBundleID isEqualToString:@"com.atebits.Tweetie2"] || */[_applicationBundleID isEqualToString:@"com.apple.news"]) {

        NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
        NSString *imagePath = [bundle pathForResource:[NSString stringWithFormat:@"%@_unmasked", _applicationBundleID] ofType:@"png"];
        UIImage *myImage = [UIImage imageWithContentsOfFile:imagePath];

        return myImage;
    }
    return %orig;
}
- (id)generateIconImage:(int)arg1 {

    NSString *_applicationBundleID = MSHookIvar<NSString*>(self, "_applicationBundleID");

    if (/*[_applicationBundleID isEqualToString:@"com.atebits.Tweetie2"] || */[_applicationBundleID isEqualToString:@"com.apple.news"]) {

        NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
        NSString *imagePath = [bundle pathForResource:_applicationBundleID ofType:@"png"];
        UIImage *myImage = [UIImage imageWithContentsOfFile:imagePath];

        return myImage;
    }
    return %orig;
}
%end

%end

// MARK: - Wallet
%group Wallet122UI

%hook _UITableViewCellSeparatorView
- (void)layoutSubviews {
    if ([[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PassDetailViewController"] || [[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PKPaymentPreferencesViewController"]) {
        if (self.frame.origin.x == 0) {
            self.hidden = YES;
        }
    }
}
%end

%hook UISegmentedControl
- (void)layoutSubviews {
    %orig;
    if ([[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PassDetailViewController"]) {
        self.tintColor = [UIColor blackColor];
    }
}
%end

%hook UITextView
- (void)layoutSubviews {
    %orig;
    CGRect _frame = self.frame;
    if ([[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PKBarcodePassDetailViewController"] && _frame.origin.x == 16) {
        _frame.origin.x += 10;
        self.frame = _frame;
    }
}
%end



%hook PKContinuousButton
- (void)updateTitleColorWithColor:(id)arg1 {
    //if (self.frame.size.width < 90) {
    //%orig([UIColor blackColor]);
    //} else {
    %orig;
    //}
}
%end

%hook UITableViewCell
- (void)layoutSubviews {
    %orig;
    if ([[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PassDetailViewController"] || [[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PKPaymentPreferencesViewController"]) {
        CGRect _frame = self.frame;
        if (_frame.origin.x == 0) {

            self.layer.cornerRadius = 10;
            self.clipsToBounds = YES;

            typedef enum {
                Lone=0,
                Bottom=1,
                Top=2,
                Middle=3
            } NEPCellPosition;

            NEPCellPosition _cellPosition = Middle;

            for (UIView *subview in self.subviews) {
                if ([[NSString stringWithFormat:@"%@", subview] containsString:@"_UITableViewCellSeparatorView"] && subview.frame.origin.x == 0 && subview.frame.origin.y == 0 && subview.frame.size.height == 0.5) {
                    _cellPosition = Top;
                }
            }

            for (UIView *subview in self.subviews) {
                if ([[NSString stringWithFormat:@"%@", subview] containsString:@"_UITableViewCellSeparatorView"] && subview.frame.origin.x == 0 && subview.frame.origin.y > 0 && subview.frame.size.height == 0.5) {
                    if (_cellPosition == Top) {
                        _cellPosition = Lone;
                    } else {
                        _cellPosition = Bottom;
                    }
                }
            }

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability"
            if (_cellPosition == Top) {
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
            } else if (_cellPosition == Bottom) {
                self.layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
            } else if (_cellPosition == Middle) {
                self.layer.cornerRadius = 0;
                self.clipsToBounds = NO;
            }
#pragma clang diagnostic pop

            _frame.size.width -= 32;
            _frame.origin.x = 16;
            self.frame = _frame;
        }
    }
}
%end

%hook UITableViewHeaderFooterView
- (void)layoutSubviews {
    if ([[NSString stringWithFormat:@"%@", self._viewControllerForAncestor] containsString:@"PassDetailViewController"]) {
        if (self.frame.origin.x == 0) {
            CGRect _frame = self.frame;
            //if (_frame.size.width > 200) {
            _frame.size.width -= 10;
            //}
            _frame.origin.x += 5;
            self.frame = _frame;
        }
    }
    %orig;
}
%end

%end

%group Maps

@interface MapsProgressButton : UIView
@end

%hook MapsProgressButton
- (void)layoutSubviews {
    %orig;
    self.layer.continuousCorners = true;
}
%end

%end

%group Castro

@interface SUPTabsCardViewController : UIViewController
@end

%hook SUPTabsCardViewController
- (void)viewDidLoad {
    %orig;
    self.view.layer.mask = NULL;
    self.view.layer.continuousCorners = YES;
    self.view.layer.masksToBounds = YES;
    self.view.layer.cornerRadius = 10;
}
%end

@interface SUPDimExternalImageViewButton : UIView
- (void)setHighlighted:(bool)arg1;
@end

%hook SUPDimExternalImageViewButton
- (void)setHighlighted:(bool)arg1 {
    if (arg1 == YES) {

        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.1 curve:UIViewAnimationCurveEaseOut animations:^{
            %orig;
        }];
        [animator startAnimation];
    } else {
        UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.4 dampingRatio:1 animations:^{
            %orig;
        }];
        [animator startAnimation];
    }
    return;
}
%end

%end

%ctor {

    NSString *bundleIdentifier = [NSBundle mainBundle].bundleIdentifier;

    // Gather current preference keys.
    NSString *settingsPath = @"/var/mobile/Library/Preferences/com.duraidabdul.neptune.plist";

    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSMutableDictionary *currentSettings;

    BOOL shouldReadAndWriteDefaults = false;

    if ([fileManager fileExistsAtPath:settingsPath]){
        currentSettings = [[NSMutableDictionary alloc] initWithContentsOfFile:settingsPath];
        if ([[currentSettings objectForKey:@"preferencesVersionID"] intValue] != 100) {
          shouldReadAndWriteDefaults = true;
        }
    } else {
      shouldReadAndWriteDefaults = true;
    }

    if (shouldReadAndWriteDefaults) {
      NSBundle *bundle = [[NSBundle alloc] initWithPath:kBundlePath];
      NSString *defaultsPath = [bundle pathForResource:@"defaults" ofType:@"plist"];
      currentSettings = [[NSMutableDictionary alloc] initWithContentsOfFile:defaultsPath];

      [currentSettings writeToFile: settingsPath atomically:YES];
    }

    isFluidInterfaceEnabled = [[currentSettings objectForKey:@"isFluidInterfaceEnabled"] boolValue];
    isHomeIndicatorEnabled = [[currentSettings objectForKey:@"isHomeIndicatorEnabled"] boolValue];
    isButtonCombinationOverrideDisabled = [[currentSettings objectForKey:@"isButtonCombinationOverrideDisabled"] boolValue];
    isTallKeyboardEnabled = [[currentSettings objectForKey:@"isTallKeyboardEnabled"] boolValue];
    isPIPEnabled = [[currentSettings objectForKey:@"isPIPEnabled"] boolValue];
    statusBarStyle = [[currentSettings objectForKey:@"statusBarStyle"] intValue];
    isWalletEnabled = [[currentSettings objectForKey:@"isWalletEnabled"] boolValue];
    isNewsIconEnabled = [[currentSettings objectForKey:@"isNewsIconEnabled"] boolValue];
    prototypingEnabled = [[currentSettings objectForKey:@"prototypingEnabled"] boolValue];



    // Conditional status bar initialization
    NSArray *acceptedStatusBarIdentifiers = @[@"com.apple",
                                              @"com.culturedcode.ThingsiPhone",
                                              @"com.christianselig.Apollo",
                                              @"co.supertop.Castro-2",
                                              @"com.facebook.Messenger",
                                              @"com.saurik.Cydia",
                                              @"is.workflow.my.app"
                                              ];

    %init(StatusBarProvider);

    for (NSString *identifier in acceptedStatusBarIdentifiers) {
        if ((statusBarStyle == 0 && [bundleIdentifier containsString:identifier]) || statusBarStyle == 1) {
            %init(StatusBarModern);
        }
    }

    // Conditional inset adjustment initialization
    NSArray *acceptedInsetAdjustmentIdentifiers = @[@"com.apple",
                                                    @"com.culturedcode.ThingsiPhone",
                                                    @"com.christianselig.Apollo",
                                                    @"co.supertop.Castro-2",
                                                    @"com.chromanoir.Zeit",
                                                    @"com.chromanoir.spectre",
                                                    @"com.saurik.Cydia",
                                                    @"is.workflow.my.app"
                                                    ];
    NSArray *acceptedInsetAdjustmentIdentifiers_NoTabBarLabels = @[@"com.facebook.Facebook",
                                                                   @"com.facebook.Messenger",
                                                                   @"com.burbn.instagram",
                                                                   @"com.medium.reader",
                                                                   @"com.pcalc.mobile"
                                                                   ];

    BOOL isInsetAdjustmentEnabled = false;

    if (![bundleIdentifier containsString:@"mobilesafari"]) {
        for (NSString *identifier in acceptedInsetAdjustmentIdentifiers) {
            if ([bundleIdentifier containsString:identifier]) {
                isInsetAdjustmentEnabled = true;
                break;
            }
        }
        if (!isInsetAdjustmentEnabled) {
            for (NSString *identifier in acceptedInsetAdjustmentIdentifiers_NoTabBarLabels) {
                if ([bundleIdentifier containsString:identifier]) {
                    _bottomInset = 16;
                    isInsetAdjustmentEnabled = true;
                }
            }
        }
    }

    if (isHomeIndicatorEnabled && isFluidInterfaceEnabled) {
      if (isInsetAdjustmentEnabled) {
          %init(TabBarSizing);
          %init(ToolbarSizing);
      } else {
          %init(HideLuma);
      }
    } else {
      %init(CompletelyHideLuma);
    }

    // SpringBoard
    if ([bundleIdentifier isEqualToString:@"com.apple.springboard"]) {
        if (statusBarStyle != 0) {
            _statusBarHeightStyle = Regular;
            _controlCenterStatusBarInset = -24;
        }
        if (isFluidInterfaceEnabled) {
          %init(FluidInterface)
          %init(ButtonRemap)
        }

        %init(ControlCenter122UI)
        if (isFluidInterfaceEnabled) {
          %init(ControlCenterModificationsStatusBar)
        }
        %init(SBButtonRefinements)
    }

    // Wallet
    if ([bundleIdentifier containsString:@"Passbook"] && isWalletEnabled) {
        %init(Wallet122UI);
    }

    // Shortcuts
    if ([bundleIdentifier containsString:@"workflow"]) {
        %init(Shortcuts);
    }

    // Calendar
    if ([bundleIdentifier containsString:@"com.apple.mobilecal"]) {
        %init(Calendar);
    }

    // Maps
    if ([bundleIdentifier containsString:@"com.apple.Maps"]) {
        %init(Maps);
    }

    // Twitter
    if ([bundleIdentifier containsString:@"com.atebits.Tweetie2"] && prototypingEnabled) {
        %init(Twitter);
    }

    if ([bundleIdentifier containsString:@"supertop"]) {
        %init(Castro);
    }

    // Picture in picture
    if (isPIPEnabled) {
        %init(PIPOverride);
    }

    if (isNewsIconEnabled && [bundleIdentifier containsString:@"com.apple.springboard"]) {
        %init(NEPThemeEngine);
    }

    // Keyboard height adjustment
    if (isTallKeyboardEnabled) {
        %init(KeyboardDock);
    }

    // Any ungrouped hooks
    %init(_ungrouped);
}

```

#  Aspects Hook是什么?
Aspects是一个开源的的库,面向切面编程,它能允许你在每一个类和每一个实例中存在的方法里面加入任何代码。可以在方法执行之前或者之后执行,也可以替换掉原有的方法。通过Runtime消息转发实现Hook。Aspects会自动处理超类,比常规方法调用更容易使用,github上Star已经超过6000多,已经比较稳定了;

先从源码入手,最后再进行总结,如果对源码不感兴趣的可以直接跳到文章末尾去查看具体流程

二:Aspects是Hook前的准备工作
+ (id<AspectToken>)aspect_hookSelector:(SEL)selector
                      withOptions:(AspectOptions)options
                       usingBlock:(id)block
                            error:(NSError **)error {
    return aspect_add((id)self, selector, options, block, error);
}
- (id<AspectToken>)aspect_hookSelector:(SEL)selector
                      withOptions:(AspectOptions)options
                       usingBlock:(id)block
                            error:(NSError **)error {
    return aspect_add(self, selector, options, block, error);
}
通过上面的方法添加Hook,传入SEL(要Hook的方法), options(远方法调用调用之前或之后调用或者是替换),block(要执行的代码),error(错误信息)

static id aspect_add(id self, SEL selector, AspectOptions options, id block, NSError **error) {
    NSCParameterAssert(self);
    NSCParameterAssert(selector);
    NSCParameterAssert(block);

    __block AspectIdentifier *identifier = nil;
    aspect_performLocked(^{
        //先判断参数的合法性,如果不合法直接返回nil
        if (aspect_isSelectorAllowedAndTrack(self, selector, options, error)) {
            //参数合法
            //创建容器
            AspectsContainer *aspectContainer = aspect_getContainerForObject(self, selector);
            //创建一个AspectIdentifier对象(保存hook内容)
            identifier = [AspectIdentifier identifierWithSelector:selector object:self options:options block:block error:error];
            if (identifier) {
                //把identifier添加到容器中(根据options,添加到不同集合中)
                [aspectContainer addAspect:identifier withOptions:options];

                // Modify the class to allow message interception.
                aspect_prepareClassAndHookSelector(self, selector, error);
            }
        }
    });
    return identifier;
}
上面的方法主要是分为以下几步:

判断上面传入的方法的合法性
如果合法就创建AspectsContainer容器类,这个容器会根据传入的切片时机进行分类,添加到对应的集合中去
创建AspectIdentifier对象保存hook内容
如果AspectIdentifier对象创建成功,就把AspectIdentifier根据options添加到对应的数组中
最终调用aspect_prepareClassAndHookSelector(self, selector, error);开始进行hook
接下来就对上面的步骤一一解读

一:判断传入方法的合法性
/*
 判断参数的合法性:
 1.先将retain,release,autorelease,forwardInvocation添加到数组中,如果SEL是数组中的某一个,报错
并返回NO,这几个全是不能进行Swizzle的方法
 2.传入的时机是否正确,判断SEL是否是dealloc,如果是dealloc,选择的调用时机必须是AspectPositionBefore
 3.判断类或者类对象是否响应传入的sel
 4.如果替换的是类方法,则进行是否重复替换的检查
 */
static BOOL aspect_isSelectorAllowedAndTrack(NSObject *self, SEL selector, AspectOptions options, NSError **error) {
    static NSSet *disallowedSelectorList;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        disallowedSelectorList = [NSSet setWithObjects:@"retain", @"release", @"autorelease", @"forwardInvocation:", nil];
    });

    // Check against the blacklist.
    NSString *selectorName = NSStringFromSelector(selector);
    if ([disallowedSelectorList containsObject:selectorName]) {
        NSString *errorDescription = [NSString stringWithFormat:@"Selector %@ is blacklisted.", selectorName];
        AspectError(AspectErrorSelectorBlacklisted, errorDescription);
        return NO;
    }

    // Additional checks.
    AspectOptions position = options&AspectPositionFilter;
    //如果是dealloc必须是AspectPositionBefore,不然报错
    if ([selectorName isEqualToString:@"dealloc"] && position != AspectPositionBefore) {
        NSString *errorDesc = @"AspectPositionBefore is the only valid position when hooking dealloc.";
        AspectError(AspectErrorSelectorDeallocPosition, errorDesc);
        return NO;
    }
    //判断是否可以响应方法,respondsToSelector(判断对象是否响应某个方法),instancesRespondToSelector(判断类能否响应某个方法)
    if (![self respondsToSelector:selector] && ![self.class instancesRespondToSelector:selector]) {
        NSString *errorDesc = [NSString stringWithFormat:@"Unable to find selector -[%@ %@].", NSStringFromClass(self.class), selectorName];
        AspectError(AspectErrorDoesNotRespondToSelector, errorDesc);
        return NO;
    }

    // Search for the current class and the class hierarchy IF we are modifying a class object
    //判断是不是元类,
    if (class_isMetaClass(object_getClass(self))) {
        Class klass = [self class];
        //创建字典
        NSMutableDictionary *swizzledClassesDict = aspect_getSwizzledClassesDict();
        Class currentClass = [self class];
        do {
            AspectTracker *tracker = swizzledClassesDict[currentClass];
            if ([tracker.selectorNames containsObject:selectorName]) {

                // Find the topmost class for the log.
                if (tracker.parentEntry) {
                    AspectTracker *topmostEntry = tracker.parentEntry;
                    while (topmostEntry.parentEntry) {
                        topmostEntry = topmostEntry.parentEntry;
                    }
                    NSString *errorDescription = [NSString stringWithFormat:@"Error: %@ already hooked in %@. A method can only be hooked once per class hierarchy.", selectorName, NSStringFromClass(topmostEntry.trackedClass)];
                    AspectError(AspectErrorSelectorAlreadyHookedInClassHierarchy, errorDescription);
                    return NO;
                }else if (klass == currentClass) {
                    // Already modified and topmost!
                    return YES;
                }
            }
        }while ((currentClass = class_getSuperclass(currentClass)));

        // Add the selector as being modified.
//到此就表示传入的参数合法,并且没有被hook过,就可以把信息保存起来了
        currentClass = klass;
        AspectTracker *parentTracker = nil;
        do {
            AspectTracker *tracker = swizzledClassesDict[currentClass];
            if (!tracker) {
                tracker = [[AspectTracker alloc] initWithTrackedClass:currentClass parent:parentTracker];
                swizzledClassesDict[(id<NSCopying>)currentClass] = tracker;
            }
            [tracker.selectorNames addObject:selectorName];
            // All superclasses get marked as having a subclass that is modified.
            parentTracker = tracker;
        }while ((currentClass = class_getSuperclass(currentClass)));
    }

    return YES;
}
上面代码主要干了一下几件事:

把"retain", "release", "autorelease", "forwardInvocation:这几个加入集合中,判断集合中是否包含传入的selector,如果包含返回NO,这也说明Aspects不能对这几个函数进行hook操作;
判断selector是不是dealloc方法,如果是切面时机必须是AspectPositionBefore,要不然就会报错并返回NO,dealloc之后对象就销毁,所以切片时机只能是在原方法调用之前调用
判断类和实例对象是否可以响应传入的selector,不能就返回NO
判断是不是元类,如果是元类,判断方法有没有被hook过,如果没有就保存数据,一个方法在一个类的层级里面只能hook一次
2.创建AspectsContainer容器类
// Loads or creates the aspect container.
static AspectsContainer *aspect_getContainerForObject(NSObject *self, SEL selector) {
    NSCParameterAssert(self);
    //拼接字符串aspects__viewDidAppear:
    SEL aliasSelector = aspect_aliasForSelector(selector);
    //获取aspectContainer对象
    AspectsContainer *aspectContainer = objc_getAssociatedObject(self, aliasSelector);
    //如果上面没有获取到就创建
    if (!aspectContainer) {
        aspectContainer = [AspectsContainer new];
        objc_setAssociatedObject(self, aliasSelector, aspectContainer, OBJC_ASSOCIATION_RETAIN);
    }
    return aspectContainer;
}
获得其对应的AssociatedObject关联对象，如果获取不到，就创建一个关联对象。最终得到selector有"aspects_"前缀，对应的aspectContainer。

3.创建AspectIdentifier对象保存hook内容
+ (instancetype)identifierWithSelector:(SEL)selector object:(id)object options:(AspectOptions)options block:(id)block error:(NSError **)error {
    NSCParameterAssert(block);
    NSCParameterAssert(selector);
//    /把blcok转换成方法签名
    NSMethodSignature *blockSignature = aspect_blockMethodSignature(block, error); // TODO: check signature compatibility, etc.
    //aspect_isCompatibleBlockSignature 对比要替换方法的block和原方法,如果不一样,不继续进行
    //如果一样,把所有的参数赋值给AspectIdentifier对象
    if (!aspect_isCompatibleBlockSignature(blockSignature, object, selector, error)) {
        return nil;
    }

    AspectIdentifier *identifier = nil;
    
    if (blockSignature) {
        identifier = [AspectIdentifier new];
        identifier.selector = selector;
        identifier.block = block;
        identifier.blockSignature = blockSignature;
        identifier.options = options;
        identifier.object = object; // weak
    }
    return identifier;
}
/*
 1.把原方法转换成方法签名
 2.然后比较两个方法签名的参数数量,如果不相等,说明不一样
 3.如果参数个数相同,再比较blockSignature的第一个参数
 */
static BOOL aspect_isCompatibleBlockSignature(NSMethodSignature *blockSignature, id object, SEL selector, NSError **error) {
    NSCParameterAssert(blockSignature);
    NSCParameterAssert(object);
    NSCParameterAssert(selector);

    BOOL signaturesMatch = YES;
    //把原方法转化成方法签名
    NSMethodSignature *methodSignature = [[object class] instanceMethodSignatureForSelector:selector];
    //判断两个方法编号的参数数量
    if (blockSignature.numberOfArguments > methodSignature.numberOfArguments) {
        signaturesMatch = NO;
    }else {
        //取出blockSignature的第一个参数是不是_cmd,对应的type就是'@',如果不等于'@',也不匹配
        if (blockSignature.numberOfArguments > 1) {
            const char *blockType = [blockSignature getArgumentTypeAtIndex:1];
            if (blockType[0] != '@') {
                signaturesMatch = NO;
            }
        }
        // Argument 0 is self/block, argument 1 is SEL or id<AspectInfo>. We start comparing at argument 2.
        // The block can have less arguments than the method, that's ok.
        //如果signaturesMatch = yes,下面才是比较严格的比较
        if (signaturesMatch) {
            for (NSUInteger idx = 2; idx < blockSignature.numberOfArguments; idx++) {
                const char *methodType = [methodSignature getArgumentTypeAtIndex:idx];
                const char *blockType = [blockSignature getArgumentTypeAtIndex:idx];
                // Only compare parameter, not the optional type data.
                if (!methodType || !blockType || methodType[0] != blockType[0]) {
                    signaturesMatch = NO; break;
                }
            }
        }
    }
    //如果经过上面的对比signaturesMatch都为NO,抛出异常
    if (!signaturesMatch) {
        NSString *description = [NSString stringWithFormat:@"Blog signature %@ doesn't match %@.", blockSignature, methodSignature];
        AspectError(AspectErrorIncompatibleBlockSignature, description);
        return NO;
    }
    return YES;
}
//把blcok转换成方法签名
#pragma mark 把blcok转换成方法签名
static NSMethodSignature *aspect_blockMethodSignature(id block, NSError **error) {
    AspectBlockRef layout = (__bridge void *)block;
    //判断是否有AspectBlockFlagsHasSignature标志位,没有报不包含方法签名的error
    if (!(layout->flags & AspectBlockFlagsHasSignature)) {
        NSString *description = [NSString stringWithFormat:@"The block %@ doesn't contain a type signature.", block];
        AspectError(AspectErrorMissingBlockSignature, description);
        return nil;
    }
    void *desc = layout->descriptor;
    desc += 2 * sizeof(unsigned long int);
    if (layout->flags & AspectBlockFlagsHasCopyDisposeHelpers) {
        desc += 2 * sizeof(void *);
    }
    if (!desc) {
        NSString *description = [NSString stringWithFormat:@"The block %@ doesn't has a type signature.", block];
        AspectError(AspectErrorMissingBlockSignature, description);
        return nil;
    }
    const char *signature = (*(const char **)desc);
    return [NSMethodSignature signatureWithObjCTypes:signature];
}
这个方法先把block转换成方法签名,然后和原来的方法签名进行对比,如果不一样返回NO,一样就进行赋值操作

4.把AspectIdentifier根据options添加到对应的数组中
- (void)addAspect:(AspectIdentifier *)aspect withOptions:(AspectOptions)options {
    NSParameterAssert(aspect);
    NSUInteger position = options&AspectPositionFilter;
    switch (position) {
        case AspectPositionBefore:  self.beforeAspects  = [(self.beforeAspects ?:@[]) arrayByAddingObject:aspect]; break;
        case AspectPositionInstead: self.insteadAspects = [(self.insteadAspects?:@[]) arrayByAddingObject:aspect]; break;
        case AspectPositionAfter:   self.afterAspects   = [(self.afterAspects  ?:@[]) arrayByAddingObject:aspect]; break;
    }
}
根据传入的切面时机,进行对应数组的存储;

5.开始进行hook
aspect_prepareClassAndHookSelector(self, selector, error);
小节一下:Aspects在hook之前会对传入的参数的合法性进行校验,然后把传入的block(就是在原方法调用之前,之后调用,或者替换原方法的代码块)和原方法都转换成方法签名进行对比,如果一致就把所有信息保存到AspectIdentifier这个类里面(后期调用这个block的时候会用到这些信息),然后会根据传进来的切面时机保存到AspectsContainer这个类里对应的数组中(最后通过遍历,获取到其中的一个AspectIdentifier对象,调用invokeWithInfo方法),准备工作做完以后开始对类和方法进行Hook操作了

二:Aspects是怎么对类和方法进行Hook的?
先对class进行hook再对selector进行hook

1.Hook Class
static Class aspect_hookClass(NSObject *self, NSError **error) {
    NSCParameterAssert(self);
    //获取类
    Class statedClass = self.class;
    //获取类的isa指针
    Class baseClass = object_getClass(self);
    
    NSString *className = NSStringFromClass(baseClass);

    // Already subclassed
    //判断是否包含_Aspects_,如果包含,就说明被hook过了,
    //如果不包含_Aspects_,再判断是不是元类,如果是元类调用aspect_swizzleClassInPlace
    //如果不包含_Aspects_,也不是元类,再判断statedClass和baseClass是否相等,如果不相等,说明是被kvo过的对象因为kvo对象的isa指针指向了另一个中间类,调用aspect_swizzleClassInPlace
    
    if ([className hasSuffix:AspectsSubclassSuffix]) {
        return baseClass;

        // We swizzle a class object, not a single object.
    }else if (class_isMetaClass(baseClass)) {
        return aspect_swizzleClassInPlace((Class)self);
        // Probably a KVO'ed class. Swizzle in place. Also swizzle meta classes in place.
    }else if (statedClass != baseClass) {
        return aspect_swizzleClassInPlace(baseClass);
    }

    // Default case. Create dynamic subclass.
    //如果不是元类,也不是被kvo过的类,也没有被hook过,就继续往下执行,创建一个子类,
    //拼接类名为XXX_Aspects_
    const char *subclassName = [className stringByAppendingString:AspectsSubclassSuffix].UTF8String;
    //根据拼接的类名获取类
    Class subclass = objc_getClass(subclassName);
    //如果上面获取到的了为nil
    if (subclass == nil) {
        //baseClass = MainViewController,创建一个子类MainViewController_Aspects_
        subclass = objc_allocateClassPair(baseClass, subclassName, 0);
        //如果子类创建失败,报错
        if (subclass == nil) {
            NSString *errrorDesc = [NSString stringWithFormat:@"objc_allocateClassPair failed to allocate class %s.", subclassName];
            AspectError(AspectErrorFailedToAllocateClassPair, errrorDesc);
            return nil;
        }

        aspect_swizzleForwardInvocation(subclass);
        //把subclass的isa指向了statedClass
        aspect_hookedGetClass(subclass, statedClass);
        //subclass的元类的isa，也指向了statedClass。
        aspect_hookedGetClass(object_getClass(subclass), statedClass);
        //注册刚刚新建的子类subclass，再调用object_setClass(self, subclass);把当前self的isa指向子类subclass
        objc_registerClassPair(subclass);
    }

    object_setClass(self, subclass);
    return subclass;
}
判断className中是否包含_Aspects_,如果包含就说明这个类已经被Hook过了直接返回这个类的isa指针
如果不包含判断在判断是不是元类,如果是就调用aspect_swizzleClassInPlace()
如果不包含也不是元类,再判断baseClass和statedClass是否相等,如果不相等,说明是被KVO过的对象
如果不是元类也不是被kvo过的类就继续向下执行,创建一个子类,类名为原来类名+_Aspects_,创建成功调用aspect_swizzleForwardInvocation()交换IMP,把新建类的forwardInvocationIMP替换为__ASPECTS_ARE_BEING_CALLED__,然后把subClass的isa指针指向statedCass,subclass的元类的isa指针也指向statedClass,然后注册新创建的子类subClass,再调用object_setClass(self, subclass);把当前self的isa指针指向子类subClass
aspect_swizzleClassInPlace()
static Class aspect_swizzleClassInPlace(Class klass) {
    NSCParameterAssert(klass);
    NSString *className = NSStringFromClass(klass);
    //创建无序集合
    _aspect_modifySwizzledClasses(^(NSMutableSet *swizzledClasses) {
        //如果集合中不包含className,添加到集合中
        if (![swizzledClasses containsObject:className]) {
            aspect_swizzleForwardInvocation(klass);
            [swizzledClasses addObject:className];
        }
    });
    return klass;
}
这个函数主要是:通过调用aspect_swizzleForwardInvocation ()函数把类的forwardInvocationIMP替换为__ASPECTS_ARE_BEING_CALLED__,然后把类名添加到集合中(这个集合后期删除Hook的时候会用到的)

aspect_swizzleForwardInvocation(Class klass)
static void aspect_swizzleForwardInvocation(Class klass) {
    NSCParameterAssert(klass);
    // If there is no method, replace will act like class_addMethod.
    //把forwardInvocation的IMP替换成__ASPECTS_ARE_BEING_CALLED__
    //class_replaceMethod返回的是原方法的IMP
    IMP originalImplementation = class_replaceMethod(klass, @selector(forwardInvocation:), (IMP)__ASPECTS_ARE_BEING_CALLED__, "v@:@");
   // originalImplementation不为空的话说明原方法有实现，添加一个新方法__aspects_forwardInvocation:指向了原来的originalImplementation，在__ASPECTS_ARE_BEING_CALLED__那里如果不能处理，判断是否有实现__aspects_forwardInvocation，有的话就转发。
 
    if (originalImplementation) {
        class_addMethod(klass, NSSelectorFromString(AspectsForwardInvocationSelectorName), originalImplementation, "v@:@");
    }
    AspectLog(@"Aspects: %@ is now aspect aware.", NSStringFromClass(klass));
}
交换方法实现IMP,把forwardInvocation:的IMP替换成__ASPECTS_ARE_BEING_CALLED__,这样做的目的是:在把selector进行hook以后会把原来的方法的IMP指向objc_forward,然后就会调用forwardInvocation :,因为forwardInvocation :的IMP指向的是__ASPECTS_ARE_BEING_CALLED__函数,最终就会调用到这里来,在这里面执行hook代码和原方法,如果原来的类有实现forwardInvocation :这个方法,就把这个方法的IMP指向__aspects_forwardInvocation:

aspect_hookedGetClass
static void aspect_hookedGetClass(Class class, Class statedClass) {
    NSCParameterAssert(class);
    NSCParameterAssert(statedClass);
    Method method = class_getInstanceMethod(class, @selector(class));
    IMP newIMP = imp_implementationWithBlock(^(id self) {
        return statedClass;
    });
    class_replaceMethod(class, @selector(class), newIMP, method_getTypeEncoding(method));
}
根据传递的参数,把新创建的类和该类的元类的class方法的IMP指向原来的类(以后新建的类再调用class方法,返回的都是statedClass)

object_setClass(self, subclass);
把原来类的isa指针指向新创建的类

接下来再说说是怎么对method进行hook的

static void aspect_prepareClassAndHookSelector(NSObject *self, SEL selector, NSError **error) {
    NSCParameterAssert(selector);
    Class klass = aspect_hookClass(self, error);
    Method targetMethod = class_getInstanceMethod(klass, selector);
    IMP targetMethodIMP = method_getImplementation(targetMethod);
    if (!aspect_isMsgForwardIMP(targetMethodIMP)) {
        // Make a method alias for the existing method implementation, it not already copied.
        const char *typeEncoding = method_getTypeEncoding(targetMethod);
        SEL aliasSelector = aspect_aliasForSelector(selector);
        //子类里面不能响应aspects_xxxx，就为klass添加aspects_xxxx方法，方法的实现为原生方法的实现
        if (![klass instancesRespondToSelector:aliasSelector]) {
            __unused BOOL addedAlias = class_addMethod(klass, aliasSelector, method_getImplementation(targetMethod), typeEncoding);
            NSCAssert(addedAlias, @"Original implementation for %@ is already copied to %@ on %@", NSStringFromSelector(selector), NSStringFromSelector(aliasSelector), klass);
        }

        // We use forwardInvocation to hook in.
        class_replaceMethod(klass, selector, aspect_getMsgForwardIMP(self, selector), typeEncoding);
        AspectLog(@"Aspects: Installed hook for -[%@ %@].", klass, NSStringFromSelector(selector));
    }
}
上面的代码主要是对selector进行hook,首先获取到原来的方法,然后判断判断是不是指向了_objc_msgForward,没有的话,就获取原来方法的方法编码,为新建的子类添加一个方法aspects__xxxxx,并将新建方法的IMP指向原来方法,再把原来类的方法的IMP指向_objc_msgForward,hook完毕

三:ASPECTS_ARE_BEING_CALLED
static void __ASPECTS_ARE_BEING_CALLED__(__unsafe_unretained NSObject *self, SEL selector, NSInvocation *invocation) {
    NSCParameterAssert(self);
    NSCParameterAssert(invocation);
    //获取原始的selector
    SEL originalSelector = invocation.selector;
    //获取带有aspects_xxxx前缀的方法
    SEL aliasSelector = aspect_aliasForSelector(invocation.selector);
    //替换selector
    invocation.selector = aliasSelector;
    //获取实例对象的容器objectContainer，这里是之前aspect_add关联过的对象
    AspectsContainer *objectContainer = objc_getAssociatedObject(self, aliasSelector);
    //获取获得类对象容器classContainer
    AspectsContainer *classContainer = aspect_getContainerForClass(object_getClass(self), aliasSelector);
    //初始化AspectInfo，传入self、invocation参数
    AspectInfo *info = [[AspectInfo alloc] initWithInstance:self invocation:invocation];
    NSArray *aspectsToRemove = nil;

    // Before hooks.
    //调用宏定义执行Aspects切片功能
    //宏定义里面就做了两件事情，一个是执行了[aspect invokeWithInfo:info]方法，一个是把需要remove的Aspects加入等待被移除的数组中。
    aspect_invoke(classContainer.beforeAspects, info);
    aspect_invoke(objectContainer.beforeAspects, info);

    // Instead hooks.
    BOOL respondsToAlias = YES;
    if (objectContainer.insteadAspects.count || classContainer.insteadAspects.count) {
        aspect_invoke(classContainer.insteadAspects, info);
        aspect_invoke(objectContainer.insteadAspects, info);
    }else {
        Class klass = object_getClass(invocation.target);
        do {
            if ((respondsToAlias = [klass instancesRespondToSelector:aliasSelector])) {
                [invocation invoke];
                break;
            }
        }while (!respondsToAlias && (klass = class_getSuperclass(klass)));
    }

    // After hooks.
    aspect_invoke(classContainer.afterAspects, info);
    aspect_invoke(objectContainer.afterAspects, info);

    // If no hooks are installed, call original implementation (usually to throw an exception)
    if (!respondsToAlias) {
        invocation.selector = originalSelector;
        SEL originalForwardInvocationSEL = NSSelectorFromString(AspectsForwardInvocationSelectorName);
        if ([self respondsToSelector:originalForwardInvocationSEL]) {
            ((void( *)(id, SEL, NSInvocation *))objc_msgSend)(self, originalForwardInvocationSEL, invocation);
        }else {
            [self doesNotRecognizeSelector:invocation.selector];
        }
    }

    // Remove any hooks that are queued for deregistration.
    [aspectsToRemove makeObjectsPerformSelector:@selector(remove)];
}
#define aspect_invoke(aspects, info) \
for (AspectIdentifier *aspect in aspects) {\
    [aspect invokeWithInfo:info];\
    if (aspect.options & AspectOptionAutomaticRemoval) { \
        aspectsToRemove = [aspectsToRemove?:@[] arrayByAddingObject:aspect]; \
    } \
}
- (BOOL)invokeWithInfo:(id<AspectInfo>)info {
    NSInvocation *blockInvocation = [NSInvocation invocationWithMethodSignature:self.blockSignature];
    NSInvocation *originalInvocation = info.originalInvocation;
    NSUInteger numberOfArguments = self.blockSignature.numberOfArguments;

    // Be extra paranoid. We already check that on hook registration.
    if (numberOfArguments > originalInvocation.methodSignature.numberOfArguments) {
        AspectLogError(@"Block has too many arguments. Not calling %@", info);
        return NO;
    }

    // The `self` of the block will be the AspectInfo. Optional.
    if (numberOfArguments > 1) {
        [blockInvocation setArgument:&info atIndex:1];
    }
    
    void *argBuf = NULL;
    //把originalInvocation中的参数
    for (NSUInteger idx = 2; idx < numberOfArguments; idx++) {
        const char *type = [originalInvocation.methodSignature getArgumentTypeAtIndex:idx];
        NSUInteger argSize;
        NSGetSizeAndAlignment(type, &argSize, NULL);
        
        if (!(argBuf = reallocf(argBuf, argSize))) {
            AspectLogError(@"Failed to allocate memory for block invocation.");
            return NO;
        }
        
        [originalInvocation getArgument:argBuf atIndex:idx];
        [blockInvocation setArgument:argBuf atIndex:idx];
    }
    
    [blockInvocation invokeWithTarget:self.block];
    
    if (argBuf != NULL) {
        free(argBuf);
    }
    return YES;
}
获取数据传递到aspect_invoke里面,调用invokeWithInfo,执行切面代码块,执行完代码块以后,获取到新创建的类,判断是否可以响应aspects__xxxx方法,现在aspects__xxxx方法指向的是原来方法实现的IMP,如果可以响应,就通过[invocation invoke];调用这个方法,如果不能响应就调用__aspects_forwardInvocation:这个方法,这个方法在hookClass的时候提到了,它的IMP指针指向了原来类中的forwardInvocation:实现,可以响应就去执行,不能响应就抛出异常doesNotRecognizeSelector;
整个流程差不多就这些,最后还有一个移除的操作

四:移除Aspects
- (BOOL)remove {
    return aspect_remove(self, NULL);
}
static BOOL aspect_remove(AspectIdentifier *aspect, NSError **error) {
    NSCAssert([aspect isKindOfClass:AspectIdentifier.class], @"Must have correct type.");

    __block BOOL success = NO;
    aspect_performLocked(^{
        id self = aspect.object; // strongify
        if (self) {
            AspectsContainer *aspectContainer = aspect_getContainerForObject(self, aspect.selector);
            success = [aspectContainer removeAspect:aspect];

            aspect_cleanupHookedClassAndSelector(self, aspect.selector);
            // destroy token
            aspect.object = nil;
            aspect.block = nil;
            aspect.selector = NULL;
        }else {
            NSString *errrorDesc = [NSString stringWithFormat:@"Unable to deregister hook. Object already deallocated: %@", aspect];
            AspectError(AspectErrorRemoveObjectAlreadyDeallocated, errrorDesc);
        }
    });
    return success;
}
调用remove方法,然后清空AspectsContainer里面的数据,调用aspect_cleanupHookedClassAndSelector清除更多的数据

// Will undo the runtime changes made.
static void aspect_cleanupHookedClassAndSelector(NSObject *self, SEL selector) {
    NSCParameterAssert(self);
    NSCParameterAssert(selector);

    Class klass = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(klass);
    if (isMetaClass) {
        klass = (Class)self;
    }

    // Check if the method is marked as forwarded and undo that.
    Method targetMethod = class_getInstanceMethod(klass, selector);
    IMP targetMethodIMP = method_getImplementation(targetMethod);
    //判断selector是不是指向了_objc_msgForward
    if (aspect_isMsgForwardIMP(targetMethodIMP)) {
        // Restore the original method implementation.
        //获取到方法编码
        const char *typeEncoding = method_getTypeEncoding(targetMethod);
        //拼接selector
        SEL aliasSelector = aspect_aliasForSelector(selector);
        Method originalMethod = class_getInstanceMethod(klass, aliasSelector);
        //获取新添加类中aspects__xxxx方法的IMP
        IMP originalIMP = method_getImplementation(originalMethod);
        NSCAssert(originalMethod, @"Original implementation for %@ not found %@ on %@", NSStringFromSelector(selector), NSStringFromSelector(aliasSelector), klass);
        //把aspects__xxxx方法的IMP指回元类类的方法
        class_replaceMethod(klass, selector, originalIMP, typeEncoding);
        AspectLog(@"Aspects: Removed hook for -[%@ %@].", klass, NSStringFromSelector(selector));
    }

    // Deregister global tracked selector
    aspect_deregisterTrackedSelector(self, selector);

    // Get the aspect container and check if there are any hooks remaining. Clean up if there are not.
    AspectsContainer *container = aspect_getContainerForObject(self, selector);
    if (!container.hasAspects) {
        // Destroy the container
        aspect_destroyContainerForObject(self, selector);

        // Figure out how the class was modified to undo the changes.
        NSString *className = NSStringFromClass(klass);
        if ([className hasSuffix:AspectsSubclassSuffix]) {
            Class originalClass = NSClassFromString([className stringByReplacingOccurrencesOfString:AspectsSubclassSuffix withString:@""]);
            NSCAssert(originalClass != nil, @"Original class must exist");
            object_setClass(self, originalClass);
            AspectLog(@"Aspects: %@ has been restored.", NSStringFromClass(originalClass));

            // We can only dispose the class pair if we can ensure that no instances exist using our subclass.
            // Since we don't globally track this, we can't ensure this - but there's also not much overhead in keeping it around.
            //objc_disposeClassPair(object.class);
        }else {
            // Class is most likely swizzled in place. Undo that.
            if (isMetaClass) {
                aspect_undoSwizzleClassInPlace((Class)self);
            }
        }
    }
}
上述代码主要做以下几件事:

1. 获取原来类的方法的IMP是不是指向了_objc_msgForward,如果是就把该方法的IMP再指回去
2. 如果是元类就删除swizzledClasses里面的数据
3. 把新建类的isa指针指向原来类, 其实就是把hook的时候做的处理,又还原了

# 搭建个人博客
## 什么是Hexo？
Hexo 是一个快速、简洁且高效的博客框架。Hexo 使用 Markdown（或其他渲染引擎）解析文章，在几秒内，即可利用靓丽的主题生成静态网页。

官方文档：https://hexo.io/zh-cn/docs/
1.安装Hexo
安装 Hexo 相当简单。然而在安装前，您必须检查电脑中是否已安装下列应用程序：

Node.js
Git
如果您的电脑中已经安装上述必备程序，那么恭喜您！接下来只需要使用 npm 即可完成 Hexo 的安装。
终端输入：(一定要加上sudo，否则会因为权限问题报错)
```
$ sudo npm install -g hexo-cli
```
终端输入：查看安装的版本，检查是否已安装成功！
```
$ hexo -v  // 显示 Hexo 版本
```
2.建站
安装 Hexo 完成后，请执行下列命令，Hexo 将会在指定文件夹中新建所需要的文件。
```
// 新建空文件夹
$ cd /Users/renbo/Workspaces/BlogProject
// 初始化
$ hexo init 
$ npm install
```
新建完成后，指定文件夹的目录如下：

目录结构图

_config.yml：网站的 配置 信息，您可以在此配置大部分的参数。
scaffolds：模版 文件夹。当您新建文章（即新建markdown文件）时，Hexo 会根据 scaffold 来建立文件。
source：资源文件夹是存放用户资源（即markdown文件）的地方。
themes：主题 文件夹。Hexo 会根据主题来生成静态页面。

3.新建博客文章
新建一篇文章（即新建markdown文件）指令：
```
$ hexo new "文章标题"
```
4.生成静态文件
将文章markdown文件按指定格式生成静态网页文件
```
$ hexo g  // g 表示 generate ，是简写
```
5.部署网站
即将生成的网页文件上传到网站服务器（这里是上传到Github）。

上传之前可以先启动本地服务器（指令：hexo s ），在本地预览生成的网站。

默认本地预览网址：http://localhost:4000/
```
$ hexo s  // s 表示 server，是简写
```
部署网站指令：
```
$ hexo d  // d 表示 deploy，是简写
```
注意，如果报错： ERROR Deployer not found: git

需要我们再安装一个插件：
```
$ sudo npm install hexo-deployer-git --save
```
安装完插件之后再执行一下【hexo d】,它就会开始将public文件夹下的文件全部上传到你的gitHub仓库中。

6.清除文件
清除缓存文件 (db.json) 和已生成的静态文件 (public目录下的所有文件)。

清除指令：（一般是更改不生效时使用）
```
$ hexo clean
```
# deb包的解压,修改,重新打包方法

```
用dpkg命令制作deb包方法总结
如何制作Deb包和相应的软件仓库，其实这个很简单。这里推荐使用dpkg来进行deb包的创建、编辑和制作。

首先了解一下deb包的文件结构:

deb 软件包里面的结构：它具有DEBIAN和软件具体安装目录（如etc, usr, opt, tmp等）。在DEBIAN目录中起码具有control文件，其次还可能具有postinst(postinstallation)、postrm(postremove)、preinst(preinstallation)、prerm(preremove)、copyright (版权）、changlog （修订记录）和conffiles等。

control: 这个文件主要描述软件包的名称（Package），版本（Version）以及描述（Description）等，是deb包必须具备的描述性文件，以便于软件的安装管理和索引。同时为了能将软件包进行充分的管理，可能还具有以下字段:

Section: 这个字段申明软件的类别，常见的有`utils’, `net’, `mail’, `text’, `x11′ 等；

Priority: 这个字段申明软件对于系统的重要程度，如`required’, `standard’, `optional’, `extra’ 等；

Essential: 这个字段申明是否是系统最基本的软件包（选项为yes/no），如果是的话，这就表明该软件是维持系统稳定和正常运行的软件包，不允许任何形式的卸载（除非进行强制性的卸载）

Architecture:申明软件包结构，如基于`i386′, ‘amd64’,`m68k’, `sparc’, `alpha’, `powerpc’ 等；

Source: 软件包的源代码名称；

Depends: 软件所依赖的其他软件包和库文件。如果是依赖多个软件包和库文件，彼此之间采用逗号隔开；

Pre-Depends: 软件安装前必须安装、配置依赖性的软件包和库文件，它常常用于必须的预运行脚本需求；

Recommends: 这个字段表明推荐的安装的其他软件包和库文件；

Suggests: 建议安装的其他软件包和库文件。


对于control，这里有一个完整的例子:

Package: bioinfoserv-arb
Version: 2007_14_08
Section: BioInfoServ
Priority: optional
Depends: bioinfoserv-base-directories (>= 1.0-1), xviewg (>= 3.2p1.4), xfig (>= 1:3), libstdc++2.10-glibc2.2
Suggests: fig2ps
Architecture: i386
Installed-Size: 26104
Maintainer: Mingwei Liu <>
Provides: bioinfoserv-arb
Description: The ARB software is a graphically oriented package comprising various tools for sequence database handling and data analysis.
If you want to print your graphs you probably need to install the suggested fig2ps package.preinst: 这个文件是软件安装前所要进行的工作，工作执行会依据其中脚本进行；
postinst这个文件包含了软件在进行正常目录文件拷贝到系统后，所需要执行的配置工作。
prerm :软件卸载前需要执行的脚本
postrm: 软件卸载后需要执行的脚本现在来看看如何修订一个已有的deb包软件

=================================================================
debian制作DEB包(在root权限下），打包位置随意。
#建立要打包软件文件夹，如
mkdir Cydia
cd   Cydia

#依据程序的安装路径建立文件夹,并将相应程序添加到文件夹。如
mkdir Applications
mkdir var/mobile/Documents (游戏类需要这个目录，其他也有可能需要）
mkdir *** (要依据程序要求来添加）

#建立DEBIAN文件夹
mkdir DEBIAN


#在DEBIAN目录下创建一个control文件,并加入相关内容。
touch DEBIAN/control（也可以直接使用vi DEBIAN/control编辑保存）
#编辑control
vi DEBIAN/control

#相关内容（注意结尾必须空一行）：
Package: soft （程序名称）
Version: 1.0.1 （版本）
Section: utils （程序类别）
Architecture: iphoneos-arm   （程序格式）
Installed-Size: 512   （大小）
Maintainer: your <your_email@gmail.com>   （打包人和联系方式）
Description: soft package （程序说明)
                                       （此处必须空一行再结束）
注：此文件也可以先在电脑上编辑（使用文本编辑就可以，完成后去掉.txt),再传到打包目录里。

#在DEBIAN里还可以根据需要设置脚本文件
preinst
在Deb包文件解包之前，将会运行该脚本。许多“preinst”脚本的任务是停止作用于待升级软件包的服务，直到软件包安装或升级完成。

postinst
该脚本的主要任务是完成安装包时的配置工作。许多“postinst”脚本负责执行有关命令为新安装或升级的软件重启服务。

prerm
该脚本负责停止与软件包相关联的daemon服务。它在删除软件包关联文件之前执行。

postrm
该脚本负责修改软件包链接或文件关联，或删除由它创建的文件。

#postinst 如：
#!/bin/sh
if [ "$1" = "configure" ]; then
/Applications/MobileLog.app/MobileLog -install
/bin/launchctl load -wF /System/Library/LaunchDaemons/com.iXtension.MobileLogDaemon.plist 
fi

#prerm 如：
#!/bin/sh
if [[ $1 == remove ]]; then
/Applications/MobileLog.app/MobileLog -uninstall
/bin/launchctl unload -wF /System/Library/LaunchDaemons/com.iXtension.MobileLogDaemon.plist 
fi

#如果DEBIAN目录中含有postinst 、prerm等执行文件
chmod -R 755 DEBIAN

#退出打包软件文件夹，生成DEB
dpkg-deb --build Cydia
=====================================================================
有时候安装自己打包的deb包时报如下错误：
Selecting previously deselected package initrd-deb.
(Reading database ... 71153 files and directories currently installed.)
Unpacking initrd-deb (from initrd-vstools_1.0_amd64.deb) ...
dpkg: error processing initrd-vstools_1.0_amd64.deb (--install):
trying to overwrite `/boot/initrd-vstools.img', which is also in package initrd-deb-2
dpkg-deb: subprocess paste killed by signal (Broken pipe)
Errors were encountered while processing:
initrd-vstools_1.0_amd64.deb
主要意思是说，已经有一个deb已经安装了相同的文件，所以默认退出安装，只要把原来安装的文件给卸载掉，再次进行安装就可以了。

下面为实践内容：

所有的目录以及文件：

mydeb

|----DEBIAN

       |-------control
               |-------postinst

       |-------postrm

|----boot

       |----- initrd-vstools.img

在任意目录下创建如上所示的目录以及文件
# mkdir   -p /root/mydeb                          # 在该目录下存放生成deb包的文件以及目录
# mkdir -p /root/mydeb/DEBIAN           #目录名必须大写
# mkdir -p /root/mydeb/boot                   # 将文件安装到/boot目录下
# touch /root/mydeb/DEBIAN/control    # 必须要有该文件
# touch /root/mydeb/DEBIAN/postinst # 软件安装完后，执行该Shell脚本
# touch /root/mydeb/DEBIAN/postrm    # 软件卸载后，执行该Shell脚本
# touch /root/mydeb/boot/initrd-vstools.img    # 所谓的“软件”程序，这里就只是一个空文件


control文件内容：
Package: my-deb   （软件名称，中间不能有空格）
Version: 1                  (软件版本)
Section: utils            （软件类别）
Priority: optional        （软件对于系统的重要程度）
Architecture: amd64   （软件所支持的平台架构）
Maintainer: xxxxxx <> （打包人和联系方式）
Description: my first deb （对软件所的描述）

postinst文件内容（ 软件安装完后，执行该Shell脚本，一般用来配置软件执行环境，必须以“#!/bin/sh”为首行，然后给该脚本赋予可执行权限：chmod +x postinst）：
#!/bin/sh
echo "my deb" > /root/mydeb.log

postrm文件内容（ 软件卸载后，执行该Shell脚本，一般作为清理收尾工作，必须以“#!/bin/sh”为首行，然后给该脚本赋予可执行权限：chmod +x postrm）：
#!/bin/sh
rm -rf /root/mydeb.log

给mydeb目录打包：
# dpkg -b   mydeb   mydeb-1.deb      # 第一个参数为将要打包的目录名，
                                                            # 第二个参数为生成包的名称。

安装deb包：
# dpkg -i   mydeb-1.deb      # 将initrd-vstools.img复制到/boot目录下后，执行postinst，
                                            # postinst脚本在/root目录下生成一个含有"my deb"字符的mydeb.log文件

卸载deb包：
# dpkg -r   my-deb      # 这里要卸载的包名为control文件Package字段所定义的 my-deb 。
                                    # 将/boot目录下initrd-vstools.img删除后，执行posrm，
                                    # postrm脚本将/root目录下的mydeb.log文件删除

查看deb包是否安装：
# dpkg -s   my-deb      # 这里要卸载的包名为control文件Package字段所定义的 my-deb

查看deb包文件内容：
# dpkg   -c   mydeb-1.deb

查看当前目录某个deb包的信息：
# dpkg --info mydeb-1.deb

解压deb包中所要安装的文件
# dpkg -x   mydeb-1.deb   mydeb-1    # 第一个参数为所要解压的deb包，这里为 mydeb-1.deb
                                                             # 第二个参数为将deb包解压到指定的目录，这里为 mydeb-1

解压deb包中DEBIAN目录下的文件（至少包含control文件）
# dpkg -e   mydeb-1.deb   mydeb-1/DEBIAN    # 第一个参数为所要解压的deb包，
                                                                           # 这里为 mydeb-1.deb
                                                                          # 第二个参数为将deb包解压到指定的目录，
                                                                           # 这里为 mydeb-1/DEBIAN
                                                                        
```
## mac上 使用dpkg命令

## 1: 先 安装 Macports
```
https://www.macports.org/install.php
```

## 2: 安装 dpkg

```
sudo port -f install dpkg
```

```
1、准备工作：
    mkdir -p extract/DEBIAN
    mkdir build

2、解包命令为：
    #解压出包中的文件到extract目录下
    dpkg -X ../openssh-xxx.deb extract/
    #解压出包的控制信息extract/DEBIAN/下：
    dpkg -e ../openssh-xxx.deb extract/DEBIAN/
3、修改文件:
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' extract/etc/ssh/sshd_config
4、对修改后的内容重新进行打包生成deb包
    dpkg-deb -b extract/ build/
```

# fishhook

### 相关资料
[fishhook源码分析](http://turingh.github.io/2016/03/22/fishhook%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%90/)

[mach-o格式介绍](http://turingh.github.io/2016/03/07/mach-o%E6%96%87%E4%BB%B6%E6%A0%BC%E5%BC%8F%E5%88%86%E6%9E%90/)

[mach-o延时绑定](http://turingh.github.io/2016/03/10/Mach-O%E7%9A%84%E5%8A%A8%E6%80%81%E9%93%BE%E6%8E%A5/)

以下是官方内容
===
__fishhook__ is a very simple library that enables dynamically rebinding symbols in Mach-O binaries running on iOS in the simulator and on device. This provides functionality that is similar to using [`DYLD_INTERPOSE`][interpose] on OS X. At Facebook, we've found it useful as a way to hook calls in libSystem for debugging/tracing purposes (for example, auditing for double-close issues with file descriptors).

[interpose]: http://opensource.apple.com/source/dyld/dyld-210.2.3/include/mach-o/dyld-interposing.h    "<mach-o/dyld-interposing.h>"

## Usage

Once you add `fishhook.h`/`fishhook.c` to your project, you can rebind symbols as follows:
```Objective-C
#import <dlfcn.h>

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "fishhook.h"

static int (*orig_close)(int);
static int (*orig_open)(const char *, int, ...);

int my_close(int fd) {
  printf("Calling real close(%d)\n", fd);
  return orig_close(fd);
}

int my_open(const char *path, int oflag, ...) {
  va_list ap = {0};
  mode_t mode = 0;

  if ((oflag & O_CREAT) != 0) {
    // mode only applies to O_CREAT
    va_start(ap, oflag);
    mode = va_arg(ap, int);
    va_end(ap);
    printf("Calling real open('%s', %d, %d)\n", path, oflag, mode);
    return orig_open(path, oflag, mode);
  } else {
    printf("Calling real open('%s', %d)\n", path, oflag);
    return orig_open(path, oflag, mode);
  }
}

int main(int argc, char * argv[])
{
  @autoreleasepool {
    rebind_symbols((struct rebinding[2]){{"close", my_close, (void *)&orig_close}, {"open", my_open, (void *)&orig_open}}, 2);

    // Open our own binary and print out first 4 bytes (which is the same
    // for all Mach-O binaries on a given architecture)
    int fd = open(argv[0], O_RDONLY);
    uint32_t magic_number = 0;
    read(fd, &magic_number, 4);
    printf("Mach-O Magic Number: %x \n", magic_number);
    close(fd);

    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
  }
}
```
### Sample output
```
Calling real open('/var/mobile/Applications/161DA598-5B83-41F5-8A44-675491AF6A2C/Test.app/Test', 0)
Mach-O Magic Number: feedface 
Calling real close(3)
...
```

## How it works

`dyld` binds lazy and non-lazy symbols by updating pointers in particular sections of the `__DATA` segment of a Mach-O binary. __fishhook__ re-binds these symbols by determining the locations to update for each of the symbol names passed to `rebind_symbols` and then writing out the corresponding replacements.

For a given image, the `__DATA` segment may contain two sections that are relevant for dynamic symbol bindings: `__nl_symbol_ptr` and `__la_symbol_ptr`. `__nl_symbol_ptr` is an array of pointers to non-lazily bound data (these are bound at the time a library is loaded) and `__la_symbol_ptr` is an array of pointers to imported functions that is generally filled by a routine called `dyld_stub_binder` during the first call to that symbol (it's also possible to tell `dyld` to bind these at launch). In order to find the name of the symbol that corresponds to a particular location in one of these sections, we have to jump through several layers of indirection. For the two relevant sections, the section headers (`struct section`s from `<mach-o/loader.h>`) provide an offset (in the `reserved1` field) into what is known as the indirect symbol table. The indirect symbol table, which is located in the `__LINKEDIT` segment of the binary, is just an array of indexes into the symbol table (also in `__LINKEDIT`) whose order is identical to that of the pointers in the non-lazy and lazy symbol sections. So, given `struct section nl_symbol_ptr`, the corresponding index in the symbol table of the first address in that section is `indirect_symbol_table[nl_symbol_ptr->reserved1]`. The symbol table itself is an array of `struct nlist`s (see `<mach-o/nlist.h>`), and each `nlist` contains an index into the string table in `__LINKEDIT` which where the actual symbol names are stored. So, for each pointer `__nl_symbol_ptr` and `__la_symbol_ptr`, we are able to find the corresponding symbol and then the corresponding string to compare against the requested symbol names, and if there is a match, we replace the pointer in the section with the replacement.

The process of looking up the name of a given entry in the lazy or non-lazy pointer tables looks like this:
![Visual explanation](http://i.imgur.com/HVXqHCz.png)



# MachOView

源码地址：https://github.com/gdbinit/MachOView

Mach-O格式全称为Mach Object文件格式的缩写，是mac上可执行文件的格式，类似于windows上的PE格式 (Portable Executable ), linux上的elf格式 (Executable and Linking Format)。

mach-o文件类型分为：
```
1、Executable：应用的主要二进制

2、Dylib Library：动态链接库（又称DSO或DLL）

3、Static Library：静态链接库

4、Bundle：不能被链接的Dylib，只能在运行时使用dlopen( )加载，可当做macOS的插件

5、Relocatable Object File ：可重定向文件类型
```
## 那什么又是FatFile/FatBinary？

简单来说，就是一个由不同的编译架构后的Mach-O产物所合成的集合体。一个架构的mach-O只能在相同架构的机器或者模拟器上用，为了支持不同架构需要一个集合体。

一、使用方式
1、MachOView工具概述

MachOView工具可Mac平台中可查看MachO文件格式信息，IOS系统中可执行程序属于Mach-O文件格式，有必要介绍如何利用工具快速查看Mach-O文件格式。

点击“MachOView”之后，便在Mac系统左上角出现MachOView工具的操作菜单

将“MachOView”拖到Application文件夹，就可以像其他程序一样启动了

下面介绍MachOView文件功能使用。

2、加载Mach-O文件
点击MachOView工具的主菜单“File”中的“Open”选项便可加载IOS平台可执行文件，对应功能接入如下所示：

例如加载文件名为“libLDCPCircle.a”的静态库文件，

3、文件头信息
MachOView工具成功加载Mach-O文件之后，每个.o文件对应一个类编译后的文件

在左边窗口点击“Mach Header”选项，可以看到每个类的cpu架构信息、load commands数量 、load commandssize 、file type等信息。

4、查看Fat文件
我们打开一个Fat文件可以看到：

可以看到，fat文件只是对各种架构文件的组装，点开 “Fat Header”可以看到支持的架构，显示的支持ARM_V7  、ARM_V7S  、ARM_64 、i386 、 X86_64。


点开每一个Static Library 可以看到，和每一个单独的Static Library的信息一样。

命令：
```
lipo LoginSDK.a -thin armv7 -output arm/LoginSDK.a  将fat文件拆分得到armv7类型

lipo  -create    ibSyncSDKA.i386.a    libSyncSDK.arm7.a  -output  libSyncSDK.a  合成一个i386和armV7架构的fat文件
```

## OpenSSH


这个工具是通过命令行工具访问苹果手机，执行命令行脚本。在Cydia中搜索openssh，安装。具体用法如下：
1、打开mac下的terminal，输入命令ssh root@192.168.2.2（越狱设备ip地址）
2、接下来会提示输入超级管理员账号密码，默认是alpine
3、回车确认，即可root登录设备
你也可以将你mac的公钥导入设备的/var/root/.ssh/authorized_keys文件，这样就可以免密登录root了。

![Reverse](https://github.com/XLsn0w/Cydia/blob/master/iOS%20Reverse.png?raw=true)

## Cycript


Cycript是大神saurik开发的一个非常强大的工具，可以让开发者在命令行下和应用交互，在运行时查看和修改应用。它可以帮助你HOOK一个App。Cycript最为贴心和实用的功能是它可以帮助我们轻松测试函数效果，整个过程安全无副作用，效果十分显著，实乃业界良心！
安装方式：在Cydia中搜索Cycript安装
使用方法：
1、root登录越狱设备
2、cycript-p 你想要测试的进程名
3、随便玩，完全兼容OC语法比如cy# [#0x235b4fb1 hidden]
Cycript有几条非常有用的命令：
choose：如果知道一个类对象存在于当前的进程中，却不知道它的地址，不能通过“#”操作符来获取它，此时可以使用choose命令获取到该类的所有对象的内存地址
打印一个对象的所有属性 [obj _ivarDescription].toString()
打印一个对象的所有方法[obj _methodDescription].toString()
动态添加属性 objc_setAssociatedObject(obj,@”isAdd”, [NSNumbernumberWithBool:YES], 0);
获取动态添加的属性 objc_getAssociatedObject(self, @”isAdd”)


## Reveal


Reveal是由ITTY BITTY出品的UI分析工具，可以直观地查看App的UI布局，我们可以用来研究别人的App界面是怎么做的，有哪些元素。更重要的是，可以直接找到你要HOOK的那个ViewController，贼方便不用瞎猫抓耗子一样到处去找是哪个ViewController了。
安装方法：
1、下载安装Mac版的Reveal
2、iOS安装Reveal Loader，在Cydia中搜索并安装Reveal Loader
在安装Reveal Loader的时候，它会自动从Reveal的官网下载一个必须的文件libReveal.dylib。如果网络状况不太好，不一定能够成功下载这个dylib文件，所以在下载完Reveal Loader后，检查iOS上的“/Library/RHRevealLoader/”目录下有没有一个名为“libReveal.dylib”的文件。如果没有就打开mac Reveal，在它标题栏的“Help”选项下，选中其中的“Show Reveal Library in Finder”，找到libReveal.dylib文件，使用scp拷贝到 iOS的/Library/RHRevealLoader/目录下。至此Reveal安装完毕！


## Dumpdecrypted


Dumpdecrypted就是著名的砸壳工具，所谓砸壳，就是对 ipa 文件进行解密。因为在上传到 AppStore 之后，AppStore自动给所有的 ipa 进行了加密处理。而对于加密后的文件，直接使用 class-dump 是得不到什么东西的，或者是空文件，或者是一堆加密后的方法/类名。
使用步骤如下：
1、设备中打开需要砸壳的APP。
2、SSH连接到手机，找到ipa包的位置并记录下来。
3、Cycript到该ipa的进程，找到App的Documents文件夹位置并记录下来。
4、拷贝dumpdecrypted.dylib到App的Documents 的目录。
5、执行砸壳后，并拷贝出砸壳后的二进制文件。
具体执行命令：
1、ssh root@192.168.2.2 （iP地址为越狱设备的iP地址）
2、 ps -e （查看进程，把进程对应的二进制文件地址记下来）
3、cycript -p 进程名
4、 [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
inDomains:NSUserDomainMask][0] （找到程序的documents目录）
5、scp ~/dumpdecrypted.dylib root@192.168.2.2:/var/mobile/Containers/Data/Application/XXXXXX/Documents
6、DYLD_INSERT_LIBRARIES=dumpdecrypted.dylib /var/mobile/Containers/Bundle/
Application/XXXXXX/xxx.app/xxx
然后就会生成.decrypted的文件，这个就是砸壳后的文件。接下来各种工具都随便上了class-dump、IDA、Hopper Disassembler


## class-dump

dump demo
```
$ class-dump -H /Users/xlsn0w/Desktop/Payload/JYLIM.app -o /Users/xlsn0w/Desktop/Header

```

class-dump就是用来dump二进制运行文件里面的class信息的工具。它利用Objective-C语言的runtime特性，将存储在Mach-O文件中的头文件信息提取出来，并生成对应的.h文件，这个工具非常有用，有了这个工具我们就像四维世界里面看三维物体，一切架构尽收眼底。
class-dump用法：
class-dump –arch armv7 -s -S -H 二进制文件路径 -o 头文件保存路径


## IDA


IDA是大名鼎鼎的反编译工具，它乃逆向工程中最负盛名的神器之一。支持Windows、Linux和Mac OS X的多平台反汇编器/调试器，它的功能非常强大。class-dump可以帮我们罗列出要分析的头文件，IDA能够深入各个函数的具体实现，无论的C，C++，OC的函数都可以反编译出来。不过反编译出来的是汇编代码，你需要有一定的汇编基础才能读的懂。
IDA很吃机器性能（我的机器经常卡住不动），还有另外一个反编译工具Hopper，对机器性能要求没那么高，也很好用，杀人越货的利器。

![CydiaRepo](https://github.com/XLsn0w/Cydia/blob/master/iOS%209.3.2%20jailbreak%20SE.png?raw=true)

## LLDB


LLDB是由苹果出品，内置于Xcode中的动态调试工具，可以调试C、C++、Objective-C，还全盘支持OSX、iOS，以及iOS模拟器。LLDB要配合debugserver来使用。常见的LLDB命令有：
p命令：首先p是打印非对象的值。如果使用它打印对象的话，那么它会打印出对象的地址，如果打印非对象它一般会打印出基本变量类型的值。当然用它也可以申明一个变量譬如 p int a=10;（注lldb使用a = 10; （注lldb使用在变量前来声明为lldb内的命名空间的）
po 命令：po 命令是我们最常用的命令因为在ios开发中，我们时刻面临着对象，所以我们在绝大部分时候都会使用po。首先po这个命令会打印出对象的description描述。
bt [all] 打印调用堆栈，是thread backtrace的简写，加all可打印所有thread的堆栈。
br l 是breakpoint list的简写，列出所有的断点
image list -o -f 列出模块和ASLR偏移，以及偏移后的地址，可以通过偏移后的地址-ASLR偏移来得出模块的基地址。
b NSLog给函数设置断点
br s -a IDA中偏移前的地址+ASLR偏移量 给内存地址设置断点
p (char *)$r1打印函数名称
br dis、br en和br del表示禁用、启用和删除断点
nexti（ni）跳过一行
stepi（si）跳入函数
c继续执行直到断点
register write r0 1修改寄存器的值usbmuxd很多人都是通过WiFi连接使用SSH服务的，因为无线网络的不稳定性及传输速度的限制，在复制文件或用LLDB远程调试时，iOS的响应很慢，效率不高。iOS越狱社区的知名人士Nikias Bassen开发了一款可以把本地OSX/Windows端口转发到远程iOS端口的工具usbmuxd，使我们能够通过USB连接线ssh到iOS中，大大增加了ssh连接的速度，也方便了那些没有WiFi的朋友。使用usbmuxd能极大提升ssh的速度，用LLDB远程连接debugserver的时间被缩短至15秒以内，强烈建议大家把usbmuxd作为ssh连接的首选方案


## Theos


以上都是App的分析工具，而Theos是一个越狱开发工具包（具体写代码），由iOS越狱界知名人士Dustin Howett开发并分享到GitHub上。Theos与其他越狱开发工具相比，最大的特点就是简单：下载安装简单、Logos语法简单、编译发布简单，可以让使用者把精力都放在开发工作上去。就是让你省去了繁琐的原始代码编写，简化了编译和安装过程。同样有一款工具iOSOpenDev是整合在Xcode里的，可以直接在Xcode中配置开发、运行越狱程序，不过iOSOpenDev的安装，过程真的是让人要吐血（我有一台mac死活都装不上）。
用法，theos有多种模板可以选择，最常用的就是tweak插件了：
/opt/theos/bin/nic.plNIC 2.0 - New Instance Creator
[1.] iphone/application
[2.] iphone/library
[3.] iphone/preference_bundle
[4.] iphone/tool
[5.] iphone/tweak
打包编译安装，需要按照固定格式编写Makefile文件，然后执行命令
make package install，自动编译打包安装到iOS设备。
如果你用的是IOSOpenDev就更简单了，配置好iOS设备ip地址，直接执行product->Bulid for－>profiling，自动打包安装好

一、 安装theos

1.打开终端(terminal)
2.先安装Homebrew
3.brew install ldid

4.下载theos 建议最好使用命令行的方式进行下载安装，因为theos内含有一些依赖文件
git clone --recursive https://github.com/theos/theos.git $THEOS
pS：$THEOS为环境变量，theos下载的目录
配置环境变量的方法如下->
```
$ ls -al /*找到bash_profile */
$ vim .bash_profile /* 编辑文件 */
$ export THEOS=~/theos /* 加入环境变量 */
$ export PATH=~/theos/bin:$PATH /* 如果不加入这行，theos的命令会无效。 */ /** $PATH 千万不要忘记写或者写错，不然所有的命令都用不了了。如果真这样了请打开这个链接按步骤进行https://zhidao.baidu.com/question/1755826278714933228.html **/
$ :wq  /* 保存退出 */
$ source .bash_profile /* 使新添加的环境变量立即生效 */

```
新建项目
```
$ nic.pl

NIC 2.0 - New Instance Creator
------------------------------
[1.] iphone/activator_event
[2.] iphone/application_modern
[3.] iphone/application_swift
[4.] iphone/flipswitch_switch
[5.] iphone/framework
[6.] iphone/library
[7.] iphone/preference_bundle_modern
[8.] iphone/tool
[9.] iphone/tool_swift
[10.] iphone/tweak
[11.] iphone/xpc_service
Choose a Template (required): 10
Project Name (required): XLsn0wtweak
Package Name [com.yourcompany.xlsn0wtweak]: com.xlsn0w.xlsn0wtweak
Author/Maintainer Name [Mac]: XLsn0w
[iphone/tweak] MobileSubstrate Bundle filter [com.apple.springboard]: 
[iphone/tweak] List of applications to terminate upon installation (space-separated, '-' for none) [SpringBoard]: 
Instantiating iphone/tweak in xlsn0wtweak/...
Done.


 ****** How to Hook with Logos ******
 
 
Hooks are written with syntax similar to that of an Objective-C @implementation.
You don't need to #include <substrate.h>, it will be done automatically, as will
the generation of a class list and an automatic constructor.

%hook ClassName

// Hooking a class method
+ (id)sharedInstance {
return %orig;
}

// Hooking an instance method with an argument.
- (void)messageName:(int)argument {
%log; // Write a message about this call, including its class, name and arguments, to the system log.

%orig; // Call through to the original function with its original arguments.
%orig(nil); // Call through to the original function with a custom argument.

// If you use %orig(), you MUST supply all arguments (except for self and _cmd, the automatically generated ones.)
}

// Hooking an instance method with no arguments.
- (id)noArguments {
%log;
id awesome = %orig;
[awesome doSomethingElse];

return awesome;
}

// Always make sure you clean up after yourself; Not doing so could have grave consequences!
%end


```

![Cydiapple](https://github.com/XLsn0w/XLsn0w/raw/XLsn0w/XLsn0w/Cydiapple.png?raw=true)

# Cycript

官网：http://www.cycript.org/

越狱的设备，在cydia中安装这个插件。


2、设备环境

mac ,  iOS设备（已经越狱）

首先，在手机上安装openssh， 安装方式：cydia。当然，你也可是去官网下载包，然后在将其打包成.deb格式，再拷入iPhone中。

Mac与 iPhone接在了同一个局域网下

3、 简单使用

使用cycript，可实现简单的进程注入。当然，还可以用作其他方面，因为其实时性强。这里，我就实现了简单的进程注入。

4、实现过程：

A、在Mac下使用终端登录到iPhone上，默认密码是：alpine，使用命令：ssh root@192.168.x.x

当然，你也可以在自己的iPhone上装 MTerminal 插件。 如下图
![MTerminal](https://github.com/XLsn0w/Cydia/blob/master/MTerminal.JPG?raw=true)

B、回到主题，继续在终端键入命令  ps -e | grep SpringBoard, 查找 进程id 

C、找到ID 后，就可以用cycript实现注入了，键入命令如下：cycript -p 14823

D、完成注入后，接着键入下面的命令，然后回车，再看看自己的iPhone吧。

alertView = [[[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:il cancelButtonTitle:@"ok" otherButtonTitles:nil] show]


我这里注入的进程是 SpringBoard 。 简单的进程注入，只是cycript功能的冰山一角中的一小点，它还有很多强大的功能，看看官网的文档吧。超详细

文档传送门：http://www.cycript.org/manual/


# Theos

Git仓库地址：<https://github.com/theos/theos> by [Github@DHowett](https://github.com/DHowett?tab=repositories)

更新模版：<https://github.com/DHowett/theos-nic-templates>

lidi: <http://joedj.net/ldid>

dpkg-deb：<https://github.com/DHowett/dm.pl>


## 安装
- 下载**theos**并安装到 `/opt/theos` 
- 配置环境变量 `cd ~` -> `export THEOS=/opt/theos`
- 下载**ldid**到`/opt/theos/bin` 修改权限 `sudo chmod 777 /opt/theos/bin/ldid`
- 下载**dm.pl**重命名为**dpkg-deb**到`/opt/theos/bin` 修改权限 `sudo chmod 777 /opt/theos/bin/dpkg-deb`
- 更新**模版jar**下载拷贝至`opt/theos/templates/iphone/`，注意去重	
## 创建工程

终端运行 `$THEOS/bin/nic.pl`

```ruby

NIC 2.0 - New Instance Creator
------------------------------
  [1.] iphone/activator_event
  [2.] iphone/application_modern
  [3.] iphone/cydget
  [4.] iphone/flipswitch_switch
  [5.] iphone/framework
  [6.] iphone/ios7_notification_center_widget
  [7.] iphone/library
  [8.] iphone/notification_center_widget
  [9.] iphone/preference_bundle_modern
  [10.] iphone/sbsettingstoggle
  [11.] iphone/tool
  [12.] iphone/tweak
  [13.] iphone/xpc_service
Choose a Template (required): 

```

## Logos语法
http://iphonedevwiki.net/index.php/Logos

新建Monkey工程时,MonkeyDev已经将libsubstrate.dylib库和RevealServer.framework库注入进去了，有了libsubstrate.dylib库就能写Logos语法

Logos语法    功能解释    事例
```
%hook    需要hook哪个类    %hook Classname
%end    代码块结束标记    
%group    分组    %group Groupname
%new    添加新方法    %new(signature)
%ctor    构造函数    %ctor { … }
%dtor    析构函数    %dtor { … }
%log    输出打印    %log; %log([(
%orig    保持原有方法    %orig；%orig(arg1, …)；
%c        %c([+/-]Class)；
```

1.%hook 
   %end

指定需要hook的class,必须以％end结尾。

// hook SpringBoard类里面的_menuButtonDown函数,先打印一句话,再之子那个函数原始的操作
%hook SpringBorad
```
- (void)_menuButtonDown:(id)down
{
NSLog(@"111111");
%orig; // 调用原始的_menuButtonDown函数
}
%end
```
2.%group

该指令用于将%hook分组，便于代码管理及按条件初始化分组，必须以%end结尾。
一个％group可以包含多个%hook,所有不属于某个自定义group的％hook会被隐式归类到％group_ungrouped中。
```
%group iOS8
%hook IOS8_SPECIFIC_CLASS
// your code here
%end // end hook
%end // end group ios8

%group iOS9
%hook IOS9_SPECIFIC_CLASS
// your code here
%end // end hook
%end // end group ios9

%ctor {
if (kCFCoreFoundationVersionNumber > 1200) {
%init(iOS9);
} else {
%init(iOS8);
}
}
```
3.%new

在%hook内部使用，给一个现有class添加新函数，功能与class_addMethod相同.
注：
Objective-C的category与class_addMethod的区别：
前者是静态的而后者是动态的。使用%new添加,而不需要向.h文件中添加函数声明,如果使用category,可能与遇到这样那样的错误.
```
%hook SpringBoard
%new
- (void)addNewMethod
{
NSLog(@"动态添加一个方法到SpringBoard");
}
%end
```
4.%ctor

tweak的constructor,完成初始化工作；如果不显示定义，Theos会自动生成一个%ctor,并在其中调用%init(_ungrouped)。%ctor一般可以用来初始化%group,以及进行MSHookFunction等操作,如下:
```
#ifndef KCFCoreFoundationVersionNumber_iOS_8_0
#define KCFCoreFoundationVersionNumber_iOS_8_0      1140.10
#endif

%ctor
{
%init;

if (KCFCoreFoundationVersionNumber >= KCFCoreFoundationVersionNumber_iOS_7_0 && KCFCoreFoundationVersionNumber > KCFCoreFoundationVersionNumber_iOS_8_0)
%init(iOS7Hook);
if (KCFCoreFoundationVersionNumber >= KCFCoreFoundationVersionNumber_iOS_8_0)
%init(iOS8Hook);
MSHookFunction((void *)&AudioServicesPlaySystemSound,(void *)&replaced_AudioServerPlaySystemSound,(void **)&orginal_AudioServicesPlaySystemSound);
}
```
5.%dtor

Generate an anonymous deconstructor (of default priority).

%dtor { … }
6.%log

该指令在%hook内部使用，将函数的类名、参数等信息写入syslog,可以％log([(),…..])的格式追加其他打印信息。
```
%hook SpringBorad
- (void)_menuButtonDown:(id)down
{
%log((NSString *)@"iosre",(NSString *)@"Debug");
%orig; // 调用原始的_menuButtonDown方法
}
%end
```
6.%orig

该指令在%hook内部使用，执行被hook的函数的原始代码；也可以用％orig更改原始函数的参数。
```
%hook SpringBorad
- (void)setCustomSubtitleText:(id)arg1 withColor:   (id)arg2
{
%orig(@"change arg2",arg2);// 将arg2的参数修 改为"change arg2"
}
%end
```
7.%init

该指令用于初始化某个％group，必须在%hook或％ctor内调用；如果带参数，则初始化指定的group，如果不带参数，则初始化_ungrouped.
注： 切记，只有调用了％init,对应的%group才能起作用！

8.%c

该指令的作用等同于objc_getClass或NSClassFromString,即动态获取一个类的定义，在%hook或％ctor内使用 。


# Class-dump

Github地址： https://github.com/nygard/class-dump

主页：http://stevenygard.com/projects/class-dump

下载并打开[安装包](http://stevenygard.com/download/class-dump-3.5.dmg)（版本可能会随时更新）
将class-dump可执行文件放到`/usr/bin`下或者`/usr/local/bin`

```ruby
class-dump 3.5 (64 bit)
Usage: class-dump [options] <mach-o-file>

where options are:
-a             显示实例变量的偏移
-A             显示实现地址
--arch <arch>  选择通用二进制特定的架构(PPC,PPC64,是i386,x86_64）
-C <regex>     只显示类匹配的正则表达式
-f <str>       找到方法名字符串
-H             在当前路径下导出头文件，或者通过-o指定路径
-I             排序类，类别，以及通过继承协议 ps:此参数将覆盖-s
-o <dir>       -H导出头文件的指定保存路径
-r             递归扩展框架和固定VM共享库
-s             类和类名排序
-S             按名称排序
-t             阻止头文件输出，主要用于测试
--list-arches  列出文件中的架构，然后退出
--sdk-ios      指定的iOS SDK版本（会看在/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS<version>.sdk
--sdk-mac      指定Mac OS X版本（会看在/Developer/SDKs/MacOSX<version>.sdk
--sdk-root     指定完整的SDK根路径（或使用--sdk -IOS / - SDK -MAC的快捷方式）
```

- 如果dump出的文件只有CDStructures.h文件，则表示出现错误。
- 如果dump导出的文件命名为XXEncryptedXXX，则需要通过AppCrackr、Clutch、dumpcrypted等进行砸壳。 [这里是dumpcrypted的使用](Dumpdecrypted.md)


## 例子
class-dump AppKit:

```ruby
class-dump /System/Library/Frameworks/AppKit.framework
```

class-dump UIKit:

```ruby
class-dump /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.3.sdk/System/Library/Frameworks/UIKit.framework
```

class-dump UIKit and all the frameworks it uses:

```ruby
class-dump /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.3.sdk/System/Library/Frameworks/UIKit.framework -r --sdk-ios 4.3
```

class-dump UIKit (and all the frameworks it uses) from developer tools that have been installed in /Dev42 instead of /Developer:

```ruby
class-dump /Dev42/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk/System/Library/Frameworks/UIKit.framework -r --sdk-root /Dev42/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk
```

使用dumpdecrypted给App砸壳后

```ruby
class-dump --arch armv7 app.decrypted -H -o ./heads/
```

## class-dump-z

主页：https://code.google.com/p/networkpx/wiki/class_dump_z

使用wiki： https://code.google.com/archive/p/networkpx/wikis/class_dump_z.wiki

将`class-dump-z`可执行文件放到`/usr/bin`下或者`/usr/local/bin`


## 参考文献

- http://itony.me/200.html







# Dumpdecrypted

## 路径

用iFile、Filza等工具找到：

iOS7在`/var/mobile/Application/`

iOS8在`/var/mobile/Containers/Bundle/Application/`

sandbox路径：`/var/mobile/Containers/Data/Application/xxx`

## 编译
源码地址：https://github.com/stefanesser/dumpdecrypted/archive/master.zip

`make`后生成`dumpdecrypted.dylib`文件

>**ps:** 这里有几个编译好的dylib可以下载：
</br>
https://github.com/iosre/Ready2Rock/blob/master/dumpdecrypted_5.dylib
https://github.com/iosre/Ready2Rock/blob/master/dumpdecrypted_6.dylib
https://github.com/iosre/Ready2Rock/blob/master/dumpdecrypted_7.dylib


## 砸壳
把编译好的`dumpdecrypted.dylib`文件放入想要砸壳的app的documents文件夹里

执行以下代码砸壳：
```ruby
DYLD_INSERT_LIBRARIES=dumpdecrypted.dylib /var/mobile/Containers/Bundle/Application/AppPath/Name.app/Name 
```

记录一次成功日志
```ruby
Last login: Sat Jul 16 21:36:39 on ttys000
localhost:~ lihao$ sudo ssh root@192.168.1.13
ssh: connect to host 192.168.1.13 port 22: Operation timed out
localhost:~ lihao$ sudo ssh root@192.168.1.13
root@192.168.1.13's password: 
iPhone:~ root# cd /var/mobile
iPhone:/var/mobile root# cd Containers/Data/Application/  
iPhone:/var/mobile/Containers/Data/Application/4ED085B4-FF7F-4B90-98F9-F17E241E1534 root# cd Documents/

iPhone:/var/mobile/Containers/Data/Application/4ED085B4-FF7F-4B90-98F9-F17E241E1534/Documents root# DYLD_INSERT_LIBRARIES=dumpdecrypted.dylib /var/mobile/Containers/Bundle/Application/1BD15C2B-3661-4104-B8D4-3DE455EB4FB1/NewsBoard.app/NewsBoard

mach-o decryption dumper
DISCLAIMER: This tool is only meant for security research purposes, not for application crackers.

[+] detected 32bit ARM binary in memory.
[+] offset to cryptid found: @0xc6a90(from 0xc6000) = a90
[+] Found encrypted data at address 00004000 of length 12861440 bytes - type 1.
[+] Opening /private/var/mobile/Containers/Bundle/Application/1BD15C2B-3661-4104-B8D4-3DE455EB4FB1/NewsBoard.app/NewsBoard for reading.
[+] Reading header
[+] Detecting header type
[+] Executable is a FAT image - searching for right architecture
[+] Correct arch is at offset 16384 in the file
[+] Opening NewsBoard.decrypted for writing.
[+] Copying the not encrypted start of the file
[+] Dumping the decrypted data into the file
[+] Copying the not encrypted remainder of the file
[+] Setting the LC_ENCRYPTION_INFO->cryptid to 0 at offset 4a90
[+] Closing original file
[+] Closing dump file
iPhone:/var/mobile/Containers/Data/Application/4ED085B4-FF7F-4B90-98F9-F17E241E1534/Documents 

root# 
```

成功后会生成`Name.decrypted`文件

## 分析

当砸壳完毕后，将砸壳生成的 ***.decrypted 文件拷贝至你的MAC。

通过class-dump分析：

```ruby
class-dump --arch armv7 /Users/lihao/Desktop/Name.decrypted -H -o path/
```

## 注意
- 通过Cydia等第三方渠道下载的app有的不需要砸壳，当使用dumpdecrypted时会提示以下信息：
`This mach-o file is not encrypted. Nothing was decrypted.`
- 当砸壳完毕后，使用 class-dump 仍然只导出 CDStructures.h 一个文件，则可能架构选择错误；因为dumpdecrypted只能砸相应手机处理器对应的壳。



## 参考文献
- http://bbs.iosre.com/t/dumpdecrypted-app/22/65
- http://bbs.iosre.com/t/dumpdecrypted-app/160
- http://bbs.iosre.com/t/class-dump-error-cannot-find-offset-for-address-xxxx-in-dataoffsetforaddress/1911







# Reveal

Reveal主页：http://revealapp.com

Reveal 是一个界面调试工具，[这里](http://blog.devzeng.com/blog/ios-reveal-integrating.html)有一篇iOS开发中集成Reveal的教程，所以我们就不讨论如何集成到自己的工程中，接下来我们看一下如何使用Reveal查看任意app。

需要的东西：

- 越狱设备
- Cydia
- iFile
- SSH

使用Cydia下载 [**Reveal Loader**](https://github.com/heardrwt/RevealLoader) 并安装后re-spring或重启iOS设备。在系统设置中找到 **Reveal** -> **Enabled Applications** 进行配置，打开你想要Reveal的app。


建议需要查看哪个开哪个，其他的关闭掉，这样Reveal加载速度会快一点。

![这是参考文献中的图](http://ww3.sinaimg.cn/large/6a011e49gw1eyk3r7s8rvj21520rgwma.jpg)


## 符号表历来是逆向工程中的“必争之地”，而iOS应用在上线前都会裁去符号表，以避免被逆向分析。

直接看效果,支付宝恢复符号表后的样子:

![](http://blog.imjun.net/posts/restore-symbol-of-iOS-app/after_restore.jpg)

支付宝恢复符号表后

文章有点长，请耐心看到最后，亮点在最后。

为什么要恢复符号表
逆向工程中，调试器的动态分析是必不可少的，而 Xcode + lldb 确实是非常好的调试利器, 比如我们在Xcode里可以很方便的查看调用堆栈，如上面那张图可以很清晰的看到支付宝登录的RPC调用过程。

实际上，如果我们不恢复符号表的话，你看到的调试页面应该是下面这个样子：

![](http://blog.imjun.net/posts/restore-symbol-of-iOS-app/before_restore.jpg)

恢复符号表前

同一个函数调用过程，Xcode的显示简直天差地别。

原因是，Xcode显示调用堆栈中符号时，只会显示符号表中有的符号。为了我们调试过程的顺利，我们有必要把可执行文件中的符号表恢复回来。

符号表是什么
我们要恢复符号表，首先要知道符号表是什么，他是怎么存在于 Mach-O 文件中的。

符号表储存在 Mach-O 文件的 __LINKEDIT 段中，涉及其中的符号表（Symbol Table）和字符串表（String Table）。

这里我们用 MachOView 打开支付宝的可执行文件，找到其中的 Symbol Table 项。

![](http://blog.imjun.net/posts/restore-symbol-of-iOS-app/symbol_table.jpg)

符号表的结构是一个连续的列表，其中的每一项都是一个 struct nlist。

//  位于系统库 <macho-o/nlist.h> 头文件中
struct nlist {
union {
//符号名在字符串表中的偏移量
uint32_t n_strx;    
} n_un;
uint8_t n_type;
uint8_t n_sect;
int16_t n_desc;
//符号在内存中的地址，类似于函数指针
uint32_t n_value;
};
这里重点关注第一项和最后一项，第一项是符号名在字符串表中的偏移量，用于表示函数名，最后一项是符号在内存中的地址，类似于函数指针（这里只说明大概的结构，详细的信息请参考官方Mach O文件格式的文档）。

也就是说如果我们知道了符号名和内存地址的对应关系，我们是可以根据这个结构来逆向构造出符号表数据的。

知道了如何构造符号表，下一步就是收集符号名和内存地址的对应关系了。

获取OC方法的符号表
因为OC语言的特性，编译器会将类名、函数名等编译进最后的可执行文件中，所以我们可以根据Mach-O文件的结构逆向还原出工程里的所有类，这也就是大名鼎鼎的逆向工具 class-dump 了。class-dump 出来的头文件里是有函数地址的：

所以我们只要对class-dump的源码稍作修改，即可获取我们要的信息。

符号表恢复工具
整理完数据格式，又理清了数据来源，我们就可以写工具了。

实现过程就不详细说明了，工具开源在我的Github上了，链接：
https://github.com/tobefuturer/restore-symbol

我们来看看怎么用这个工具：

1.下载源码编译

git clone --recursive https://github.com/tobefuturer/restore-symbol.git
cd restore-symbol && make
./restore-symbol
2.恢复OC的符号表，非常简单

1
./restore-symbol ./origin_AlipayWallet -o ./AlipayWallet_with_symbol
origin_AlipayWallet 为Clutch砸壳后，没有符号表的 Mach-O 文件
-o 后面跟输出文件位置

3.把 Mach-O 文件重签名打包，看效果

文件恢复符号表后，多出了20M的符号表信息


Xcode里查看调用栈

![](http://blog.imjun.net/posts/restore-symbol-of-iOS-app/restore_only_oc.jpg)


可以看到，OC函数这部分的符号已经恢复了，函数调用栈里已经能看出大致的调用过程了，但是支付宝里，采用了block的回调形式，所以还有很大一部分的符号没能正确显示。

下面我们就来看看怎么样恢复这部分block的符号。

获取block的符号信息
还是同样的思路，要恢复block的符号信息，我们必须知道block在文件中的储存形式。

block在内存中的结构
首先，我们先分析下运行时，block在内存中的存在形式。block在内存中是以一个结构体的形式存在的，大致的结构如下：


struct __block_impl {
/**
block在内存中也是类NSObject的结构体，
结构体开始位置是一个isa指针
*/
Class isa;

/** 这两个变量暂时不关心 */
int flags;
int reserved;

/**
真正的函数指针！！
*/
void (*invoke)(...);
...
}
说明下block中的isa指针，根据实际情况会有三种不同的取值，来表示不同类型的block：

_NSConcreteStackBlock

栈上的block，一般block创建时是在栈上分配了一个block结构体的空间，然后对其中的isa等变量赋值。

_NSConcreteMallocBlock

堆上的block，当block被加入到GCD或者被对象持有时，将栈上的block复制到堆上，此时复制得到的block类型变为了_NSConcreteMallocBlock。

_NSConcreteGlobalBlock

全局静态的block，当block不依赖于上下文环境，比如不持有block外的变量、只使用block内部的变量的时候，block的内存分配可以在编译期就完成，分配在全局的静态常量区。

第2种block在运行时才会出现，我们只关注1、3两种，下面就分析这两种isa指针和block符号地址之间的关联。

block isa指针和符号地址之间的关联
分析这部分需要用到IDA这个反汇编软件, 这里结合两个实际的小例子来说明：

1._NSConcreteStackBlock
假设我们的源代码是这样很简单的一个block：

11
@implementation ViewController
- (void)viewDidLoad {
int t = 2;
void (^ foo)() = ^(){
NSLog(@"%d", t); //block 引用了外部的变量t
};
foo();
}
@end
编译完后，实际的汇编长这个样子：


实际运行时，block的构造过程是这样：

为block开辟栈空间
为block的isa指针赋值（一定会引用全局变量：_NSConcreteStackBlock）
获取函数地址，赋值给函数指针
所以我们可以整理出这样一个特征：

重点来了!!!

凡是代码里用到了栈上的block，一定会获取__NSConcreteStackBlock作为isa指针，同时会紧接着获取一个函数地址，那个函数地址就是block的函数地址。

结合下面这个图，仔细理解上面这句话
（这张图和上面那张图是同一个文件，不过裁掉了符号表）


利用这个特征，逆向分析时我们可以做如下推断：

在一个OC方法里发现引用了__NSConcreteStackBlock这个变量，那么在这附近，一定会出现一个函数地址，这个函数地址就是这个OC方法里的一个block。

比如上面图中，我们发现 viewDidLoad 里，引用了__NSConcreteStackBlock,同时紧接着加载了 sub_100049D4 的函数地址，那我们就可以认定sub_100049D4是viewDidLoad里的一个block, sub_100049D4函数的符号名应该是 viewDidLoad_block.

2. _NSConcreteGlobalBlock
全局的静态block，是那种不引用block外变量的block，他因为不引用外部变量，所以他可以在编译期就进行内存分配操作，也不用担心block的复制等等操作，他存在于可执行文件的常量区里。

不太理解的话，看个例子：

我们把源代码改成这样：

@implementation ViewController
- (void)viewDidLoad {

void (^ foo)() = ^(){
//block 不引用外部的变量
NSLog(@"%d", 123);
};
foo();
}
@end
那么在编译后会变成这样：


那么借鉴上面的思路，在逆向分析的时候，我们可以这么推断

在静态常量区发现一个_NSConcreteGlobalBlock的引用
这个地方必然存在一个block的结构体数据
在这个结构体第16个字节的地方会出现一个值，这个值是一个block的函数地址
3. block 的嵌套结构
实际在使用中，可能会出现block内嵌block的情况：

- (void)viewDidLoad {
dispatch_async(background_queue ,^{
...
dispatch_async(main_queue, ^{
...     
});
});
}
所以这里block就出现了父子关系，如果我们将这些父子关系收集起来，就可以发现，这些关系会构成图论里的森林结构，这里可以简单用递归的深度优先搜索来处理，详细过程不再描述。

block符号表提取脚本（IDA+python）
整理上面的思路，我们发现搜索过程依赖于IDA提供各种引用信息，而IDA是提供了编程接口的，可以利用这些接口来提取引用信息。

IDA提供的是Python的SDK，最后完成的脚本也放在仓库里search_oc_block/ida_search_block.py。

提取block符号表
这里简单介绍下怎么使用上面这个脚本

用IDA打开支付宝的 Mach-O 文件
等待分析完成！ 可能要一个小时
Alt + F7 或者 菜单栏 File -> Script file...

等待脚本运行完成，预计30s至60s，运行过程中会有这样的弹窗

弹窗消失即block符号表提取完成
在IDA打开文件的目录下,会输出一份名为block_symbol.json的json格式block符号表


恢复符号表&实际分析
用之前的符号表恢复工具，将block的符号表导入Mach-O文件

1
./restore-symbol ./origin_AlipayWallet -o ./AlipayWallet_with_symbol -j block_symbol.json
-j 后面跟上之前得到的json符号表

最后得到一份同时具有OC函数符号表和block符号表的可执行文件

这里简单介绍一个分析案例, 你就能体会到这个工具的强大之处了。

在Xcode里对 -[UIAlertView show] 设置断点

运行程序，并在支付宝的登录页面输入手机号和错误的密码，点击登录
Xcode会在‘密码错误’的警告框弹出时停下，左侧会显示出这样的调用栈
一张图看完支付宝的登录过程
![](http://blog.imjun.net/posts/restore-symbol-of-iOS-app/xcode_backtrace.jpg)

## 参考文献

- http://c.blog.sina.com.cn/profile.php?blogid=cb8a22ea89000gtw 
<br/>这篇有点过时了，修改libReveal.plist时经常出现白苹果，可以强制进入[安全模式](https://www.google.com.hk/#newwindow=1&safe=strict&q=iphone+安全模式)后将文件修改好再重新启动。
- http://hilen.github.io/2015/12/01/Reveal-Loader/


```
//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？
//

//_ooOoo_  
//o8888888o  
//88" . "88  
//(| -_- |)  
// O\ = /O  
//___/`---'\____  
//.   ' \\| |// `.  
/// \\||| : |||// \  
/// _||||| -:- |||||- \  
//| | \\\ - /// | |  
//| \_| ''\---/'' | |  
//\ .-\__ `-` ___/-. /  
//___`. .' /--.--\ `. . __  
//."" '< `.___\_<|>_/___.' >'"".  
//| | : `- \`.;`\ _ /`;.`/ - ` : | |  
//\ \ `-. \_ __\ /__ _/ .-` / /  
//======`-.____`-.___\_____/___.-`____.-'======  
//`=---='  
//  
//         .............................................  
//          佛曰：bug泛滥，我已瘫痪！


/**
*　　　　　　　　┏┓　　　┏┓+ +
*　　　　　　　┏┛┻━━━┛┻┓ + +
*　　　　　　　┃　　　　　　　┃
*　　　　　　　┃　　　━　　　┃ ++ + + +
*　　　　　　 ████━████ ┃+
*　　　　　　　┃　　　　　　　┃ +
*　　　　　　　┃　　　┻　　　┃
*　　　　　　　┃　　　　　　　┃ + +
*　　　　　　　┗━┓　　　┏━┛
*　　　　　　　　　┃　　　┃
*　　　　　　　　　┃　　　┃ + + + +
*　　　　　　　　　┃　　　┃　　　　Code is far away from bug with the animal protecting
*　　　　　　　　　┃　　　┃ + 　　　　神兽保佑,代码无bug
*　　　　　　　　　┃　　　┃
*　　　　　　　　　┃　　　┃　　+
*　　　　　　　　　┃　 　　┗━━━┓ + +
*　　　　　　　　　┃ 　　　　　　　┣┓
*　　　　　　　　　┃ 　　　　　　　┏┛
*　　　　　　　　　┗┓┓┏━┳┓┏┛ + + + +
*　　　　　　　　　　┃┫┫　┃┫┫
*　　　　　　　　　　┗┻┛　┗┻┛+ + + +
*/

//
//   █████▒█    ██  ▄████▄   ██ ▄█▀       ██████╗ ██╗   ██╗ ██████╗
// ▓██   ▒ ██  ▓██▒▒██▀ ▀█   ██▄█▒        ██╔══██╗██║   ██║██╔════╝
// ▒████ ░▓██  ▒██░▒▓█    ▄ ▓███▄░        ██████╔╝██║   ██║██║  ███╗
// ░▓█▒  ░▓▓█  ░██░▒▓▓▄ ▄██▒▓██ █▄        ██╔══██╗██║   ██║██║   ██║
// ░▒█░   ▒▒█████▓ ▒ ▓███▀ ░▒██▒ █▄       ██████╔╝╚██████╔╝╚██████╔╝
//  ▒ ░   ░▒▓▒ ▒ ▒ ░ ░▒ ▒  ░▒ ▒▒ ▓▒       ╚═════╝  ╚═════╝  ╚═════╝
//  ░     ░░▒░ ░ ░   ░  ▒   ░ ░▒ ▒░
//  ░ ░    ░░░ ░ ░ ░        ░ ░░ ░
//           ░     ░ ░      ░  ░
//                 ░


//                      d*##$.
// zP"""""$e.           $"    $o
//4$       '$          $"      $
//'$        '$        J$       $F
// 'b        $k       $>       $
//  $k        $r     J$       d$
//  '$         $     $"       $~
//   '$        "$   '$E       $
//    $         $L   $"      $F ...
//     $.       4B   $      $$$*"""*b
//     '$        $.  $$     $$      $F
//      "$       R$  $F     $"      $
//       $k      ?$ u*     dF      .$
//       ^$.      $$"     z$      u$$$$e
//        #$b             $E.dW@e$"    ?$
//         #$           .o$$# d$$$$c    ?F
//          $      .d$$#" . zo$>   #$r .uF
//          $L .u$*"      $&$$$k   .$$d$$F
//           $$"            ""^"$$$P"$P9$
//          JP              .o$$$$u:$P $$
//          $          ..ue$"      ""  $"
//         d$          $F              $
//         $$     ....udE             4B
//          #$    """"` $r            @$
//           ^$L        '$            $F
//             RN        4N           $
//              *$b                  d$
//               $$k                 $F
//               $$b                $F
//                 $""               $F
//                 '$                $
//                  $L               $
//                  '$               $
//                   $               $
//

//         ┌─┐       ┌─┐
//      ┌──┘ ┴───────┘ ┴──┐
//      │                 │
//      │       ───       │
//      │  ─┬┘       └┬─  │
//      │                 │
//      │       ─┴─       │
//      │                 │
//      └───┐         ┌───┘
//          │         │
//          │         │
//          │         │
//          │         └──────────────┐
//          │                        │
//          │                        ├─┐
//          │                        ┌─┘
//          │                        │
//          └─┐  ┐  ┌───────┬──┐  ┌──┘
//            │ ─┤ ─┤       │ ─┤ ─┤
//            └──┴──┘       └──┴──┘
//                神兽保佑
//                代码无BUG!
//          Code is far away from bug with the animal protecting

//                               |~~~~~~~|
//                               |       |
//                               |       |
//                               |       |
//                               |       |
//                               |       |
//    |~.\\\_\~~~~~~~~~~~~~~xx~~~         ~~~~~~~~~~~~~~~~~~~~~/_//;~|
//    |  \  o \_         ,XXXXX),                         _..-~ o /  |
//    |    ~~\  ~-.     XXXXX`)))),                 _.--~~   .-~~~   |
//     ~~~~~~~`\   ~\~~~XXX' _/ ';))     |~~~~~~..-~     _.-~ ~~~~~~~
//              `\   ~~--`_\~\, ;;;\)__.---.~~~      _.-~
//                ~-.       `:;;/;; \          _..-~~
//                   ~-._      `''        /-~-~
//                       `\              /  /
//                         |         ,   | |
//                          |  '        /  |
//                           \/;          |
//                            ;;          |
//                            `;   .       |
//                            |~~~-----.....|
//                           | \             \
//                          | /\~~--...__    |
//                          (|  `\       __-\|
//                          ||    \_   /~    |
//                          |)     \~-'      |
//                           |      | \      '
//                           |      |  \    :
//                            \     |  |    |
//                             |    )  (    )
//                              \  /;  /\  |
//                              |    |/   |
//                              |    |   |
//                               \  .'  ||
//                               |  |  | |
//                               (  | |  |
//                               |   \ \ |
//                               || o `.)|
//                               |`\\\\) |
//                               |       |
//                               |       |





//                  ___====-_  _-====___
//            _--^^^#####//      \\#####^^^--_
//         _-^##########// (    ) \\##########^-_
//        -############//  |\^^/|  \\############-
//      _/############//   (@::@)   \\############\_
//     /#############((     \\//     ))#############\
//    -###############\\    (oo)    //###############-
//   -#################\\  / VV \  //#################-
//  -###################\\/      \//###################-
// _#/|##########/\######(   /\   )######/\##########|\#_
// |/ |#/\#/\#/\/  \#/\##\  |  |  /##/\#/  \/\#/\#/\#| \|
// `  |/  V  V  `   V  \#\| |  | |/#/  V   '  V  V  \|  '
//    `   `  `      `   / | |  | | \   '      '  '   '
//                     (  | |  | |  )
//                    __\ | |  | | /__
//                   (vvv(VVV)(VVV)vvv)
//                  神兽保佑
//                代码无BUG!
//

//                                                    __----~~~~~~~~~~~------___
//                                   .  .   ~~//====......          __--~ ~~
//                   -.            \_|//     |||\\  ~~~~~~::::... /~
//                ___-==_       _-~o~  \/    |||  \\            _/~~-
//        __---~~~.==~||\=_    -_--~/_-~|-   |\\   \\        _/~
//    _-~~     .=~    |  \\-_    '-~7  /-   /  ||    \      /
//  .~       .~       |   \\ -_    /  /-   /   ||      \   /
// /  ____  /         |     \\ ~-_/  /|- _/   .||       \ /
// |~~    ~~|--~~~~--_ \     ~==-/   | \~--===~~        .\
//          '         ~-|      /|    |-~\~~       __--~~
//                      |-~~-_/ |    |   ~\_   _-~            /\
//                           /  \     \__   \/~                \__
//                       _--~ _/ | .-~~____--~-/                  ~~==.
//                      ((->/~   '.|||' -_|    ~~-/ ,              . _||
//                                 -_     ~\      ~~---l__i__i__i--~~_/
//                                 _-~-__   ~)  \--______________--~~
//                               //.-~~~-~_--~- |-------~~~~~~~~
//                                      //.-~~~--\
//                  神兽保佑
//                代码无BUG!

//
//      ,----------------,              ,---------,
//         ,-----------------------,          ,"        ,"|
//       ,"                      ,"|        ,"        ,"  |
//      +-----------------------+  |      ,"        ,"    |
//      |  .-----------------.  |  |     +---------+      |
//      |  |                 |  |  |     | -==----'|      |
//      |  |  I LOVE DOS!    |  |  |     |         |      |
//      |  |  Bad command or |  |  |/----|`---=    |      |
//      |  |  C:\>_          |  |  |   ,/|==== ooo |      ;
//      |  |                 |  |  |  // |(((( [33]|    ,"
//      |  `-----------------'  |," .;'| |((((     |  ,"
//      +-----------------------+  ;;  | |         |,"
//         /_)______________(_/  //'   | +---------+
//    ___________________________/___  `,
//   /  oooooooooooooooo  .o.  oooo /,   \,"-----------
//  / ==ooooooooooooooo==.o.  ooo= //   ,`\--{)B     ,"
// /_==__==========__==_ooo__ooo=_/'   /___________,"
//


//
//                 .-~~~~~~~~~-._       _.-~~~~~~~~~-.
//             __.'              ~.   .~              `.__
//           .'//                  \./                  \\`.
//         .'//                     |                     \\`.
//       .'// .-~"""""""~~~~-._     |     _,-~~~~"""""""~-. \\`.
//     .'//.-"                 `-.  |  .-'                 "-.\\`.
//   .'//______.============-..   \ | /   ..-============.______\\`.
// .'______________________________\|/______________________________`.
//
//


// 亲爱的维护者：
// 如果你尝试了对这段程序进行‘优化’，
// 并认识到这种企图是大错特错，请增加
// 下面这个计数器的个数，用来对后来人进行警告：
// 浪费在这里的总时间 = 39h

/** * 致终于来到这里的勇敢的人：
你是被上帝选中的人，英勇的、不辞劳苦的、不眠不修的来修改
我们这最棘手的代码的编程骑士。你，我们的救世主，人中之龙，
我要对你说：永远不要放弃，永远不要对自己失望，永远不要逃走，辜负了自己。
永远不要哭啼，永远不要说再见。永远不要说谎来伤害自己。 */




/**
*                      江城子 . 程序员之歌
*
*                  十年生死两茫茫，写程序，到天亮。
*                      千行代码，Bug何处藏。
*                  纵使上线又怎样，朝令改，夕断肠。
*
*                  领导每天新想法，天天改，日日忙。
*                      相顾无言，惟有泪千行。
*                  每晚灯火阑珊处，夜难寐，加班狂。
*/

//
//                       .::::.
//                     .::::::::.
//                    :::::::::::          FUCK YOU 
//                 ..:::::::::::'
//              '::::::::::::'
//                .::::::::::
//           '::::::::::::::..
//                ..::::::::::::.
//              ``::::::::::::::::
//               ::::``:::::::::'        .:::.
//              ::::'   ':::::'       .::::::::.
//            .::::'      ::::     .:::::::'::::.
//           .:::'       :::::  .:::::::::' ':::::.
//          .::'        :::::.:::::::::'      ':::::.
//         .::'         ::::::::::::::'         ``::::.
//     ...:::           ::::::::::::'              ``::.
//    ```` ':.          ':::::::::'                  ::::..
//                       '.:::::'                    ':'````..


/**********
.--,       .--,
( (  \.---./  ) )
'.__/o   o\__.'
{=  ^  =}
>  -  <
/       \
//       \\
//|   .   |\\
"'\       /'"_.-~^`'-.
\  _  /--'         `
___)( )(___
(((__) (__)))    高山仰止,景行行止.虽不能至,心向往之。


**********/  


/*
::
:;J7, :,                        ::;7:
,ivYi, ,                       ;LLLFS:
:iv7Yi                       :7ri;j5PL
,:ivYLvr                    ,ivrrirrY2X,
:;r@Wwz.7r:                :ivu@kexianli.
:iL7::,:::iiirii:ii;::::,,irvF7rvvLujL7ur
ri::,:,::i:iiiiiii:i:irrv177JX7rYXqZEkvv17
;i:, , ::::iirrririi:i:::iiir2XXvii;L8OGJr71i
:,, ,,:   ,::ir@mingyi.irii:i:::j1jri7ZBOS7ivv,
,::,    ::rv77iiiriii:iii:i::,rvLq@huhao.Li
,,      ,, ,:ir7ir::,:::i;ir:::i:i::rSGGYri712:
:::  ,v7r:: ::rrv77:, ,, ,:i7rrii:::::, ir7ri7Lri
,     2OBBOi,iiir;r::        ,irriiii::,, ,iv7Luur:
,,     i78MBBi,:,:::,:,  :7FSL: ,iriii:::i::,,:rLqXv::
:      iuMMP: :,:::,:ii;2GY7OBB0viiii:i:iii:i:::iJqL;::
,     ::::i   ,,,,, ::LuBBu BBBBBErii:i:i:i:i:i:i:r77ii
,       :       , ,,:::rruBZ1MBBqi, :,,,:::,::::::iiriri:
,               ,,,,::::i:  @arqiao.       ,:,, ,:::ii;i7:
:,       rjujLYLi   ,,:::::,:::::::::,,   ,:i,:,,,,,::i:iii
::      BBBBBBBBB0,    ,,::: , ,:::::: ,      ,,,, ,,:::::::
i,  ,  ,8BMMBBBBBBi     ,,:,,     ,,, , ,   , , , :,::ii::i::
:      iZMOMOMBBM2::::::::::,,,,     ,,,,,,:,,,::::i:irr:i:::,
i   ,,:;u0MBMOG1L:::i::::::  ,,,::,   ,,, ::::::i:i:iirii:i:i:
:    ,iuUuuXUkFu7i:iii:i:::, :,:,: ::::::::i:i:::::iirr7iiri::
:     :rk@Yizero.i:::::, ,:ii:::::::i:::::i::,::::iirrriiiri::,
:      5BMBBBBBBSr:,::rv2kuii:::iii::,:i:,, , ,,:,:i@petermu.,
, :r50EZ8MBBBBGOBBBZP7::::i::,:::::,: :,:,::i;rrririiii::
:jujYY7LS0ujJL7r::,::i::,::::::::::::::iirirrrrrrr:ii:
,:  :@kevensun.:,:,,,::::i:i:::::,,::::::iir;ii;7v77;ii;i,
,,,     ,,:,::::::i:iiiii:i::::,, ::::iiiir@xingjief.r;7:i,
, , ,,,:,,::::::::iiiiiiiiii:,:,:::::::::iiir;ri7vL77rrirri::
:,, , ::::::::i:::i:::i:i::,,,,,:,::i:i:::iir;@Secbone.ii:::

*/

/**
* ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐
* │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐
* └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘
* ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐
* │~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │
* ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤
* │ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │
* ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │
* │ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │               │ 4 │ 5 │ 6 │   │
* ├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤
* │ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │
* ├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││
* │ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│
* └─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘
*/

/**
**************************************************************
*                                                            *
*   .=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-.       *
*    |                     ______                     |      *
*    |                  .-"      "-.                  |      *
*    |                 /            \                 |      *
*    |     _          |              |          _     |      *
*    |    ( \         |,  .-.  .-.  ,|         / )    |      *
*    |     > "=._     | )(__/  \__)( |     _.=" <     |      *
*    |    (_/"=._"=._ |/     /\     \| _.="_.="\_)    |      *
*    |           "=._"(_     ^^     _)"_.="           |      *
*    |               "=\__|IIIIII|__/="               |      *
*    |              _.="| \IIIIII/ |"=._              |      *
*    |    _     _.="_.="\          /"=._"=._     _    |      *
*    |   ( \_.="_.="     `--------`     "=._"=._/ )   |      *
*    |    > _.="                            "=._ <    |      *
*    |   (_/                                    \_)   |      *
*    |                                                |      *
*    '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='      *
*                                                            *
*           LASCIATE OGNI SPERANZA, VOI CH'ENTRATE           *
**************************************************************
*/

/**
* 頂頂頂頂頂頂頂頂頂　頂頂頂頂頂頂頂頂頂
* 頂頂頂頂頂頂頂　　　　　頂頂　　　　　
* 　　　頂頂　　　頂頂頂頂頂頂頂頂頂頂頂
* 　　　頂頂　　　頂頂頂頂頂頂頂頂頂頂頂
* 　　　頂頂　　　頂頂　　　　　　　頂頂
* 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
* 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
* 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
* 　　　頂頂　　　頂頂　　頂頂頂　　頂頂
* 　　　頂頂　　　　　　　頂頂頂　
* 　　　頂頂　　　　　　頂頂　頂頂　頂頂
* 　頂頂頂頂　　　頂頂頂頂頂　頂頂頂頂頂
* 　頂頂頂頂　　　頂頂頂頂　　　頂頂頂頂
*/


/*



.. .vr       
qBMBBBMBMY     
8BBBBBOBMBMv    
iMBMM5vOY:BMBBv        
.r,             OBM;   .: rBBBBBY     
vUL             7BB   .;7. LBMMBBM.   
.@Wwz.           :uvir .i:.iLMOMOBM..  
vv::r;             iY. ...rv,@arqiao. 
Li. i:             v:.::::7vOBBMBL.. 
,i7: vSUi,         :M7.:.,:u08OP. .  
.N2k5u1ju7,..     BMGiiL7   ,i,i.  
:rLjFYjvjLY7r::.  ;v  vr... rE8q;.:,, 
751jSLXPFu5uU@guohezou.,1vjY2E8@Yizero.    
BB:FMu rkM8Eq0PFjF15FZ0Xu15F25uuLuu25Gi.   
ivSvvXL    :v58ZOGZXF2UUkFSFkU1u125uUJUUZ,   
:@kevensun.      ,iY20GOXSUXkSuS2F5XXkUX5SEv.  
.:i0BMBMBBOOBMUi;,        ,;8PkFP5NkPXkFqPEqqkZu.  
.rqMqBBMOMMBMBBBM .           @kexianli.S11kFSU5q5   
.7BBOi1L1MM8BBBOMBB..,          8kqS52XkkU1Uqkk1kUEJ   
.;MBZ;iiMBMBMMOBBBu ,           1OkS1F1X5kPP112F51kU   
.rPY  OMBMBBBMBB2 ,.          rME5SSSFk1XPqFNkSUPZ,.
;;JuBML::r:.:.,,        SZPX0SXSP5kXGNP15UBr.
L,    :@sanshao.      :MNZqNXqSqXk2E0PSXPE .
viLBX.,,v8Bj. i:r7:,     2Zkqq0XXSNN0NOXXSXOU 
:r2. rMBGBMGi .7Y, 1i::i   vO0PMNNSXXEqP@Secbone.
.i1r. .jkY,    vE. iY....  20Fq0q5X5F1S2F22uuv1M; 


又看源码,看你妹妹呀!


*/


/*
__
,-~¨^  ^¨-,           _,
/          / ;^-._...,¨/
/          / /         /
/          / /         /
/          / /         /
/,.-:''-,_ / /         /
_,.-:--._ ^ ^:-._ __../
/^         / /¨:.._¨__.;
/          / /      ^  /
/          / /         /
/          / /         /
/_,.--:^-._/ /         /
^            ^¨¨-.___.:^  (R) - G33K

*/


/*
___                _
/ __|___  ___  __ _| |___
| (_ / _ \/ _ \/ _` |   -_)
\___\___/\___/\__, |_\___|
|___/

*/

/*
_.-"""""-._         _.-"""""-._         _.-"""""-._
,'           `.     ,'           `.     ,'           `.
/               \   /               \   /               \
|                 | |                 | |                 |
|                   |                   |                   |
|                   |                   |                   |
|             _.-"|"|"-._         _.-"|"|"-._             |
\          ,'   /   \   `.     ,'   /   \   `.          /
`.       /   ,'     `.   \   /   ,'     `.   \       ,'
`-..__|..-'         `-..|_|..-'         `-..|__..-'
|                   |                   |
|                   |                   |
|                 | |                 |
\               /   \               /
`.           ,'     `.           ,'
`-..___..-'         `-..___..-'

*/


/*
_
\"-._ _.--"~~"--._
\   "            ^.    ___
/                  \.-~_.-~
.-----'     /\/"\ /~-._      /
/  __      _/\-.__\L_.-/\     "-.
/.-"  \    ( ` \_o>"<o_/  \  .--._\
/'      \    \:     "     :/_/     "`
/  /\ "\    ~    /~"
\ I  \/]"-._ _.-"[
___ \|___/ ./    l   \___   ___
.--v~   "v` ( `-.__   __.-' ) ~v"   ~v--.
.-{   |     :   \_    "~"    _/   :     |   }-.
/   \  |           ~-.,___,.-~           |  /   \
]     \ |                                 | /     [
/\     \|     :                     :     |/     /\
/  ^._  _K.___,^                     ^.___,K_  _.^  \
/   /  "~/  "\                           /"  \~"  \   \
/   /    /     \ _          :          _ /     \    \   \
.^--./    /       Y___________l___________Y       \    \.--^.
[    \   /        |        [/    ]        |        \   /    ]
|     "v"         l________[____/]________j  -Row   }r"     /
}------t          /                       \       /`-.     /
|      |         Y                         Y     /    "-._/
}-----v'         |         :               |     7-.     /
|   |_|          |         l               |    / . "-._/
l  .[_]          :          \              :  r[]/_.  /
\_____]                     "--.             "-.____/

"Dragonball Z"
---Row

*/


/*
MMMMM
MMMMMM
MMMMMMM
MMMMMMMM     .
MMMMMMMMM
HMMMMMMMMMM
MMMMMMMMMMMM  M
MMMMMMMMMMMMM  M
MMMMMMMMMMMMM  M
MMMMMMMMMMMMM:
oMMMMMMMMMMMMMM
.MMMMMMMMMMMMMMo           MMMMMMMMMMMMMMM M
MMMMMMMMMMMMMMMMMMMMMMMMMMM      MMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMM.  oMMMMMMMMMMMMMMM.M
MMMMMMMMMMMMMMMMMMMMMMMMMMMM  MMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
oMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                     H
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                  .         MMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM              M       MMMMMM
.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM          M   MMMMMMMMMM
MM.      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM       M MMMMMMMMMMMM
MM    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM    .MMMMMMMMMMMMMM
MM  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MM MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
.MMMMMMMMM MMMMMMMMMMMMMMMMMMMMMMMM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
HMMMMMMMMMMMMMMMMMMMMM.MMMMMMMMM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMM MMM.oMMMMMMM..MMMMMMMMM:MMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMM MM..MMMMMMM...MMMMMMM. MMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMM ..MMMMMM...MMMMMM ..MMMMMMMMMMMMMMMMMMM
MMMMMMM:M.MMM.M.. MMMMM M..MMMMM...MMMMMMMMMMMMMMMMMM  MMM
MMMM. .M..MM.M...MMMMMM..MMMMM.. MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM .
MMMM..M....M.....:MMM .MMMMMM..MMMMMMM...MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MMM.M.. ...M......MM.MMMMM.......MHM.M  .MMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMM..MM. . MMM.....MMMMMM.M.....M ..MM..M MMMMMMMMMMMMMMMMMMM
.MMMMMHMM. ..MMMM. MMM............o..... . .MMMMMMMMMMMMMMM
MMM. M... .........................M..:.MMMMMMMMMMMM
oMMM............ .................M.M.MMMMMMMMM
.....MM........................ . MMMMMM
M.....M.....................o.MM.MMMMMMMM.
M........................M.. ...MMMMMMMMMMMMMo
:....MMM..............MMM..oMMMMMMM
M...MMM.............MMMMMMM
.............:MMMMMMMM
M..... MMM.....M
M M.............
................M
ooM.................MM  MoMMMMMoooM
MMoooM......................MoooooooH..oMM
MHooooMoM.....................MMooooooM........M
oooooooMoooM......... o........MoooooooM............
Mooooooooooo.......M.........Moooooooo:..............M
MooMoooooooooM...M........:Mooooooooooo:..............M
M..oooooooooooo .........Mooooooooooooooo..............M
M...Mooo:oooooooo.M....ooooooooooooooooooo..M...........M
...oooooMoooooooM..Mooooooooooooo:oooooooM.M...........M.
M...ooooooMoo:ooooMoooooooooooooHoooooooooH:M. ...........:
M..MoooooooMoooooooooooooooooo:ooooooMooooMoM..............M
M..ooooooooooMooooooooooooooHoooooooMooHooooM...............M
...ooooooooooooooooooo:MooooooooooooooMoMoooM................
M...oooooooooooooooooooooooooooooooooooooMooMM................M
...MooooooooooooooooooooooooooooooooooooooooMo ................
...MooooooooooooooooooooooooooooooooooooooooM M................M
M...ooooooooooooooooooooooooooooooooooooooooM   ................M
...MoooooooooooooooooooooooooooooooooooooooMM   .:...............
.....MooooooooooooooooooooooooooooooooooooMoo       .............M
M...... ooooooooooooooooooooooooooooooooooooM       M..............M
M........MooooMMM MM MM  MMMMMMMMMooooooooM         M...............M
.........HM     M:  MM :MMMMMM          M           M...............
M..........M     M   MoM M                           M................M
M.........:M  MoH  M M M MooooHoooMM.   M             M...............M
M..........Moooo MMooM    oooooMooooooooM              M..............H
M.........MooooM  Mooo  : ooooooMooooMoooM              M........ . .o.M
H..  .....ooooo   oooo  M MooooooooooooooM               M... MMMMMMMMMMM
MMMMMMMMMMooooM M oooo  .  ooooooMooooooooM              .MMMMMMMMMMMMMMM
MMMMMMMMMMooooH : ooooH    oooooooooooooooo               MMMMMMMMMMMMMMM
MMMMMMMMMMoooo    ooooM    Moooooooooooooooo              .MMMMMMMMMMMMMMM
MMMMMMMMMMoooo    ooooM    MooooooooooooooooM              MMMMMMMMMMMMMMM
MMMMMMMMMMoooM    ooooM     ooooooooooooooooo               MMMMMMMMMMM:M
MMMMMMMMMMoooM   MooooM     oooooooooooMoooooo               MH...........
. ......Mooo.   MooooM     oooooooooooooooooo              M............M
M.M......oooo    MooooM     Moooooooooooooooooo:           .........M.....
M.M.....Moooo    MooooM      ooooooooooooooooooM            .M............
.......MooooH    MooooM      oooooooooMoooooooooo          M..o...M..o....M
.o....HMooooM    MooooH      MooooooooMooooooooooM          .:M...M.......M
M..M.....MoooM    :oooo:    .MooooooooHooMoooooooooM         M M... ..oM.M
M...M.:.Mooo. MMMMooooo   oooooooooooMoooooooooooooM          ....M. M
M:M..o.Moooooooooooooo MooooooooooooooMooooooooooooM          .Mo
MooooooooooooooMooooooooooooMoMoooooooooooooo
Mooooooooooooooo:ooooooooooooooooooooooooooooo
ooooooooooooooooMooooooooooMoooooooooooooooooo
ooooooooooooooooMoooooooooooMooooooooooooooooHo
ooMooooooooooooooMoooooooooooooooooooooooooooMoM
MooMoooooooooooooo.ooooooooooooooooooooooooooo:oM
MoooooooooooooooooooooooooooooooooooooooooooooooM
MoooMooooooooooooooMooooooooooooooooooooooooooooo.
MoooMooooooooooooooMoooooooooooooooooooooooooMooooM
MooooooooooooooooooMoooooooooooooooooooooooooMoooooM
MooooMoooooooooooooMoooooooooooooooooooooooooMoHooooM
ooooooMooooooooooooooooooooooooooooooooooooooooMoMoooM
MooooooooooooooooooooMooooooooooooooooooooooooooMoooooH:
MoooooooMooooooooooooMoooooooooooooooooooooooooooooHoooM
MooooooooMoooooooooooMoooooooooooooooooooooooooMoooMooooM
Moooooooooooooooooooooooooooooooooooooooooooooo.oooMooooo
MoooooooooooooooooooooooooooooooooooooooooooooMoooooooooM
MooooooooooooooooooooMoooooooooooooooooooooooooooooooooM
MooooooooooooooooooooMHooooooooooooooooooooMoooo:ooooo
MMooooooooooooooooooMoMHoooooooooooooooooooooooMooooo
MMoooooooooooooooMMooo MMooooooooooooooooooooooooooM
MMMoooooooooooooMooooo  oooooooooooooooooooooMooooo
MooMMoooooooooMoooMMoM  ooooHooooooooooooooooMooooM
MooooMooooooMooooMoooM  MoooooMoooooooooooooMooooo
ooooooMMooooooooMooooM  MoooooooooMooooooooooooooM
HooooooMoooooooMooooM    HoooooooHooMooooooooooooo
oooMoooooooooHoooM         MoooooooooMoooooooooM
HooooooooooooHM             MooooooooMMoooooooM
MMMMMMMMMMMMMM                Moooooo:MooooHMM
MMMMMMM: ...                  MMMMMMMMMMMMMM
M............M                  MMMMMMMMM ....
M.MM..........                  M.............M
M ..............MM                 M..............
MMMMM............MMMM                 ..MMMMMMMM ....M
MMMMMMMMMMMMMMMMMMMMMMMM               MMMMMMMMMMMMM...M
.MMMMMMMMMMMMMMMMMMMMMMMMMM               MMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMM                MMMMMMMMMMMMMMMMMMM
:MMMMMMMMMMMMMMMMMMH                     MMMMMMMMMMMMMMMMMMM
By EBEN Jérôme                        MMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMM
HMMMMMM

*/



/*
quu..__
$$$b  `---.__
"$$b        `--.                          ___.---uuudP
`$$b           `.__.------.__     __.---'      $$$$"              .
"$b          -'            `-.-'            $$$"              .'|
".                                       d$"             _.'  |
`.   /                              ..."             .'     |
`./                           ..::-'            _.'       |
/                         .:::-'            .-'         .'
:                          ::''\          _.'            |
.' .-.             .-.           `.      .'               |
: /'$$|           .@"$\           `.   .'              _.-'
.'|$u$$|          |$$,$$|           |  <            _.-'
| `:$$:'          :$$$$$:           `.  `.       .-'
:                  `"--'             |    `-.     \
:##.       ==             .###.       `.      `.    `\
|##:                      :###:        |        >     >
|#'     `..'`..'          `###'        x:      /     /
\                                   xXX|     /    ./
\                                xXXX'|    /   ./
/`-.                                  `.  /   /
:    `-  ...........,                   | /  .'
|         ``:::::::'       .            |<    `.
|             ```          |           x| \ `.:``.
|                         .'    /'   xXX|  `:`M`M':.
|    |                    ;    /:' xXXX'|  -'MMMMM:'
`.  .'                   :    /:'       |-'MMMM.-'
|  |                   .'   /'        .'MMM.-'
`'`'                   :  ,'          |MMM<
|                     `'            |tbap\
\                                  :MM.-'
\                 |              .''
\.               `.            /
/     .:::::::.. :           /
|     .:::::::::::`.         /
|   .:::------------\       /
/   .''               >::'  /
`',:                 :    .'
`:.:'


*/



/*
11111111111111111111111111111111111111001111111111111111111111111
11111111111111111111111111111111111100011111111111111111111111111
11111111111111111111111111111111100001111111111111111111111111111
11111111111111111111111111111110000111111111111111111111111111111
11111111111111111111111111111000000111111111111111111111111111111
11111111111111111111111111100000011110001100000000000000011111111
11111111111111111100000000000000000000000000000000011111111111111
11111111111111110111000000000000000000000000000011111111111111111
11111111111111111111111000000000000000000000000000000000111111111
11111111111111111110000000000000000000000000000000111111111111111
11111111111111111100011100000000000000000000000000000111111111111
11111111111111100000110000000000011000000000000000000011111111111
11111111111111000000000000000100111100000000000001100000111111111
11111111110000000000000000001110111110000000000000111000011111111
11111111000000000000000000011111111100000000000000011110001111111
11111110000000011111111111111111111100000000000000001111100111111
11111111000001111111111111111111110000000000000000001111111111111
11111111110111111111111111111100000000000000000000000111111111111
11111111111111110000000000000000000000000000000000000111111111111
11111111111111111100000000000000000000000000001100000111111111111
11111111111111000000000000000000000000000000111100000111111111111
11111111111000000000000000000000000000000001111110000111111111111
11111111100000000000000000000000000000001111111110000111111111111
11111110000000000000000000000000000000111111111110000111111111111
11111100000000000000000001110000001111111111111110001111111111111
11111000000000000000011111111111111111111111111110011111111111111
11110000000000000001111111111111111100111111111111111111111111111
11100000000000000011111111111111111111100001111111111111111111111
11100000000001000111111111111111111111111000001111111111111111111
11000000000001100111111111111111111111111110000000111111111111111
11000000000000111011111111111100011111000011100000001111111111111
11000000000000011111111111111111000111110000000000000011111111111
11000000000000000011111111111111000000000000000000000000111111111
11001000000000000000001111111110000000000000000000000000001111111
11100110000000000001111111110000000000000000111000000000000111111
11110110000000000000000000000000000000000111111111110000000011111
11111110000000000000000000000000000000001111111111111100000001111
11111110000010000000000000000001100000000111011111111110000001111
11111111000111110000000000000111110000000000111111111110110000111
11111110001111111100010000000001111100000111111111111111110000111
11111110001111111111111110000000111111100000000111111111111000111
11111111001111111111111111111000000111111111111111111111111100011
11111111101111111111111111111110000111111111111111111111111001111
11111111111111111111111111111110001111111111111111111111100111111
11111111111111111111111111111111001111111111111111111111001111111
11111111111111111111111111111111100111111111111111111111111111111
11111111111111111111111111111111110111111111111111111111111111111


*/



/*
.....'',;;::cccllllllllllllcccc:::;;,,,''...'',,'..
..';cldkO00KXNNNNXXXKK000OOkkkkkxxxxxddoooddddddxxxxkkkkOO0XXKx:.
.':ok0KXXXNXK0kxolc:;;,,,,,,,,,,,;;,,,''''''',,''..              .'lOXKd'
.,lx00Oxl:,'............''''''...................    ...,;;'.             .oKXd.
.ckKKkc'...'',:::;,'.........'',;;::::;,'..........'',;;;,'.. .';;'.           'kNKc.
.:kXXk:.    ..       ..................          .............,:c:'...;:'.         .dNNx.
:0NKd,          .....''',,,,''..               ',...........',,,'',,::,...,,.        .dNNx.
.xXd.         .:;'..         ..,'             .;,.               ...,,'';;'. ...       .oNNo
.0K.         .;.              ;'              ';                      .'...'.           .oXX:
.oNO.         .                 ,.              .     ..',::ccc:;,..     ..                lXX:
.dNX:               ......       ;.                'cxOKK0OXWWWWWWWNX0kc.                    :KXd.
.l0N0;             ;d0KKKKKXK0ko:...              .l0X0xc,...lXWWWWWWWWKO0Kx'                   ,ONKo.
.lKNKl...'......'. .dXWN0kkk0NWWWWWN0o.            :KN0;.  .,cokXWWNNNNWNKkxONK: .,:c:.      .';;;;:lk0XXx;
:KN0l';ll:'.         .,:lodxxkO00KXNWWWX000k.       oXNx;:okKX0kdl:::;'',;coxkkd, ...'. ...'''.......',:lxKO:.
oNNk,;c,'',.                      ...;xNNOc,.         ,d0X0xc,.     .dOd,           ..;dOKXK00000Ox:.   ..''dKO,
'KW0,:,.,:..,oxkkkdl;'.                'KK'              ..           .dXX0o:'....,:oOXNN0d;.'. ..,lOKd.   .. ;KXl.
;XNd,;  ;. l00kxoooxKXKx:..ld:         ;KK'                             .:dkO000000Okxl;.   c0;      :KK;   .  ;XXc
'XXdc.  :. ..    '' 'kNNNKKKk,      .,dKNO.                                   ....       .'c0NO'      :X0.  ,.  xN0.
.kNOc'  ,.      .00. ..''...      .l0X0d;.             'dOkxo;...                    .;okKXK0KNXx;.   .0X:  ,.  lNX'
,KKdl  .c,    .dNK,            .;xXWKc.                .;:coOXO,,'.......       .,lx0XXOo;...oNWNXKk:.'KX;  '   dNX.
:XXkc'....  .dNWXl        .';l0NXNKl.          ,lxkkkxo' .cK0.          ..;lx0XNX0xc.     ,0Nx'.','.kXo  .,  ,KNx.
cXXd,,;:, .oXWNNKo'    .'..  .'.'dKk;        .cooollox;.xXXl     ..,cdOKXXX00NXc.      'oKWK'     ;k:  .l. ,0Nk.
cXNx.  . ,KWX0NNNXOl'.           .o0Ooldk;            .:c;.':lxOKKK0xo:,.. ;XX:   .,lOXWWXd.      . .':,.lKXd.
lXNo    cXWWWXooNWNXKko;'..       .lk0x;       ...,:ldk0KXNNOo:,..       ,OWNOxO0KXXNWNO,        ....'l0Xk,
.dNK.   oNWWNo.cXK;;oOXNNXK0kxdolllllooooddxk00KKKK0kdoc:c0No        .'ckXWWWNXkc,;kNKl.          .,kXXk,
'KXc  .dNWWX;.xNk.  .kNO::lodxkOXWN0OkxdlcxNKl,..        oN0'..,:ox0XNWWNNWXo.  ,ONO'           .o0Xk;
.ONo    oNWWN0xXWK, .oNKc       .ONx.      ;X0.          .:XNKKNNWWWWNKkl;kNk. .cKXo.           .ON0;
.xNd   cNWWWWWWWWKOkKNXxl:,'...;0Xo'.....'lXK;...',:lxk0KNWWWWNNKOd:..   lXKclON0:            .xNk.
.dXd   ;XWWWWWWWWWWWWWWWWWWNNNNNWWNNNNNNNNNWWNNNNNNWWWWWNXKNNk;..        .dNWWXd.             cXO.
.xXo   .ONWNWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWNNK0ko:'..OXo          'l0NXx,              :KK,
.OXc    :XNk0NWXKNWWWWWWWWWWWWWWWWWWWWWNNNX00NNx:'..       lXKc.     'lONN0l.              .oXK:
.KX;    .dNKoON0;lXNkcld0NXo::cd0NNO:;,,'.. .0Xc            lXXo..'l0NNKd,.              .c0Nk,
:XK.     .xNX0NKc.cXXl  ;KXl    .dN0.       .0No            .xNXOKNXOo,.               .l0Xk;.
.dXk.      .lKWN0d::OWK;  lXXc    .OX:       .ONx.     . .,cdk0XNXOd;.   .'''....;c:'..;xKXx,
.0No         .:dOKNNNWNKOxkXWXo:,,;ONk;,,,,,;c0NXOxxkO0XXNXKOdc,.  ..;::,...;lol;..:xKXOl.
,XX:             ..';cldxkOO0KKKXXXXXXXXXXKKKKK00Okxdol:;'..   .';::,..':llc,..'lkKXkc.
:NX'    .     ''            ..................             .,;:;,',;ccc;'..'lkKX0d;.
lNK.   .;      ,lc,.         ................        ..,,;;;;;;:::,....,lkKX0d:.
.oN0.    .'.      .;ccc;,'....              ....'',;;;;;;;;;;'..   .;oOXX0d:.
.dN0.      .;;,..       ....                ..''''''''....     .:dOKKko;.
lNK'         ..,;::;;,'.........................           .;d0X0kc'.
.xXO'                                                 .;oOK0x:.
.cKKo.                                    .,:oxkkkxk0K0xc'.
.oKKkc,.                         .';cok0XNNNX0Oxoc,.
.;d0XX0kdlc:;,,,',,,;;:clodkO0KK0Okdl:,'..
.,coxO0KXXXXXXXKK0OOxdoc:,..
...

*/


/*

/88888888888888888888888888\
|88888888888888888888888888/
|~~____~~~~~~~~~"""""""""|
/ \_________/"""""""""""""\
/  |              \         \
/   |  88    88     \         \
/    |  88    88      \         \
/    /                  \        |
/     |   ________        \       |
\     |   \______/        /       |
/"\         \     \____________     /        |
| |__________\_        |  |        /        /
/""""\           \_------'  '-------/       --
\____/,___________\                 -------/
------*            |                    \
||               |                     \
||               |                 ^    \
||               |                | \    \
||               |                |  \    \
||               |                |   \    \
\|              /                /"""\/    /
-------------                |    |    /
|\--_                        \____/___/
|   |\-_                       |
|   |   \_                     |
|   |     \                    |
|   |      \_                  |
|   |        ----___           |
|   |               \----------|
/   |                     |     ----------""\
/"\--"--_|                     |               |  \
|_______/                      \______________/    )
\___/
*/

/*
*     ,MMM8&&&.            *
MMMM88&&&&&    .
MMMM88&&&&&&&
*           MMM88&&&&&&&&
MMM88&&&&&&&&
'MMM88&&&&&&'
'MMM8&&&'      *    
/\/|_    __/\\
/    -\  /-   ~\  .              '
\    =_YT_ =   /
/==*(`    `\ ~ \
/     \     /    `\
|     |     ) ~   (
/       \   /     ~ \
\       /   \~     ~/
jgs_/\_/\__  _/_/\_/\__~__/_/\_/\_/\_/\_/\_
|  |  |  | ) ) |  |  | ((  |  |  |  |  |  |
|  |  |  |( (  |  |  |  \\ |  |  |  |  |  |
|  |  |  | )_) |  |  |  |))|  |  |  |  |  |     Joan Stark
|  |  |  |  |  |  |  |  (/ |  |  |  |  |  |
|  |  |  |  |  |  |  |  |  |  |  |  |  |  |
*/


/*
............HIIMHIMHMMHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:.............
...........MMMI:MII:MIHMHMMMMMHMMMMIMMMIMMMMMMMMMMMMMM.............
.........:MMMI:M::HM::MIHHHM:IM:MHM:IMH:IMMMIIMMMHMMMH:............
........:MMMHHM::MMI:HH:MM:I:M:MMMH:IMH:IMM::MH:MM:MM:M............
.......MMMMHMM:MMIMHMII:MM:IIIM:MHMIMMM:MMIIH::MH:HM:M............
...... :MIMMMMMMMMMHMMHMM:HHMHMMMMIMHMMMMHMHMIHIHM::MMI............
.......M:MMMMMMMMMMMMHMMMMMMMMHMMMMMMMMMMHMMMHMMIMHMMMM:...........
.......HHMMMMMMMMMMMMMMMMIMMMM.MMHMMMMHMMMMMMMMMMMIMHMMI...........
........MMMIMMMMMMMMMMIHMIMIM:.M:HMM:MIHMMMMMMMMMMMMMMMI...........
........MM.MMMMMMMMMMMH:MMMHM:.M.:MM.M.HMMMHMMMMMMMMMMMI...........
........MM.MMMMMMMMMMH::M.M.M..M..MM:M.IIMH:MMMMMMMMMMMI...........
........M:.MM:MMMMMMM:.I..:.I..H..IM:I.I.M.IMHMMMMMMMMMI...........
........M..MMMHMMMMM.:HI:HHH......H....II..:MMMMMMMHMM:...........
...........MM.MIMMMM.:H: .::I........ ...:IH:.MMMMMM:MMI...........
...........:H..MMMIM.M.:...:I.........: ..::HHHMMMMIMMMH...........
............H..IMM:I:..I:..:..........I:..:I:::MMMMMMMMM...........
...............MMH::I...I:::..........III.I::MMMHMMMMMMM...........
..............MMMHMII.. ..............:MI:I.HIIIHM:HMMMM...........
.............:MMMMIM::...........:......:H..:II:MHIMMMMM...........
.............MMMMMMMMM......................I.MMMHHMMMMM:..........
............MMMMH:MMMMM........:.:.........:MMMMMMMMMMMMI..........
...........MMMMMMHMMMMMMM.. .............:MMMMMMMMMMMMMMM..........
........ .IMMMMMMMMMMMMMMMM............:MMMMMMMMMHMMMMMMM..........
..........MMMMMMMMMMMMMMMMMI:.......:IHMMMMMMMMM::MMMMMMM..........
.........MMMMMMMIMMMMMMMMMMH:::I:I:.::HMMMMMMMMMHMMMMMMMMI.........
........HMMMMMMM:MMMMMMMMMMI:::::::..:HMMMMMMMMIMMMMMMMMMM.........
.......IMMMMM..MI:MMMMMMMMM::::..:::::.MMMMMMMMMMMMMMMMMMM ........
......:MMMM....:MMHMMMMMM:::::.....::.:.MMMMMMMHMMMMMMMMMM.........
......MMI....:::IMMMMI:.:::::.....:I::::::HMMMHIM::::::MMMH........
.....MM.....:::IMIMMM:.......:....::::::::IMMHMM:I:::I:::MM .......
....MMM.....:I:.MIHMMM........:...:::::::HMMMMI:::::....::M:.......
...:MM:........:MMMHMM..................IMMMMM::...........M.......
...MMM........:::MMMMM......:..........:HMMMMM::...................
..:MM:.......:::::MMMM........... .. .::MMM:HM::.............:.....
..MMM........:::::MMMMM:I..HHIMHMHHHM :IMMHIMH::.............I.....
*/



/*

?$$  "$N        $$$  ^#$            $              d$*  "$d       '$$F  "$r   
'$$   $$k       9$$    '           d$N            $$F     *        $$>    *   
'$$   $$F       9$$  :             $$$r          $$$               $$>  f     
'$$   $$        9$$.e$            . #$$          $$$               $$L.$F     
'$$**#"         9$$ ^$            f  $$L         $$$               $$> #F     
'$$             9$$  '           .   '$$         $$$               $$>  F     
'$$             9$$     "        P""""$$N        '$$r     J        $$>    x   
{$$             9$$   .$              '$$         ^$$.   d$        $$r   dF   
""""           `""""""""       '""    """"           """"         """"""""    

.....               d*##$.                               
zP"""""$e.           $"    $o                              
4$       '$          $"      $                              
'$        '$        J$       $F                             
'b        $k       $>       $                              
$k        $r     J$       d$                              
'$         $     $"       $~                              
'$        "$   '$E       $                               
$         $L   $"      $F ...                           
$.       4B   $      $$$*"""*b                         
'$        $.  $$     $$      $F                        
"$       R$  $F     $"      $                         
$k      ?$ u*     dF      .$                         
^$.      $$"     z$      u$$$$e                      
#$b             $E.dW@e$"    ?$                     
#$           .o$$# d$$$$c    ?F                    
$      .d$$#" . zo$>   #$r .uF                    
$L .u$*"      $&$$$k   .$$d$$F                    
$$"            ""^"$$$P"$P9$                     
JP              .o$$$$u:$P $$                     
$          ..ue$"      ""  $"                     
d$          $F              $                      
$$     ....udE             4B                      
#$    """"` $r            @$                      
^$L        '$            $F                      
RN        4N           $                       
*$b                  d$                       
$$k                 $F                       
$$b                $F                       
$""               $F                       
'$                $                        
$L               $                        
'$               $                        
$               $                        
"   
*/


/*


Einstein
.+~                :xx++::
:`. -          .!!X!~"?!`~!~!. :-:.
{             .!!!H":.~ ::+!~~!!!~ `%X.
'             ~~!M!!>!!X?!!!!!!!!!!...!~.
{!:!MM!~:XM!!!!!!.:!..~ !.  `{
{: `   :~ .:{~!!M!XXHM!!!X!XXHtMMHHHX!  ~ ~
~~~~{' ~!!!:!!!!!XM!!M!!!XHMMMRMSXXX!!!!!!:  {`
`{  {::!!!!!X!X?M!!M!!XMMMMXXMMMM??!!!!!?!:~{
: '~~~{!!!XMMH!!XMXMXHHXXXXM!!!!MMMMSXXXX!!!!!!!~
:    ::`~!!!MMMMXXXtMMMMMMMMMMMHX!!!!!!HMMMMMX!!!!!: ~
'~:~!!!!!MMMMMMMMMMMMMMMMMMMMMMXXX!!!M??MMMM!!X!!i:
{~{!!!!!XMMMMMMMMMMMM8M8MMMMM8MMMMMXX!!!!!!!!X!?t?!:
~:~~!!!!?MMMMMM@M@RMRRR$@@MMRMRMMMMMMXSX!!!XMMMX{?X!
:XX {!!XHMMMM88MM88BR$M$$$$8@8RN88MMMMMMMMHXX?MMMMMX!!!
.:X! {XMSM8M@@$$$$$$$$$$$$$$$$$$$B8R$8MMMMMMMMMMMMMMMMX!X
:!?! !?XMMMMM8$$$$8$$$$$$$$$$$$$$BBR$$MMM@MMMMMMMMMMMMMM!!X
~{!!~ {!!XMMMB$$$$$$$$$$$$$$$$$$$$$$$$MMR$8MR$MMMMMMMMMMMMM!?!:
:~~~ !:X!XMM8$$$$$$$$$$$$$$$$$$$$$$$RR$$MMMMR8NMMMMMMMMMMMMM{!`-
~:{!:~`~':!:HMM8N$$$$$$$$$$$$$$$$$$$$$$$$$8MRMM8R$MRMMMMMMMMRMMMX!
!X!``~~   :~XM?SMM$B$$$$$$$$$$$$$$$$$$$$$$BR$$MMM$@R$M$MMMMMM$MMMMX?L
X~.      : `!!!MM#$RR$$$$$$$$$$$$$$$$$R$$$$$R$M$MMRRRM8MMMMMMM$$MMMM!?:
! ~ {~  !! !!~`` :!!MR$$$$$$$$$$RMM!?!??RR?#R8$M$MMMRM$RMMMM8MM$MMM!M!:>
: ' >!~ '!!  !   .!XMM8$$$$$@$$$R888HMM!!XXHWX$8$RM$MR5$8MMMMR$$@MMM!!!{ ~
!  ' !  ~!! :!:XXHXMMMR$$$$$$$$$$$$$$$$8$$$$8$$$MMR$M$$$MMMMMM$$$MMM!!!!
~{!!!  !!! !!HMMMMMMMM$$$$$$$$$$$$$$$$$$$$$$$$$$MMM$M$$MM8MMMR$$MMXX!!!!/:`
~!!!  !!! !XMMMMMMMMMMR$$$$$$$$$$$$R$RRR$$$$$$$MMMM$RM$MM8MM$$$M8MMMX!!!!:
!~ ~  !!~ XMMM%!!!XMMX?M$$$$$$$$B$MMSXXXH?MR$$8MMMM$$@$8$M$B$$$$B$MMMX!!!!
~!    !! 'XMM?~~!!!MMMX!M$$$$$$MRMMM?!%MMMH!R$MMMMMM$$$MM$8$$$$$$MR@M!!!!!
{>    !!  !Mf x@#"~!t?M~!$$$$$RMMM?Xb@!~`??MS$M@MMM@RMRMMM$$$$$$RMMMMM!!!!
!    '!~ {!!:!?M   !@!M{XM$$R5M$8MMM$! -XXXMMRMBMMM$RMMM@$R$BR$MMMMX??!X!!
!    '!  !!X!!!?::xH!HM:MM$RM8M$RHMMMX...XMMMMM$RMMRRMMMMMMM8MMMMMMMMX!!X!
!     ~  !!?:::!!!MXMR~!MMMRMM8MMMMMS!!M?XXMMMMM$$M$M$RMMMM8$RMMMMMMMM%X!!
~     ~  !~~X!!XHMMM?~ XM$MMMMRMMMMMM@MMMMMMMMMM$8@MMMMMMMMRMMMMM?!MMM%HX!
!!!!XSMMXXMM .MMMMMMMM$$$BB8MMM@MMMMMMMR$RMMMMMMMMMMMMMMMXX!?H!XX
XHXMMMMMMMM!.XMMMMMMMMMR$$$8M$$$$$M@88MMMMMMMMMMMMMMM!XMMMXX!!!XM
~   {!MMMMMMMMRM:XMMMMMMMMMM8R$$$$$$$$$$$$$$$NMMMMMMMM?!MM!M8MXX!!/t!M
'   ~HMMMMMMMMM~!MM8@8MMM!MM$$8$$$$$$$$$$$$$$8MMMMMMM!!XMMMM$8MR!MX!MM
'MMMMMMMMMM'MM$$$$$MMXMXM$$$$$$$$$$$$$$$$RMMMMMMM!!MMM$$$$MMMMM{!M
'MMMMMMMMM!'MM$$$$$RMMMMMM$$$$$$$$$$$$$$$MMM!MMMX!!MM$$$$$M$$M$M!M
!MMMMMM$M! !MR$$$RMM8$8MXM8$$$$$$$$$$$$NMMM!MMM!!!?MRR$$RXM$$MR!M
!M?XMM$$M.{ !MMMMMMSUSRMXM$8R$$$$$$$$$$#$MM!MMM!X!t8$M$MMMHMRMMX$
,-,   '!!!MM$RMSMX:.?!XMHRR$RM88$$$8M$$$$$R$$$$8MM!MMXMH!M$$RMMMMRNMMX!$
-'`    '!!!MMMMMMMMMM8$RMM8MBMRRMR8RMMM$$$$8$8$$$MMXMMMMM!MR$MM!M?MMMMMM$
'XX!MMMMMMM@RMM$MM@$$BM$$$M8MMMMR$$$$@$$$$MM!MMMMXX$MRM!XH!!??XMMM
`!!!M?MHMMM$RMMMR@$$$$MR@MMMM8MMMM$$$$$$$WMM!MMMM!M$RMM!!.MM!%M?~!
!!!!!!MMMMBMM$$RRMMMR8MMMMMRMMMMM8$$$$$$$MM?MMMM!f#RM~    `~!!!~!
~!!HX!!~!?MM?MMM??MM?MMMMMMMMMRMMMM$$$$$MMM!MMMM!!
'!!!MX!:`~~`~~!~~!!!!XM!!!?!?MMMM8$$$$$MMMMXMMM!!
!!~M@MX.. {!!X!!!!XHMHX!!``!XMMMB$MM$$B$M!MMM!!
!!!?MRMM!:!XHMHMMMMMMMM!  X!SMMX$$MM$$$RMXMMM~
!M!MMMM>!XMMMMMMMMXMM!!:!MM$MMMBRM$$$$8MMMM~
`?H!M$R>'MMMM?MMM!MM6!X!XM$$$MM$MM$$$$MX$f
`MXM$8X MMMMMMM!!MM!!!!XM$$$MM$MM$$$RX@"
~M?$MM !MMMMXM!!MM!!!XMMM$$$8$XM$$RM!`
!XMMM !MMMMXX!XM!!!HMMMM$$$$RH$$M!~
'M?MM `?MMXMM!XM!XMMMMM$$$$$RM$$#
`>MMk ~MMHM!XM!XMMM$$$$$$BRM$M"
~`?M. !M?MXM!X$$@M$$$$$$RMM#
`!M  !!MM!X8$$$RM$$$$MM#`
!% `~~~X8$$$$8M$$RR#`
!!x:xH$$$$$$$R$R*`
~!?MMMMRRRM@M#`       
`~???MMM?M"`
*/

/*

:';t)/!||||(//L+)'(-\\/ddjWWW#######WmKK(\!(/-|J=/\\t/!-/\!_L\) 
|-!/(!-)\L\)/!\5(!.!LWW###################WK/|!\\\\/!;\/\T\/((\ 
|!'//\//(-!t\Y/\L!m#####M####################WLt\\!)\/J-//)/;t\ 
--/-.\.\/\.!)///m######K#######################WK!/!-( )-!,|/\ 
//,\--`--!-/\(q#######DD##########################L\\\\-!!//!\\ 
-.-!\'!!\-\/:W########N############################W,).'-.-/\-' 
!.\!-!-!`!-!W#######P|+~**@@@#######################W/,/'\-/,\7 
--`,-- -/.:W###*P!'          \`Z8#####################;,\\`,\,\
`.'.'\`-.-d##5'-           -- '-:V@##########W#########_\-!-\\-
`, -,.'/,G##K- '               - )7KM###################\-----/
- '-  --:##@;                    -!ZZ###################W! \'!- 
'-.`- G###|.                    `,D8K###################|/-.-/ 
-' ,-//###@)                      -)ZWMW##################\` _\
- ' .:Yd###!                     `-!(K5K##################|(/L| 
- :\G###Z-                    ` ! -;55ZZ#################)(4) 
. -!W####!\                     `  ' !-tVG################XNVZ 
tt####@-.                        `  ')(W################D)8@ 
)8#####\                         .-`-/KW#################KD# 
||Z####W!-              .::,\.. -,;\bZKK######8#K#########(#8 
KN8#####( ,:!/GG_      d4KW8ZKW#WWK#W#88#######W##########WK# 
)/8K###K#W#WP~~~T4(    dW##7'___L#M####MM8W###W############bM8 
\!48#K####8##W*###WY;   WRob+~~######*ff/\NM8###############WW# 
.\\KW###W#,~t' !*~!',  -M@)    `~`,),' '.`K#################@KW 
.'8M###### -'..j/Z''    @//-  ,,\\+\'    :|W######M###########8 
:\#8#K###D              \!`             !:Z8###8@#####8W#W###8M 
q8W5######             `!-             `-)8##################M8 
8WZ8#M####-             /  .          .\tK############@######ZJ 
#W#@K###W#|              //           \\tW@###@K##W##W###K###Wm 
##8#M#8###P-            -=/,         /;D8W##############@###W## 
#8###M@####\-      ,   _)jJ;        -((WKK#####W####W##K######K 
###W@K##K##);     `\..KW##WK       )X)KW#M##W###MW##@#W######8# 
#K#W####@#@@/;-     ~M####M\    ,.\\=)D8W##W###W##########8W##@ 
####MW######(`\\'     PPK((.:|/!-\-/)8XN@WMK#######W##MK#@##### 
##8##MK#W#@#b!--\)L_. .(ZLWbW#\'- ,-N|/KM#######W###@########W# 
##KW###K#W###/-  !``~~Yff*N5f -' -.\))KK#######MK##W###M8W#W### 
#W###K@K######J--    .._dd/;)/- !//)NK#8W##########8########M#K 
##8W#K###W#####W!.   `YY\)\\)\7(-)4dW#8#@###K#W#######8######## 
M####8##K#KW###W#/,       '-\\//)88W#M#@#K##M###@##M#8##@#W#8#M 
ZW#W#M#K##########m       -)!/LtWW#W##@#W#####KW#######W###K### 
K##W#####W#M#8#####KL   .-//dD##8W#K######8##########MK###W##M# 
tN#W##W#W#M##########bb4dKW#@##W##K####MK####8###########W##### 
)NM#8W##@###@##############@##@##8##K#W####M##K##K#@###8##M#### 
(tMM###W##M8####@####@###@#########@####8W##8W################M 
tNZ##K###W####@#####8###/4N##8#W##W##M#8#MK#M8#K######W######## 
M/K@8###M@###M##########|!t*Z#N####8##M8Z@ZZ#M###@#W#####K###W# 
WVd4M######@############D,\`(+KKZD#8WK#5@84VZ#WM############W## 
K5WM8#8W#W########8######,,-!/))ZK5@K4)@+(/XV/Z###@###W###M#### 
+8WN@##@K##W###W#########b.-.\!||\X(5)Z/7\\\t5/K########W###### 
8M8###@###@##8#########KDbt! !.-!t`(-\\!.\/.\!ZdG###W#MW###G### 
~~~~~`~~~~~~~~~~~~~~~~'~` ''  ' ` ` ' '   `   ``~`~`~`~~~~'~~~~  

*/

/*

#
##
###
####
#####
#######
#######
########
########
#########
##########
############
##############
################
################
##############
##############                                              ####
##############                                           #####
##############                                      #######
##############                                 ###########
###############                              #############
################                           ##############
#################      #                  ################
##################     ##    #           #################
####################   ###   ##          #################
################  ########          #################
################  #######         ###################
#######################       #####################
#####################       ###################
############################################
###########################################
##########################################
########################################
########################################
######################################
######################################
##########################      #####
###  ###################           ##
##    ###############
#     ##  ##########
##    ###
###
##
#
*/


/*

LL             A
LL            A A
LL           AA AA
LL          AA   AA
LL          AAAAAAA
LL         AA     AA
LL         AA     AA
LLLLLLLLL  AA     AA
LLLLLLLLL  AA     AA
TTTTTTTTTT   OOOOOOO   UU     UU  RRRRRRR              EEEEEEEEE  IIIIIIIIII  FFFFFFFFF  FFFFFFFFF  EEEEEEEEE  LL
TTTTTTTT  OOOOOOOOO  UU     UU  RRRRRRRR             EEEEEEEEE  IIIIIIIIII  FFFFFFFFF  FFFFFFFFF  EEEEEEEEE  LL
TT      OO     OO  UU     UU  RR     RR            EE             II      FF         FF         EE         LL
TT      OO     OO  UU     UU  RR     RR            EE             II      FF         FF         EE         LL
TT      OO     OO  UU     UU  RRRRRRRR             EEEEEEEE       II      FFFFFFFF   FFFFFFFF   EEEEEEEE   LL
TT      OO     OO  UU     UU  RR  RR               EE             II      FF         FF         EE         LL
TT      OO     OO  UU     UU  RR   RR              EE             II      FF         FF         EE         LL
TT      OOOOOOOOO  UUUUUUUUU  RR    RR             EEEEEEEEE  IIIIIIIIII  FF         FF         EEEEEEEEE  LLLLLLLLL
TT       OOOOOOO    UUUUUUU   RR     RR            EEEEEEEEE  IIIIIIIIII  FF         FF         EEEEEEEEE  LLLLLLLLL
.
1
1
1
M
M
M
M
\M/
. ' M ` .
\##-#####-##/
\# ##### #/
###############
###############
\ ! ! ! ! ! /
)! ! ! ! !(
+---------+
+! ! ! ! !+
+----*----+
+`. .':`. .'+
+ .^. : .^. +
+:...:*:...:+
+`. .':`. .'+
+ .^. : .^. +
+:...:*:...:+
+`. .':`. .'+
+. ^. : .^ .+
+:....:*:....:+
+` .  ':`  . '+
+  .^. : .^.  +
+:....:*:....:+
+` .. ':` .. '+
+. '` .:. '` .+
+:....:*:....:+
+ `. .':`. .' +
+   X  :  X   +
+.'  `.:.'  `.+
+:......*......:+
+`.   .':`.   .'+
+   X   :   X   +
+ .' `. : .' `. +
+.......*.......+
+` . . ':` . . '+
+   X   :   X   +
+ '   ` : '   ` +
+../########....+
+`/#########\ .'+
+  ############   +
+ '############`  +
+:.......*.......:+
+ ` .  ' : `  . ' +
+    X   :   X    +
+ .'   `.:.'   `. +
+:.......*.......:+
+`      ':`      '+
+  `   '  :  `   '  +
+    X   : :   X    +
+  '   ` : : '   `  +
+:.......*.*.......:+
+`      ': :`      '+
+ `   '  : :  `   ' +
+   X   : X :   X   +
+  '   ` :' `: '   `  +
+:.......*...*.......:+
+`      ':` ':`      '+
+ `   '  : X :  `   ' +
+   X   :     :   X   +
+ '   ` :/   \: '   ` +
+:.......*.....*.......:+
+`      ':`   ':`      '+
+ `   '  : `.' :  `   ' +
+    X   :  ' `  :   X    +
+  '   ` :'     `: '   `  +
+:.......*.......*.......:+
+ `      ':`     ':`      ' +
+  ` . '  :  `.'  :  ` . '  +
+    ' `  :   ' `   :  ' `    +
+. '    ` : '     ` : '    ` .+
+..........*.........*..........+
+  ###########################  +
+  ###########################  +
+   ###########################   +
#########################################
###########################################
\   1   1   1   1   1   1   1   1   1   /
)  1   1   1   1   1   1   1   1   1  (
+-----:-----+-------------+-----:-----+
+     :     +             +     :     +
*------*-----*-------------*-----*------*
+XXXXXXXXXXX+XXXXXXXXXXXXXXX+XXXXXXXXXXX+
*-----*-----*---------------*-----*-----*
+ `.   :  . '+               +` .  :   .' +
+    . : '   +               +   ` : .    +
+    . *.    +                 +    .* .    +
+ . '  : `.  +                 +  .' :  ` . +
*:......*....:*                 *:....*......:*
+ `.   :   . '+                 +` .   :   .' +
+     `.:. '  +                   +  ` .:.'     +
+   . '* `.   +                   +   .' *` .   +
+ . '   :    `.+                   +.'    :   ` . +
*:.....*.......*                   *.......*.....:*
+  ` .. :  .. ' +                   + ` ..  : .. '  +
+     . *'     +                     +     `* .     +
+  .. ' :   ` . +                     + . '   : ` ..  +
*.:....*.......:*                     *:.......*....:.*
+   ` ..: . - '  +                     +  ` - . :.. '   +
+    .. * ..    +                       +    .. * ..    +
-------------------------------------------------------------------
1 +:       :      +:       :       :       :+      :       :+ 1
1+ :       :      +:       :       :       :+      :       : +1
###################################################################
1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1   1
+---------------------------------------------------------------+
+! . ! . ! . ! . !+. ! . ! . ! . ! . ! . ! . ! .+! . ! . ! . ! . !+
+:!: :!: :!: :!: :!+ :!: :!: :!: :!: :!: :!: :!: +!: :!: :!: :!: :!:+
+.!.:.!.:.!.:.!.:.!+:.!.:.!.:.!.:.!.:.!.:.!.:.!.:+!.:.!.:.!.:.!.:.!.+
+XXXXXXXXXXXXXXXXXX+\     \  ..-#######-..  /     /+XXXXXXXXXXXXXXXXXX+
*-------------------* \    .-' \  1 1 1  / `-.    / *-------------------*
+  ` .    : ..  '  +   \.-' \   .-------.   / `-./   +  `  .. :    . '  +
+.......:.*:........+ .-' \  .-''         ``-.  / `-. +........:*.:.......+
+    .  '  : ` .    +\:  \  -'                 `-  /  :/+    . ' :  `  .    +
+..:.......:.....:..+/ \ .-'                     `-. / \+..:.....:.......:..+
+    ` .   :    .  ' + \.'                           `./ + `  .    :   . '    +
+.........:.*..:.....+  /                               \  +.....:..*.:.........+
+     .  '  :   ` .   + /                                 \ +   . '   :  `  .     +
+...:......:........:+ /                                   \ +:........:..........+
+    `  .  :  .  '    +/                                     \+    `  .  :  .  '    +
+...........*.........+                                         +.........*...........+
+     .  '  :   `  .   +                                         +   .  '   :  `  .     +
+...:.......:.........:+                                           +:.........:.......:...+
+    `  .    :   .   '  +                                           +  `   .   :    .  '    +
+..........:.*.:........+                                             +........:.*.:..........+
+     .   '  :   `  .    +                                             +    .  '   :  `   .     +
+...:.........:.........:+                                               +:.........:.........:...+
+   `   .     :     .   ' +                                               + `   .     :     .   '   +
+...........:.*..:........+                                                 +........:..*.:...........+
+      .   '  :   `  .     +                                                 +     .  '   :  `   .      +
+...:.........:..........:.+                                                   +.:..........:.........:...+
+     `  .     :      .  ' +                                                     + `  .      :     .  '     +
+            ` *  - '      +                                                       +      ` -  * '            +
-----------------------------------------------------------------------------------------------------------------
*/

/*


=   ==   => /                                                             
+# = #= +  $=>>  =                                                         
=+%>=$%=/#%+%>%+/ +>/+>+=                                                      
>=+$%#+#>%$#%##$=+$$/+$+=  >=                                                   
>>/%#%###########+#######>==+#>  /                                                
=%+//>$%#%#########################%%#/==              ==               /#$>           
+$+##+#########%##################$$%+/=              /%%%%%%###%###%%%%%%%           
==/+$#########=  =$#######>>#######$##>=                 #%>==##+ %##>>/%/             
//=/%#$#########                +######$%%++$+              ###++##/ +##++###>            
=>/+$############=                #########%%>=              ##$>>+$/ /$/>>##$             
/$##############%=             %######$#$+>=/+             ##$//### %##++##%             
=>>+%$###############%/>     =/$############$+%/=         ++++++++###+###++++###/          
=>/%%$$#########################################/          =/>>%>###+/#$>>>>>%%>>=          
==>+%#######################################$%/>=            $# %##  $##  >>=##>           
=>+##$$######################################++>=           $### +##  >#+ >## %##>          
/+++$#####################################$%$%/+>          $$+  =###########= %+           
>>>++####################################+>/+%=                                           
>>%#####################################$%/=                                            
>$##################################/+>/==>                                            
/#%/>################################+>//                       =>///>                  
=   %+$%##$######################$$//+%%>>                   +##$$#%%###$=              
= >$#/$$#####################$+=                       $#$=  >#    >##$             
>>/+=##############%/+#+$##%+>                     =##=    ##      ##+            
+%%###%%##%%%#% > +//= //%                     ##>    +#%      ###            
>  +>=+>+=%>=##$=> = =                          ##=   %##       ###            
=   =   #>//                               ###>/##%       $##=            
>//=                =$                                    #####>      /###=             
/%+             =%     >/+++/>                          =>     >+###$>               
=$%          >%  +###$+>====>=                              ++/>                   
/#>       >%/##$>                                                                
=#+     >###/                                                                   
=#%   >#%=                                           ++>   /%/                 
=#+  #                                        >=====###>==$##>==+$/           
%#>+/                                        %%%%%%###%%%###%%%%%%=          
###                                          >%%%%###%%%###%###=            
/#%                                           ==>##==##$=/##===>            
#/                                        /$$$$$##$$###$###$$###/          
/+    //=                                      =##  ##% >##                
>%  %+                                      $$$$##$$###$###$###            
# #+                                      >>>>=====##$=====>$$>           
$+#                                       /%%%%%%%%###%%%%%%%%+           
#%                                                ##+                    
>$                                                ##>                    
#                                                                       
/+                                                                      
#                                                                      
$                                                                      
%                                                                      
=   

*/

/*

iEid
iDDDDDDDd
iDDDDDDDDDD
EDDi         iDLINUSTDISSB
DDDDDDi    iDDDDDDDE DDDDD
DDiDDDDDDiDDDDDDDE   DDDDD
DD  EDDDDDDDDDDD     DDDDD
DD   iDDDDDDDDE      DDDDD
DD iDDDDDiDDDDDDi    DDDDD
DDDDDDE   iDDDDDDDiE DDDDD
dDDDE        iFUCKAPPLEDDD
iDDDDDDDDDD
iDDDDDDD
iDid

嫁人要嫁程序员,呆萌单纯可爱多!

*/


/*
请仔细看最后一行的某些英文字母。


LEEIIO01       CHAOS0      MADE!    00000000             00001    10000    0000
000 1001     000  000      000     0  001 0              000      00001  0000
000  000     000  000      000        00                 001      10000  0000
000  000     000  100      000        00                 000      10 0000 100
000  000     000  000      000        001                000      10 1001 100
000  00      100  001      000        001       001      000      00  00  000
F000100        U00001      C0001      K0001      000     G0001    F001     W00!



*/

/*


　◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆　
　　◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆　
　　　　◆◆◆　　◆◆　　　　  ◆◆◆　
　　　　　　◆◆◆　　◆◆◆　◆◆◆　　◆◆◆　
　　　　　　　　◆◆◆　◆◆◆　　◆◆◆◆　 ◆◆◆　
　　　　　　　　　　◆◆◆◆◆◆　　　　◆◆◆◆◆◆◆　
　　　　　　　　　　　　◆◆◆◆◆　　　　　　◆◆◆◆◆◆　
　　　　　　　　　　　　　　◆◆◆◆　　　　　　　◆◆◆◆◆　
　　　　　　　　　　　　　　　　◆◆◆　　　　　　　　 ◆◆◆　
　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆◆◆◆◆◆◆　  ◆◆◆　
　　　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆　　　◆◆◆　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆　　　◆◆◆　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆　　　◆◆◆　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆　　　◆◆◆　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆　　　◆◆◆　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　◆◆◆　◆◆◆　　　◆◆◆　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　◆◆◆◆　　　　　　　　　◆◆◆　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*/
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//    ...．．∵ ∴★．∴∵∴ ╭ ╯╭ ╯╭ ╯╭ ╯∴∵∴∵∴ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//    ．☆．∵∴∵．∴∵∴▍▍ ▍▍ ▍▍ ▍▍☆ ★∵∴ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//    ▍．∴∵∴∵．∴▅███████████☆ ★∵ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//    ◥█▅▅▅▅███▅█▅█▅█▅█▅█▅███◤ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//    ． ◥███████████████████◤ 我们的征途是星辰大海
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//    .．.．◥████████████████■◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//                                 _(\_/) 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//                               ,((((^`\
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//                               ((((  (6 \ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//                            ,((((( ,    \
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//         ,,,_              ,(((((  /"._  ,`,
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//        ((((\\ ,...       ,((((   /    `-.-'
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//        )))  ;'    `"'"'""((((   (我是代马      
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//      (((  /            (((      \
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//        )) |                      |
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//       ((  |        .       '     |
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//       ))  \     _ '      `t   ,.')
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//       (   |   y;- -,-""'"-.\   \/  
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//      )   / ./  ) /         `\  \
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//          |./   ( (           / /'
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//          ||     \\          //'|
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//          ||      \\       _//'||
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//          ||       ))     |_/  ||
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//          \_\     |_/          ||
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//          `'"                  \_\
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//   ╭┘└┘└╮
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  └┐．．┌┘────╮
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  ╭┴──┤          ├╮
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  │ｏ　ｏ│          │ ●
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  ╰─┬─╯          │
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//      代码就是牛 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　/////////////////////////////////////////////////////////////////////////////
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　// ┌────────────────┐
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　// │▉▉▉▉▉▉▉▉▉▉▉　 99.9%│
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　// └────────────────┘
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//   开发进度
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　/////////////////////////////////////////////////////////////////////////////
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//              ◢◤◢◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　　　　◢████◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　　⊙███████◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　●████████◤         齐心协力
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　▼　　～◥███◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　▲▃▃◢███　●　　●　　●　　●　　●　　●　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　　　　　███／█　／█　／█　／█　／█　／█　　　◢◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　　　　　███████████████████████◤
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  ＃〓○〓〓〓〓〓○〓〓〓〓〓〓○〓〓〓〓〓○〓＃ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　↓　　　　　↓　　　　　　↓　　　　　↓ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　☆★☆　　　☆★☆　　　　☆★☆　　　☆★☆ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  ☆　神　☆　☆　来　☆　　☆　之　☆　☆　笔　☆ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　☆★☆　　　☆★☆　　　　☆★☆　　　☆★☆ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　↓　　　　　↓　　　　　　↓　　　　　↓ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　//  　　※　　　　　※　　　　　　※　　　　　※ 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　/**
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　* http://www.freebuf.com/
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*           _.._        ,------------.
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*        ,'      `.    ( We want you! )
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*       /  __) __` \    `-,----------'
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*      (  (`-`(-')  ) _.-'
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*      /)  \  = /  (
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     /'    |--' .  \
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    (  ,---|  `-.)__`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     )(  `-.,--'   _`-.
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    '/,'          (  Uu",
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     (_       ,    `/,-' )
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     `.__,  : `-'/  /`--'
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*       |     `--'  |
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*       `   `-._   /
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*        \        (
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*        /\ .      \.  freebuf
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*       / |` \     ,-\
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*      /  \| .)   /   \
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     ( ,'|\    ,'     :
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     | \,`.`--"/      }
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     `,'    \  |,'    /
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    / "-._   `-/      |
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    "-.   "-.,'|     ;
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*   /        _/["---'""]
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  :        /  |"-     '
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  '           |      /
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*              `      |
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*/
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　/** 
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　* https://campus.alibaba.com/
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                                 `:::::::::::,
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                             `::;:::::::;:::::::,  `
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                          `::;;:::::::@@@@;:::::::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                        ,:::::::::::::@    #@':::::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                      :::::::::::::::'@@      @;::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                    ::::::::::::'@@@@'```      .+:::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                  ::::::::::;@@@#.              ,:::,
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*                .::::::::+@#@`                   ::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*               :::::::+@@'                       ::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*             `:::::'@@:                         `:::.
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*            ,::::@@:  `                         ::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*           ;::::::@                            .:::;
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*          :;:::::;@`        `                  :::;
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*         :::::::::@`        @                 ;::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*        :::::::::#`          @`              ,::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*       :::::::::@`         +@ @             .::::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*      .::::::'@@`       `@@'  @             ::::,
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*      :::::::++@@@@@@@@@@.                 ::::;
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     ;:::::::+,   `..`                    :::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    ,::::::::',                          :::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    :::::::::+,                         :::::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*   :::::::::+@.                        ,::::.`                     `,
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*   ::::::;;@+                         .::;::                     `;
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  :::::::@@                          `:::;:                   `::``
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  ::::::#@                           ;::::                  .::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  :::::;@                           :::::`               .;::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  :::::@                           `:;:::            `::::;
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  :::::#                           :::::.        `,;:::::
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  ::::::                    `      ::::::,.,::::::::::.
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*  ,::::::`              .::        ::::::::::::::::;`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*   ;::::::::,````.,:::::,          ::::::::::::::.
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*    :::::::::::::::::: `           `::::::::::`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*     `::::::::::::,                  .:::.
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*         `..`
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　*/
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　```
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　
