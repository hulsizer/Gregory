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

@end

@implementation CLMTagManager

- (id)init
{
    self = [super init];
    if (self)
    {
        _objects = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)addObject:(NSObject *)object forTag:(NSString *)tag
{
    [self.objects setObject:object forKey:tag];
}

- (void)removeObjectForTag:(NSString *)tag
{
    [self.objects removeObjectForKey:tag];
}

- (NSObject *)getObjectForTag:(NSString *)tag
{
    return [self.objects objectForKey:tag];
}

@end
