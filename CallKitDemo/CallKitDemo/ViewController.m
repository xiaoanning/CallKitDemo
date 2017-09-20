//
//  ViewController.m
//  CallKitDemo
//
//  Created by 安宁 on 2017/9/13.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "ViewController.h"


#import "XTSpeakerboxCallManager.h"
#import "XTProviderDelegate.h"

@interface ViewController ()

@property ( nonatomic , strong ) XTProviderDelegate * providerDelegete ;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _providerDelegete = [[XTProviderDelegate alloc]initWithCallManager:[[XTSpeakerboxCallManager alloc]init]];


    [_providerDelegete reportIncomingCallWithUUID:[NSUUID UUID] completion:^(NSError * _Nullable error) {
        
    } hasVideo:NO handle:@"1234"];
    
    
}



@end
