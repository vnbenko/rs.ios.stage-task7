//
//  AppDelegate.m
//  rs.ios.stage-task7
//
//  Created by Meraki on 05.07.2021.
//

#import "AppDelegate.h"
#import "StartViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    StartViewController *startVC = [[StartViewController alloc] initWithNibName:@"StartViewController" bundle:nil];
    [window setRootViewController:startVC];
    self.window = window;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
