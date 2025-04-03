#import "EmptyViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>

@implementation EmptyViewController

- (instancetype)initWithProps:(NSDictionary *)props {
  self = [super init];
  if (self) {
    NSURL *jsBundleURL = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
    if (!jsBundleURL) {
      NSLog(@"Could not find main.jsbundle");
      return nil;
    }

    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsBundleURL
                                                        moduleName:@"empty"  // 👈 AppRegistry name
                                                 initialProperties:props
                                                     launchOptions:nil];
    self.view = rootView;
  }
  return self;
}

@end
