//
//  AppDelegate.m
//  CallKitDemo
//
//  Created by 安宁 on 2017/9/13.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "AppDelegate.h"
#import <PushKit/PushKit.h>
#import <CoreAudioKit/CoreAudioKit.h>

@interface AppDelegate ()<PKPushRegistryDelegate>

@property (strong, nonatomic) PKPushRegistry * pushRegistry;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _pushRegistry = [[PKPushRegistry alloc]initWithQueue:dispatch_get_main_queue()];
    _pushRegistry.delegate = self ;
    _pushRegistry.desiredPushTypes = [[NSSet alloc]initWithObjects:PKPushTypeVoIP, nil];
    

    return YES;
}


- (void)pushRegistry:(PKPushRegistry *)registry didUpdatePushCredentials:(PKPushCredentials *)credentials forType:(PKPushType)type
{
    NSLog(@"%s %@",__func__, credentials.token);
}

- (void)pushRegistry:(PKPushRegistry *)registry didReceiveIncomingPushWithPayload:(PKPushPayload *)payload forType:(PKPushType)type
{
    NSLog(@"%s",__func__);
}



@end
