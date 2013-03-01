//
//  CLMEntityManager.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLMWorld;
@class CLMEntity;
@class CLMComponent;
@class CLMSystem;

@interface CLMEntityManager : NSObject

- (id)initWithWorld:(CLMWorld*)world;

- (CLMEntity *)createEntity;
- (void)removeEntityForID:(NSNumber *)entityID;
- (CLMEntity *)entityForID:(NSNumber *)entityID;

//Component Methods
- (void)addComponent:(CLMComponent *)component toEntity:(CLMEntity*)entity;
- (CLMComponent *)getComponentOfType:(NSString*)componentType forEntity:(CLMEntity*)entity;
- (BOOL)entity:(CLMEntity *)entity hasComponentOfType:(NSString *)componentType;
- (void)removeComponentOfType:(NSString *)componentType forEntity:(CLMEntity *)entity;

- (void)addComponent:(CLMComponent*)component toEntityID:(NSNumber *)entityID;
- (CLMComponent*)getComponentOfType:(NSString *)componentType forEntityID:(NSNumber *)entityID;
- (BOOL)entityID:(NSNumber *)entityID hasComponentOfType:(NSString *)componentType;
- (void)removeComponentOfType:(NSString *)componentType forEntityID:(NSNumber *)entityID;

//System Methods
- (void)addSystem:(CLMSystem *)system toEntity:(CLMEntity *)entity;
- (CLMSystem*)getSystemOfType:(NSString *)addSystemType forEntity:(CLMEntity*)entity;
- (BOOL)entity:(CLMEntity *)entity hasSystemOfType:(NSString *)systemType;
- (void)removeSystemOfType:(NSString *)systemType forEntity:(CLMEntity *)entity;

- (void)addSystem:(CLMSystem *)component toEntityID:(NSNumber *)entityID;
- (CLMSystem *)getSystemOfType:(NSString *)systemType forEntityID:(NSNumber *)entityID;
- (BOOL)entityID:(NSNumber *)entityID hasSystemOfType:(NSString *)systemType;
- (void)removeSystemOfType:(NSString *)systemType forEntityID:(NSNumber *)entityID;
@end
