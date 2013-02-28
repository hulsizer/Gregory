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
	NSInteger _entityID;
	CLMWorld *_world;
	NSString *_groupTag;
	NSString *_identifierTag;
}

@property (nonatomic, readonly) NSInteger entityID;
@property (nonatomic, readonly) CLMWorld *world;
@property (nonatomic, strong) NSString *groupTag;
@property (nonatomic, strong) NSString *identifierTag;
@property (nonatomic, assign) BOOL deleted;

- (void)refresh;
@end
