#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FlutterViewController *controller = (FlutterViewController *) self.window.rootViewController;
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"MyChannel" binaryMessenger:controller];
    
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        NSString *from = call.arguments[@"from"];
        if([@"myNativeFunction" isEqualToString:call.method]){
            NSString *messageToFlutter = [self myNativeFunction];
            messageToFlutter = [NSString stringWithFormat:@"%@, Back to %@", messageToFlutter, from];
            result(messageToFlutter);
        }
    }];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

-(NSString *) myNativeFunction{
    return @"Message from iOS";
}

@end
