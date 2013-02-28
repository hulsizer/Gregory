//
//  CLMWorld.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/26/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLMEntity;
@class CLMEntityManager;
@class CLMSystemManager;
@interface CLMWorld : NSObject

- (CLMEntityManager*)entityManager;
- (CLMSystemManager*)systemManager;

- (CLMEntity*)createEntity;
- (CLMEntity*)getEntityForID:(NSInteger)entityID;
- (void)removeEntity:(CLMEntity*)entity;
- (void)removeEntityForID:(NSInteger)entityID;
- (void)refreshEntity:(CLMEntity*)entity;
- (void)refreshEntityForID:(NSInteger)entityID;
@end
