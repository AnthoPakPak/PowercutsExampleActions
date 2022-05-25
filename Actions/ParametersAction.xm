#import <libpowercuts/libpowercuts.h>

@interface ParametersExampleAction : PCAction
@end
@implementation ParametersExampleAction
-(void) performActionForIdentifier:(NSString*)identifier withParameters:(NSDictionary*)parameters {
    //Do what you want here
    NSLog(@"Performing action with identifier %@, parameters %@", identifier, parameters);
}
-(NSString*) nameForIdentifier:(NSString*)identifier {
    return @"Parameters example action";
}
-(NSString*) descriptionSummaryForIdentifier:(NSString*)identifier {
    return @"Just an example action.";
}
-(NSArray*) parametersDefinitionForIdentifier:(NSString*)identifier {
    return @[
        @{
            @"type" : @"boolean",
            @"key" : @"exampleBoolean",
            @"label" : @"Example boolean",
            @"defaultValue" : @(1)
        },
        @{
            @"type" : @"text",
            @"key" : @"exampleText",
            @"label" : @"Example text",
            @"defaultValue" : @"",
            @"placeholder" : @"Put some text!"
        },
        @{
            @"type" : @"enum",
            @"key" : @"exampleEnum",
            @"label" : @"Example enum",
            @"defaultValue" : @"Value 1",
            @"items" : @[@"Value 1", @"Value 2", @"Value 3"]
        },
        @{
            @"type" : @"number",
            @"key" : @"exampleNumber",
            @"allowsDecimalNumbers" : @(YES),
            @"allowsNegativeNumbers" : @(NO),
            @"label" : @"Example number (conditional)",
            @"defaultValue" : @(0),
            @"condition" : @{ // only when key = value (when exampleEnum enum's value is "Value 1")
                @"key" : @"exampleEnum",
                @"value" : @"Value 1"
            }
        }
    ];
}
@end


%ctor {
    [[PowercutsManager sharedInstance] registerActionWithIdentifier:@"com.anthopak.powercuts.action.parametersExample" action:[ParametersExampleAction new]];
}