//
//  CLMGroupManager.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMGroupManager.h"

@interface CLMGroupManager ()

@property (nonatomic, strong) NSMutableDictionary *groups;

@end

@implementation CLMGroupManager

- (id)init
{
    self = [super init];
    if (self)
    {
        _groups = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addObject:(NSObject *)object forTag:(NSString *)tag
{
    NSMutableSet *group = [self.groups objectForKey:tag];
    if (!group)
    {
        group = [[NSMutableSet alloc] init];
    }
    [group setByAddingObject:object];
}

- (void)removeObject:(NSObject *)object forTag:(NSString *)tag
{
    NSMutableSet *group = [self.groups objectForKey:tag];
    if (group)
    {
        [group removeObject:object];
    }
    
}

- (NSSet *)objectsForTag:(NSString *)tag
{
    return [self.groups objectForKey:tag];
}

#pragma mark - Private


@end
