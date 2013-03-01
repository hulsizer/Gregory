//
//  CLMWorld.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/26/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMWorld.h"
#import "CLMEntityManager.h"
#import "CLMSystemManager.h"
#import "CLMTagManager.h"
#import "CLMGroupManager.h"
#import "CLMEntity.h"
#import "CLMSystem.h"

static CLMWorld *sharedWorld;

@interface CLMWorld ()

@property (nonatomic, strong) CLMEntityManager *entityManager;
@property (nonatomic, strong) CLMSystemManager *systemManager;
@property (nonatomic, strong) CLMGroupManager  *groupManager;

@property (nonatomic, strong) NSMutableDictionary *systems;
@property (nonatomic, strong) NSMutableDictionary *entities;

@property (nonatomic, strong) NSNumber *entityID;
@end

@implementation CLMWorld

- (id)init
{
    self = [super init];
    if (self)
    {
        _entityManager = [[CLMEntityManager alloc] init];
        _systemManager = [[CLMSystemManager alloc] init];
        _groupManager = [[CLMGroupManager alloc] init];
        _entities = [[NSMutableDictionary alloc] init];
        _systems = [[NSMutableDictionary alloc] init];
        _entityID = [NSNumber numberWithInt:0];
    }
    return self;
}

+ (CLMWorld*)sharedWorld
{
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedWorld = [[self alloc] init];
    });
    return sharedWorld;
}

- (CLMEntityManager *)entityManager
{
    return self.entityManager;
}

- (CLMSystemManager *)systemManager
{
    return self.systemManager;
}

- (CLMEntity *)createEntity
{
    CLMEntity *newEntity = [[CLMEntity alloc] initWithWorld:self andEntityID:[self getNewEntityID]];
    [self.entities setObject:newEntity forKey:newEntity.entityID];
    
    return newEntity;
}

- (CLMEntity *)getEntityForID:(NSNumber *)entityID
{
    return [self.entities objectForKey:entityID];
}

- (void)removeEntity:(CLMEntity *)entity
{
    [self removeEntityForID:entity.entityID];
}

- (void)removeEntityForID:(NSNumber *)entityID
{
    [self.entities removeObjectForKey:entityID];
}

- (void)refreshEntity:(CLMEntity *)entity
{
    [entity refresh];
}

- (void)refreshEntityForID:(NSNumber *)entityID
{
    CLMEntity *entity = [self getEntityForID:entityID];
    [entity refresh];
}

- (void)step:(float)delta
{
    for (CLMSystem *system in [self.systemManager systemsOranizedByRunPriority])
    {
        NSString *identifier = [system identifierType];
        NSSet *entites = [self.groupManager objectsForTag:identifier];
        
        for (CLMEntity *entity in entites) {
            [system processEntity:entity];
        }
    }
}
                            
#pragma mark - Private
                            
- (NSNumber *)getNewEntityID
{
    self.entityID = [NSNumber numberWithInt:[self.entityID integerValue] + 1];
    return self.entityID;
}
@end
