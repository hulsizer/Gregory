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
@property (nonatomic, strong) NSMutableArray *refreshed;
@property (nonatomic, strong) NSMutableArray *deleted;

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
        _refreshed = [[NSMutableArray alloc] init];
        _deleted = [[NSMutableArray alloc] init];
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
    CLMEntity *newEntity = [self.entityManager createEntity];

    return newEntity;
}

- (CLMEntity *)getEntityForID:(NSNumber *)entityID
{
    return [self.entityManager entityForID:entityID];
}

- (void)removeEntity:(CLMEntity *)entity
{
    [self removeEntityForID:entity.entityID];
}

- (void)removeEntityForID:(NSNumber *)entityID
{
    if (![self.deleted containsObject:entityID])
    {
        [self.deleted addObject:entityID];
    }
}

- (void)refreshEntity:(CLMEntity *)entity
{
    if (![self.refreshed containsObject:entity])
    {
        [self.refreshed addObject:entity];
    }
}

- (void)refreshEntityForID:(NSNumber *)entityID
{
    CLMEntity *entity = [self getEntityForID:entityID];
    [self refreshEntity:entity];
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
    
    for (CLMEntity *entity in self.refreshed)
    {
        [entity refresh];
    }
    [self.refreshed removeAllObjects];
    
    for (NSNumber *entityID in self.deleted)
    {
        [self.entityManager removeEntityForID:entityID];
    }
    [self.deleted removeAllObjects];
    
}
                            

@end
