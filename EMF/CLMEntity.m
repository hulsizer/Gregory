//
//  CLMEntity.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMEntity.h"
#import "CLMComponent.h"
#import "CLMSystem.h"
#import "CLMWorld.h"
#import "CLMEntityManager.h"

@interface CLMEntity ()

@end

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

#pragma mark - Components
- (void)addComponent:(CLMComponent *)component
{
    [self.world.entityManager addComponent:component toEntityID:self.entityID];
}

- (CLMComponent *)getComponentOfType:(NSString *)componentType
{
    return [self.world.entityManager getComponentOfType:componentType forEntityID:self.entityID];
}

- (BOOL)hasComponentOfType:(NSString *)componentType
{
    return [self.world.entityManager entityID:self.entityID hasComponentOfType:componentType];
}

- (void)removeComponentOfType:(NSString *)componentType
{
    [self.world.entityManager removeComponentOfType:componentType forEntityID:self.entityID];
}

#pragma mark - Systems
- (void)addSystem:(CLMSystem *)system
{
    [self.world.entityManager addSystem:system toEntityID:self.entityID];
}

- (CLMSystem *)getSystemOfType:(NSString *)systemType
{
    return [self.world.entityManager getSystemOfType:systemType forEntityID:self.entityID];
}

- (BOOL)hasSystemOfType:(NSString *)systemType
{
    return [self.world.entityManager entityID:self.entityID hasSystemOfType:systemType];
}

- (void)removeSystemOfType:(NSString *)systemType
{
    [self.world.entityManager removeSystemOfType:systemType forEntityID:self.entityID];
}
@end
