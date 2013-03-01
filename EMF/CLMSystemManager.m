//
//  CLMSystemManager.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMSystemManager.h"
#import "CLMSystem.h"

@interface CLMSystemManager ()

@property (nonatomic, strong) NSMutableDictionary *systems;

@end

@implementation CLMSystemManager

- (id)init
{
    self = [super init];
    if (self)
    {
        _systems = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addSystem:(CLMSystem *)system
{
    if (![self.systems objectForKey:[system identifierType]])
    {
        [self.systems setObject:system forKey:[system identifierType]];
    }
}

- (void)removeSystemForType:(NSString *)systemType
{
    [self.systems removeObjectForKey:systemType];
}

- (CLMSystem *)getSystemForType:(NSString *)systemType
{
    return [self.systems objectForKey:systemType];
}

- (NSSet *)systemsOranizedByRunPriority
{
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"runPriority"  ascending:YES];
    NSArray *sortedSystems = [[self.systems  allValues] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    return [NSSet setWithArray:sortedSystems];
}
@end
