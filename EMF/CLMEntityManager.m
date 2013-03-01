//
//  CLMEntityManager.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMEntityManager.h"
#import "CLMWorld.h"
#import "CLMEntity.h"
#import "CLMSystem.h"
#import "CLMComponent.h"
#import "CLMGroupManager.h"
#import "CLMTagManager.h"

@interface CLMEntityManager ()

@property (nonatomic, strong) CLMWorld *world;
@property (nonatomic, strong) NSMutableDictionary *entities;
@property (nonatomic, strong) NSMutableDictionary *componentsByClass;
@property (nonatomic, strong) NSMutableDictionary *systemsByClass;
@property (nonatomic, strong) NSNumber *entityID;

@end
@implementation CLMEntityManager

- (id)initWithWorld:(CLMWorld*)world
{
    self = [super init];
    if (self)
    {
        _world = world;
        _entities = [[NSMutableDictionary alloc] init];
        _componentsByClass = [[NSMutableDictionary alloc] init];
        _systemsByClass = [[NSMutableDictionary alloc] init];
        _entityID = [NSNumber numberWithInt:0];
    }
    return self;
}

#pragma mark - Entities
- (CLMEntity *)createEntity
{
    CLMEntity *newEntity = [[CLMEntity alloc] initWithWorld:self.world andEntityID:[self getNewEntityID]];
    [self.entities setObject:newEntity forKey:newEntity.entityID];
    
    return newEntity;
}

- (void)removeEntityForID:(NSNumber *)entityID
{
    CLMEntity *entity = [self entityForID:entityID];
    [self.world.groupManager removeObject:entity];
    
    [self.entities removeObjectForKey:entityID];
    
}

- (CLMEntity *)entityForID:(NSNumber *)entityID
{
    return [self.entities objectForKey:entityID];
}

#pragma mark - Component Methods
//Component Methods
- (void)addComponent:(CLMComponent *)component toEntity:(CLMEntity*)entity
{
    [self addComponent:component toEntityID:entity.entityID];
}

- (CLMComponent *)getComponentOfType:(NSString*)componentType forEntity:(CLMEntity*)entity
{
    return [self getComponentOfType:componentType forEntityID:entity.entityID];
}

- (BOOL)entity:(CLMEntity *)entity hasComponentOfType:(NSString *)componentType
{
    return [self entityID:entity.entityID hasComponentOfType:componentType];
}

- (void)removeComponentOfType:(NSString *)componentType forEntity:(CLMEntity *)entity
{
    [self removeComponentOfType:componentType forEntityID:entity.entityID];
}

- (void)addComponent:(CLMComponent*)component toEntityID:(NSNumber *)entityID
{
    NSMutableDictionary *entitesForComponent = [self getEntitesForComponent:[component identifierType]];
    [entitesForComponent setObject:component forKey:entityID];
}

- (CLMComponent*)getComponentOfType:(NSString *)componentType forEntityID:(NSNumber *)entityID
{
    NSMutableDictionary *entitesForComponent = [self getEntitesForComponent:componentType];
    return [entitesForComponent objectForKey:entityID];
}

- (BOOL)entityID:(NSNumber *)entityID hasComponentOfType:(NSString *)componentType
{
    NSMutableDictionary *entitesForComponent = [self getEntitesForComponent:componentType];
    return [entitesForComponent objectForKey:entityID] != nil;

}

- (void)removeComponentOfType:(NSString *)componentType forEntityID:(NSNumber *)entityID
{
    NSMutableDictionary *entitesForComponent = [self getEntitesForComponent:componentType];
    [entitesForComponent removeObjectForKey:entityID];
}

#pragma mark - System Methods
//System Methods
- (void)addSystem:(CLMSystem *)system toEntity:(CLMEntity *)entity
{
    [self addSystem:system toEntityID:entity.entityID];
}

- (CLMSystem*)getSystemOfType:(NSString *)addSystemType forEntity:(CLMEntity*)entity
{
    return [self getSystemOfType:addSystemType forEntityID:entity.entityID];
}

- (BOOL)entity:(CLMEntity *)entity hasSystemOfType:(NSString *)systemType
{
    return [self entityID:entity.entityID hasSystemOfType:systemType];
}

- (void)removeSystemOfType:(NSString *)systemType forEntity:(CLMEntity *)entity
{
    [self removeSystemOfType:systemType forEntityID:entity.entityID];
}

- (void)addSystem:(CLMSystem *)system toEntityID:(NSNumber *)entityID
{
    NSMutableDictionary *entitesForSystem = [self getSystemsForSystem:[system identifierType]];
    [entitesForSystem setObject:system forKey:entityID];
    [self addEntityIDToSystemGroup:entityID systemType:[system identifierType]];
}

- (CLMSystem *)getSystemOfType:(NSString *)systemType forEntityID:(NSNumber *)entityID
{
    NSMutableDictionary *entitesForSystem = [self getSystemsForSystem:systemType];
    return [entitesForSystem objectForKey:entityID];
}

- (BOOL)entityID:(NSNumber *)entityID hasSystemOfType:(NSString *)systemType
{
    NSMutableDictionary *entitesForSystem = [self getSystemsForSystem:systemType];
    return [entitesForSystem objectForKey:entityID] != nil;
}

- (void)removeSystemOfType:(NSString *)systemType forEntityID:(NSNumber *)entityID
{
    NSMutableDictionary *entitesForSystem = [self getEntitesForComponent:systemType];
    [entitesForSystem removeObjectForKey:entityID];
    [self removeEntityIDFromSystemGroup:entityID systemType:systemType];
}

#pragma mark - Private

- (void)addEntityToSystemGroup:(CLMEntity*)entity systemType:(NSString *)systemType
{
    [self.world.groupManager addObject:entity forTag:systemType];
}

- (void)addEntityIDToSystemGroup:(NSNumber*)entityID systemType:(NSString *)systemType
{
    [self addEntityToSystemGroup:[self entityForID:entityID] systemType:systemType];
}

- (void)removeEntityFromSystemGroup:(CLMEntity*)entity systemType:(NSString *)systemType
{
    [self.world.groupManager removeObject:entity forTag:systemType];
}

- (void)removeEntityIDFromSystemGroup:(NSNumber *)entityID systemType:(NSString *)systemType
{
    [self removeEntityFromSystemGroup:[self entityForID:entityID] systemType:systemType];
}

- (NSMutableDictionary*)getEntitesForComponent:(NSString *)componentType
{
    return [self.componentsByClass objectForKey:componentType];
}

- (NSMutableDictionary*)getSystemsForSystem:(NSString *)systemType
{
    return [self.systemsByClass objectForKey:systemType];
}

- (NSNumber *)getNewEntityID
{
    self.entityID = [NSNumber numberWithInt:[self.entityID integerValue] + 1];
    return self.entityID;
}
@end
