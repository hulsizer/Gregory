//
//  CLMEntity.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMEntity.h"

@implementation CLMEntity

- (id)init
{
    self = [super init];
    if (self)
    {
        _world = nil;
        _entityID = nil;
        _groupTag = @"";
        _identifierType = @"";
        _deleted = FALSE;
    }
    return self;
}

- (id)initWithWorld:(CLMWorld*)world andEntityID:(NSNumber *)entityID
{
    self = [super init];
    if (self)
    {
        _world = world;
        _entityID = entityID;
        _groupTag = @"";
        _identifierType = @"";
        _deleted = FALSE;
    }
    return self;
}

- (void)refresh
{
    
}
@end
