#import <libpowercuts/libpowercuts.h>

@interface ErrorHandlingExampleAction : PCAction
@end
@implementation ErrorHandlingExampleAction
-(void) performActionForIdentifier:(NSString*)identifier withParameters:(NSDictionary*)parameters success:(void (^)(id _Nullable output))success fail:(void (^)(NSString *error))fail {
    if (parameters && parameters[@"requiredParameterExample"] && ((NSString*)parameters[@"requiredParameterExample"]).length > 0) {
        //Parameters are correct, do what you want here
        NSLog(@"Performing action with identifier %@, parameters %@", identifier, parameters);
        //Once you're done, notify the success (passing nil if no output)
        success(nil);
    } else {
        //Parameters are incorrect, notify the failure with explanation.
        fail(@"You must provide correct parameter!");
    }
}
-(NSString*) nameForIdentifier:(NSString*)identifier {
    return @"Error handling example action";
}
-(NSString*) descriptionSummaryForIdentifier:(NSString*)identifier {
    return @"Just an example action.";
}
-(NSArray*) parametersDefinitionForIdentifier:(NSString*)identifier {
    return @[
        @{
            @"type" : @"text",
            @"key" : @"requiredParameterExample",
            @"label" : @"Required parameter",
            @"placeholder" : @"Put some text here!"
        }
    ];
}
@end


%ctor {
    [[PowercutsManager sharedInstance] registerActionWithIdentifier:@"com.anthopak.powercuts.action.errorHandlingExample" action:[ErrorHandlingExampleAction new]];
}