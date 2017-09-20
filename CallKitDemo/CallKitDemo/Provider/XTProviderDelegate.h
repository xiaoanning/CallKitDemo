//
//  XTProviderDelegate.h
//  CallKitDemo
//
//  Created by 安宁 on 2017/9/18.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import <CallKit/CallKit.h>
#import <UIKit/UIKit.h>
#import "XTSpeakerboxCallManager.h"

@interface XTProviderDelegate : NSObject

@property ( nonatomic , strong ) CXProvider * provider ;

@property ( nonatomic , strong ) XTSpeakerboxCallManager * callManager ;


-(instancetype)initWithCallManager:(XTSpeakerboxCallManager *)callManager ;

-(void)reportIncomingCallWithUUID:(NSUUID *)UUID completion:(void (^)(NSError *_Nullable error))completion hasVideo:(BOOL)hasVideo handle:(NSString *)handle ;

@end
