//
//  AppDelegate.m
//  AsteroomTest
//
//  Created by Sunny Ladkani on 8/12/21.
//

#import "AppDelegate.h"
#import <CleverTapSDK/CleverTap.h>
#import "SEGCleverTapIntegrationFactory.h"
#import <CleverTapSDK/CleverTapInstanceConfig.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
        [[NSNotificationCenter defaultCenter] addObserver:self
            selector:@selector(profileInitialized:)
            name:CleverTapProfileDidInitializeNotification
            object:nil];

    
        [CleverTap setDebugLevel:CleverTapLogDebug];
        
        SEGAnalyticsConfiguration *configuration = [SEGAnalyticsConfiguration configurationWithWriteKey:@"dcUHEYgeOcQOTWXWXquMCW0pws0KHuE7"];
    
        [configuration use:[SEGCleverTapIntegrationFactory instance]];
        
        // Enable this to record certain application events automatically!
        configuration.trackApplicationLifecycleEvents = YES;
        
        // Enable this to record screen views automatically!
        configuration.recordScreenViews = YES;
        
        // Automatic Push Notification Tracking
        configuration.trackPushNotifications = YES;
        [SEGAnalytics setupWithConfiguration:configuration];

        //[[CleverTap sharedInstance] enableDeviceNetworkInfoReporting:YES];

    // Override point for customization after application launch.
    return YES;
}


- (void) profileInitialized: (NSNotification *) notification {
    [[CleverTap sharedInstance] enableDeviceNetworkInfoReporting:YES];
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
