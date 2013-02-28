//
//  CLMEntityManager.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLMEntity;
@class CLMComponent;
@class CLMSystem;

@interface CLMEntityManager : NSObject

- (CLMEntity*)createEntity;
- (CLMEntity*)entityForID:(NSInteger)entityID;
- (CLMEntity*)entityForTag:(NSString*)entityTag;
- (NSSet*)entitiesForGroupTag:(NSString*)groupTag;

//Entity Methods
- (void)addComponent:(CLMComponent*)component toEntity:(CLMEntity*)entity;
- (CLMComponent*)getComponentOfType:(NSString*)componentType forEntity:(CLMEntity*)entity;
- (BOOL)entity:(CLMEntity*)entity hasComponentOfType:(NSString*)componentType;

- (void)addComponent:(CLMComponent*)component toEntityID:(NSInteger)entityID;
- (CLMComponent*)getComponentOfType:(NSString*)componentType forEntityID:(NSInteger)entityID;
- (BOOL)entityID:(NSInteger)entityID hasComponentOfType:(NSString*)componentType;

//System Methods
- (void)addSystem:(CLMSystem*)system toEntity:(CLMEntity*)entity;
- (CLMSystem*)getSystemOfType:(NSString*)addSystemType forEntity:(CLMEntity*)entity;
- (BOOL)entity:(CLMEntity*)entity hasSystemOfType:(NSString*)systemType;

- (void)addSystem:(CLMSystem*)component toEntityID:(NSInteger)entityID;
- (CLMSystem*)getSystemOfType:(NSString*)systemType forEntityID:(NSInteger)entityID;
- (BOOL)entityID:(NSInteger)entityID hasSystemOfType:(NSString*)systemType;
@end
