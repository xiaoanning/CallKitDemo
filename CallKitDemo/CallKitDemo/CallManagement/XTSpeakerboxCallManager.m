//
//  XTSpeakerboxCallManager.m
//  CallKitDemo
//
//  Created by 安宁 on 2017/9/18.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "XTSpeakerboxCallManager.h"

@implementation XTSpeakerboxCallManager

-(void)startCallWithHandle:(NSString *)handle video:(BOOL)video
{
    CXHandle * handleObject = [[CXHandle alloc]initWithType:CXHandleTypePhoneNumber value:handle];
    CXStartCallAction * startCallAction = [[CXStartCallAction alloc]initWithCallUUID:[NSUUID UUID] handle:handleObject];
    startCallAction.video = video ;
    
    CXTransaction * transaction = [[CXTransaction alloc]init];
    [transaction addAction:startCallAction];
    
    [self requestTransaction:transaction];
    
}

-(void)requestTransaction:(CXTransaction *)transaction
{
    CXCallController * callController = [[CXCallController alloc]initWithQueue:dispatch_get_main_queue()];
    [callController requestTransaction:transaction completion:^(NSError * _Nullable error) {
        
        NSLog(@"requestTransaction  completion %@",error);
        
    }];
}

@end
