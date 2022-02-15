#import <libpowercuts/libpowercuts.h>

@interface SimpleExampleAction : PCAction
@end
@implementation SimpleExampleAction
-(void) performActionForIdentifier:(NSString*)identifier {
    //Do what you want here
    NSLog(@"Performing action with identifier %@", identifier);
}
-(NSString*) nameForIdentifier:(NSString*)identifier {
    return @"Simple example action";
}
-(NSString*) descriptionSummaryForIdentifier:(NSString*)identifier {
    return @"Just an example action.";
}
@end


%ctor {
    [[PowercutsManager sharedInstance] registerActionWithIdentifier:@"com.anthopak.powercuts.action.simpleExample" action:[SimpleExampleAction new]];
}