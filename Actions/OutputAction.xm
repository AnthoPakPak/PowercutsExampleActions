#import <libpowercuts/libpowercuts.h>

@interface OutputExampleAction : PCAction
@end
@implementation OutputExampleAction
-(void) performActionForIdentifier:(NSString*)identifier withParameters:(NSDictionary*)parameters success:(void (^)(id _Nullable output))success fail:(void (^)(NSString *error))fail {
    //Do what you want here
    NSLog(@"Performing action with identifier %@, parameters %@", identifier, parameters);

    //Send output once you're done. You MUST either call success() or fail() block.
    success(@"Output value");
}
-(NSString*) nameForIdentifier:(NSString*)identifier {
    return @"Output example action";
}
-(NSString*) descriptionSummaryForIdentifier:(NSString*)identifier {
    return @"Just an example action.";
}
-(NSDictionary*) outputDefinitionForIdentifier:(NSString*)identifier {
    return @{
        @"type" : @"text",
        @"name" : @"Example output text"
    };
}
@end


%ctor {
    [[PowercutsManager sharedInstance] registerActionWithIdentifier:@"com.anthopak.powercuts.action.outputExample" action:[OutputExampleAction new]];
}