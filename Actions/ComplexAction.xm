#import <libpowercuts/libpowercuts.h>

@interface ComplexExampleAction : PCAction
@end
@implementation ComplexExampleAction
-(void) performActionForIdentifier:(NSString*)identifier withParameters:(NSDictionary*)parameters success:(void (^)(id _Nullable output))success fail:(void (^)(NSString *error))fail {
    if (parameters && parameters[@"requiredParameterExample"] && ((NSString*)parameters[@"requiredParameterExample"]).length > 0) {
        //Parameters are correct, do what you want here
        NSLog(@"Performing action with identifier %@, parameters %@", identifier, parameters);
        //Once you're done, notify the success (passing nil if no output)
        NSString *output = [NSString stringWithFormat:@"Here's what you've written: %@", parameters[@"requiredParameterExample"]];
        success(output);
    } else {
        //Parameters are incorrect, notify the failure with explanation.
        fail(@"You must provide correct parameter!");
    }
}
-(NSString*) nameForIdentifier:(NSString*)identifier {
    return @"Complex example action";
}
-(NSString*) descriptionSummaryForIdentifier:(NSString*)identifier {
    return @"Just an example action.";
}
//Provide additional keywords to your action
-(NSArray<NSString*>*) keywordsForIdentifier:(NSString*)identifier {
    return @[@"improve", @"your", @"SEO"];
}
//Provide the app related to your action
-(NSString*) associatedAppBundleIdForIdentifier:(NSString*)identifier {
    return @"com.apple.MobileSMS";
}
//Provide an icon to your action, overiding the one the related app
-(NSString*) iconPathForIdentifier:(NSString*)identifier {
    return @"/path/to/your/icon.png";
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
-(NSDictionary*) outputDefinitionForIdentifier:(NSString*)identifier {
    return @{
        @"type" : @"text",
        @"name" : @"Example output text"
    };
}
@end


%ctor {
    [[PowercutsManager sharedInstance] registerActionWithIdentifier:@"com.anthopak.powercuts.action.complexExample" action:[ComplexExampleAction new]];
}