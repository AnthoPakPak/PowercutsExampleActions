#import <libpowercuts/libpowercuts.h>

@interface AssociatedToAppExampleAction : PCAction
@end
@implementation AssociatedToAppExampleAction
-(void) performActionForIdentifier:(NSString*)identifier {
    //Do what you want here
    NSLog(@"Performing action with identifier %@", identifier);
}
-(NSString*) nameForIdentifier:(NSString*)identifier {
    return @"Associated to app example action";
}
-(NSString*) descriptionSummaryForIdentifier:(NSString*)identifier {
    return @"Just an example action.";
}
//Provide the app related to your action. You can either pass the bundle id of an existing app installed on the device, or pass the bundle id of a fake app you've manually registered in PowercutsManager.
-(NSString*) associatedAppBundleIdForIdentifier:(NSString*)identifier {
    // return @"com.apple.MobileSMS"; //an app installed on user device
    return @"com.anthopak.exampleTweak"; //a fake app registered to PowercutsManager
}
@end


%ctor {
    //Register a fake application for your tweak
    PCApplication *exampleTweakFakeApp = [[PCApplication alloc] initWithBundleId:@"com.anthopak.exampleTweak" name:@"ExampleTweak" iconPath:@"/Library/PreferenceBundles/ExampleTweakPrefs.bundle/icon.png"];
    [[PowercutsManager sharedInstance] registerFakeApplication:exampleTweakFakeApp];

    //Register your action (don't forget to override associatedAppBundleIdForIdentifier: and return the bundle id)
    [[PowercutsManager sharedInstance] registerActionWithIdentifier:@"com.anthopak.powercuts.action.associatedToAppExample" action:[AssociatedToAppExampleAction new]];
}