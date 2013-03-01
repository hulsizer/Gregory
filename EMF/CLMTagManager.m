//
//  CLMTagManager.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMTagManager.h"

@interface CLMTagManager ()

@property (nonatomic, strong) NSMutableDictionary *objects;
@property (nonatomic, strong) NSMutableDictionary *tagsForObjects;
@end

@implementation CLMTagManager

- (id)init
{
    self = [super init];
    if (self)
    {
        _objects = [[NSMutableDictionary alloc] init];
        _tagsForObjects = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addObject:(NSObject *)object forTag:(NSString *)tag
{
    [self.objects setObject:object forKey:tag];
    [self addTag:tag forObject:object];
}

- (void)removeObjectForTag:(NSString *)tag
{
    NSObject *object = [self.objects objectForKey:tag];
    [self removeTag:tag forObject:object];
    [self.objects removeObjectForKey:tag];
}

- (NSObject *)getObjectForTag:(NSString *)tag
{
    return [self.objects objectForKey:tag];
}

//Only used when an object has been deleted
- (void)removeObject:(NSObject*)object
{
    NSMutableSet *keys = [self.tagsForObjects objectForKey:object];
    for (NSString *key in keys)
    {
        [self removeObjectForTag:key];
    }
}

#pragma mark - Private

- (void)addTag:(NSString*)tag forObject:(NSObject*)object
{
    NSMutableSet *keys = [self.tagsForObjects objectForKey:object];
    if (!keys)
    {
        keys = [[NSMutableSet alloc] init];
    }
    [keys addObject:tag];
}

- (void)removeTag:(NSString *)tag forObject:(NSObject*)object
{
    NSMutableSet *keys = [self.tagsForObjects objectForKey:object];
    if (keys)
    {
        [keys removeObject:tag];
    }
}
@end
