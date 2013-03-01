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
@property (nonatomic, strong) NSMutableDictionary *groupsForObjects;

@end

@implementation CLMGroupManager

- (id)init
{
    self = [super init];
    if (self)
    {
        _groups = [[NSMutableDictionary alloc] init];
        _groupsForObjects = [[NSMutableDictionary alloc] init];
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
    [self addTag:tag forObject:object];
}

- (void)removeObject:(NSObject *)object forTag:(NSString *)tag
{
    NSMutableSet *group = [self.groups objectForKey:tag];
    if (group)
    {
        [group removeObject:object];
        [self removeTag:tag forObject:object];
    }
    
}

- (NSSet *)objectsForTag:(NSString *)tag
{
    return [self.groups objectForKey:tag];
}

- (void)removeObject:(NSObject*)object
{
    NSSet *tags = [self.groupsForObjects objectForKey:object];
    for (NSString *tag in tags)
    {
        [self removeObject:object forTag:tag];
    }
}

#pragma mark - Private

- (void)addTag:(NSString*)tag forObject:(NSObject*)object
{
    NSMutableSet *keys = [self.groupsForObjects objectForKey:object];
    if (!keys)
    {
        keys = [[NSMutableSet alloc] init];
    }
    [keys addObject:tag];
}

- (void)removeTag:(NSString *)tag forObject:(NSObject*)object
{
    NSMutableSet *keys = [self.groupsForObjects objectForKey:object];
    if (keys)
    {
        [keys removeObject:tag];
    }
}
@end
