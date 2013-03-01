//
//  CLMEntity.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLMWorld;
@class CLMComponent;
@class CLMSystem;

@interface CLMEntity : NSObject
{
	NSNumber *_entityID;
	CLMWorld *_world;
}

@property (nonatomic, readonly) NSNumber *entityID;
@property (nonatomic, readonly) CLMWorld *world;
@property (nonatomic, strong) NSString *groupTag;
@property (nonatomic, strong) NSString *identifierType;
@property (nonatomic, assign) BOOL deleted;

- (id)initWithWorld:(CLMWorld*)world andEntityID:(NSNumber *)entityID;

- (void)addComponent:(CLMComponent *)component;
- (CLMComponent *)getComponentOfType:(NSString *)componentType;
- (BOOL)hasComponentOfType:(NSString *)componentType;
- (void)removeComponentOfType:(NSString *)componentType;

- (void)addSystem:(CLMSystem *)system;
- (CLMSystem *)getSystemOfType:(NSString *)systemType;
- (BOOL)hasSystemOfType:(NSString *)systemType;
- (void)removeSystemOfType:(NSString *)systemType;

- (void)refresh;
@end
