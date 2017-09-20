//
//  XTSpeakerboxCallManager.h
//  CallKitDemo
//
//  Created by 安宁 on 2017/9/18.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import <CallKit/CallKit.h>

@interface XTSpeakerboxCallManager : NSObject

-(void)startCallWithHandle:(NSString *)handle video:(BOOL)video ;

@end
