//
//  CLMEntity.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLMWorld;
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
- (void)refresh;
@end
