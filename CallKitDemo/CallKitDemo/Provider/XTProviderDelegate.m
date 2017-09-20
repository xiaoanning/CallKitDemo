//
//  XTProviderDelegate.m
//  CallKitDemo
//
//  Created by 安宁 on 2017/9/18.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "XTProviderDelegate.h"

@interface XTProviderDelegate ()<CXProviderDelegate>

@end

@implementation XTProviderDelegate

#pragma mark - *************************************** 初始化
-(instancetype)initWithCallManager:(XTSpeakerboxCallManager *)callManager
{
    self = [super init];
    
    if (self)
    {
        _callManager = callManager ;
        _provider = [[CXProvider alloc]initWithConfiguration:[self getProviderConfiguration]];
        [_provider setDelegate:self queue:dispatch_get_main_queue()];
    }
    
    return self ;
}

#pragma mark - *************************************** 封装

#pragma mark 创建配置CXProviderConfiguration
-(CXProviderConfiguration *)getProviderConfiguration
{
    CXProviderConfiguration * config = [[CXProviderConfiguration alloc]initWithLocalizedName:@"xiao"];
    [config setSupportsVideo:YES];
    [config setMaximumCallGroups:1];
    [config setMaximumCallsPerCallGroup:1];
    [config setSupportedHandleTypes:[NSSet setWithArray:@[@(CXHandleTypePhoneNumber)]]];
    
    UIImage * image = [UIImage imageNamed:@"IconMask.png"];
    if (image)
    {
        [config setIconTemplateImageData:UIImagePNGRepresentation(image)];
    }else
    {
        NSLog(@"%s %@   项目中无此图片",__func__,@(__LINE__));
    }
    
    [config setRingtoneSound:@"Ringtone.caf"];
    
    return config ;
}

#pragma mark CXCallUpdate
-(void)reportIncomingCallWithUUID:(NSUUID *)UUID completion:(void (^)(NSError *_Nullable error))completion hasVideo:(BOOL)hasVideo handle:(NSString *)handle
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
    CXCallUpdate * callUpdate = [[CXCallUpdate alloc]init];
    [callUpdate setRemoteHandle:[[CXHandle alloc]initWithType:CXHandleTypePhoneNumber value:handle]] ;
    [callUpdate setHasVideo:hasVideo];
    
    [_provider reportNewIncomingCallWithUUID:UUID update:callUpdate completion:^(NSError * _Nullable error) {
        
    }];
}

#pragma mark *************************************** 代理
-(void)reportNewIncomingCallWithUUID:(NSUUID *)UUID completion:(void (^)(NSError *_Nullable error))completion hasVideo:(BOOL)hasVideo handle:(NSString *)handle
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
    [self reportIncomingCallWithUUID:UUID completion:completion hasVideo:hasVideo handle:handle];
}


//provider重置 要清空所有资源
- (void)providerDidReset:(CXProvider *)provider
{
    NSLog(@"%@ %@ %s",[self class],@(__LINE__),__func__);
    
}

- (void)provider:(CXProvider *)provider performStartCallAction:(CXStartCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
}
- (void)provider:(CXProvider *)provider performAnswerCallAction:(CXAnswerCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
    [_callManager startCallWithHandle:@"000" video:NO];
}
- (void)provider:(CXProvider *)provider performEndCallAction:(CXEndCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
}
- (void)provider:(CXProvider *)provider performSetHeldCallAction:(CXSetHeldCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
}
- (void)provider:(CXProvider *)provider performSetMutedCallAction:(CXSetMutedCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
}
- (void)provider:(CXProvider *)provider performSetGroupCallAction:(CXSetGroupCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
}
- (void)provider:(CXProvider *)provider performPlayDTMFCallAction:(CXPlayDTMFCallAction *)action
{
    NSLog(@"%s %@ %s",__FILE__,@(__LINE__),__func__);
    
}


@end
