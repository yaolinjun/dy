#import <UIKit/UIKit.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/dy.plist"


inline bool GetPrefBool(NSString *key)
{
return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}
//以上开关设置h

//水印
%hook AWEMediaDownloadConfigCommon
-  (bool)shouldForbidWartermark {
if(GetPrefBool(@"gbsy")) {
 return false;
}
return %orig;
}
%end

//视频秒数
%hook HTSVideoConfig
- (long long)standardVideoMaxSeconds {
if(GetPrefBool(@"spms")) {
return 300;
}
return %orig;
}
%end
%hook AWEUserModel
-(bool)authorizedToDownload {
    if(GetPrefBool(@"yxxz")) {
    return true;
    }
    return %orig;
    }
    %end
//风险文件下载
%hook AWEAwemeModel
-(bool) preventDownload {
    if(GetPrefBool(@"yxxz")) {
    return false;
    }
    return %orig;
    }
    %end
//头号英雄
%hook AWEIMF2BannerView
-(void) p_setupUI {
    if(GetPrefBool(@"thyx")) {
    return;
    }
    return %orig;
    }
    %end
 //右下角数字
%hook AWEIMUnreadDotView
-(void) updateWithCount:(long long)arg1 {
    if(GetPrefBool(@"yxjsz")) {
    return;
    }
    return %orig;
    }
    %end
 //红包横幅
%hook AWEProfileHeaderViewController
-(void) updateHeaderViewHeightWithLinkModel:(id)arg1 {
    if(GetPrefBool(@"hbhf")) {
    return;
    }
    return %orig;
    }
    %end
//关闭左下角购物弹窗
%hook AWEFeedGoodsSlideCardView
-(void) updateSlideCardViewWithDataSource:(id) arg1 targetPromotionID:(id)arg2 {
    if(GetPrefBool(@"gwc")) {
    return;
    }
    return %orig;
    }
    %end
    //关闭广告
%hook TTAdSplashManager
- (bool)displaySplashOnWindow:(id)arg1 splashShowType:(long long)arg2 isHotLaunch:(bool)arg3 {
    if(GetPrefBool(@"gbgg")) {
    return 0;
    }
    return %orig;
    }
    %end
    %hook TTAdSplashModel
    -  (void)setRequestTimeInterval:(float)arg1 {
        if(GetPrefBool(@"gbgg")) {
        return;
        }
        return %orig;
        }
        %end

 //精简分享
%hook AWEAwemeShareViewController
-(void) setViewHeight:(double)arg1 {
    if(GetPrefBool(@"jjfx")) {
    return;
    }
    return %orig;
    }
    %end
    %hook HTSShareActionSystem
    -(bool) isPlatformAvailable:(long long)arg1 {
        if(GetPrefBool(@"jjfx")) {
        return false;
        }
        return %orig;
        }
        %end
 //自动播放
%hook AWEFeedGuideManager
- (bool)enableAutoplay {
if(GetPrefBool(@"zdbf")) {
return true;
}
return %orig;
}
%end
//屏蔽微信
%hook HTSShareActionWechat
-(bool) isPlatformAvailable:(long long)arg1 {
if(GetPrefBool(@"pbwx")) {
return false;
}
return %orig;
}
%end
//屏蔽qq
%hook HTSShareActionQQ
-(bool) isPlatformAvailable:(long long)arg1 {
if(GetPrefBool(@"pbqq")) {
return false;
}
return %orig;
}
%end
//多闪下载
%hook AWEIMNewTransferXBannerView
-(void) p_setupUI {
if(GetPrefBool(@"dsxz")) {
return;
}
return %orig;
}
%end
//底部高度
%hook AWETabBar
-(void) setDesiredHeight:(double)arg1 arg1{
if(GetPrefBool(@"dbgd")) {
return;
}
return %orig;
}
%end
//青少年弹窗
%hook AWEUIAlertView
-  (void)show {
if(GetPrefBool(@"tc2")) {
return;
}
return %orig;
}
%end
//显示状态栏
%hook AWEFeedRootViewController
-(bool) prefersStatusBarHidden {
if(GetPrefBool(@"ztl")) {
return false;
}
return %orig;
}
%end
//纯净模式
%hook AWEFeedTableViewController
-(bool) pureMode {
if(GetPrefBool(@"cjms")) {
return true;
}
return %orig;
}
%end
//循环播放
%hook AWEPlayVideoViewController
-(bool) playNotRepeated {
if(GetPrefBool(@"xhbf")) {
return true;
}
return %orig;
}
%end
%hook AWEVideoPlayerController
-(bool) repeated {
if(GetPrefBool(@"xhbf")) {
return true;
}
return %orig;
}
%end
//双击点赞
%hook AWEAwemePlayInteractionViewController
-(void) onVideoPlayerViewDoubleClicked:(id)arg1 {
if(GetPrefBool(@"sjdz")) {
return;
}
return %orig;
}
%end
//同款广告
%hook AWEAdPromptViewManager
-(void) setModel:(id)arg1 {
if(GetPrefBool(@"tkgg")) {
return;
}
return %orig;
}
%end
//链接广告
%hook AWEAwemeModel
-(void) setAdLinkType:(long long)arg1 {
if(GetPrefBool(@"tkgg")) {
return;
}
return %orig;
}
%end
//关闭流量提醒
%hook BTDReachabilityManager
- (bool)isReachableViaWiFi {
if(GetPrefBool(@"lltx")) {
return true;
}
return %orig;
}
%end
