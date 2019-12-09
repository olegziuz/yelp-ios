//
//  YLPAppDelegate.m
//  YelpAPI
//
//  Created by David Chen on 12/07/2015.
//  Copyright (c) 2015 David Chen. All rights reserved.
//

#import "YLPAppDelegate.h"

@import YelpAPI;

#define API_KEY @"uZLWxD2Mm-3IxbdIPlyRfC13w4-fMwbc3Il65PwdVhuz78y1lQKRn1B4hYI3xAMANglWgGrN7a8hZdNv7zM2byZ2WLmCIk-ZQzXErZoCk4vdMQTkESdsWEI0yZfrXXYx"

@interface YLPAppDelegate ()
@property (strong, nonatomic) YLPClient *client;
@end

@implementation YLPAppDelegate

+ (YLPClient *)sharedClient {
    YLPAppDelegate *appDelegate = (YLPAppDelegate *)[UIApplication sharedApplication].delegate;
    return appDelegate.client;
}

#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.client = [[YLPClient alloc] initWithAPIKey:API_KEY];

    return YES;
}

@end
