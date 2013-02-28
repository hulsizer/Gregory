//
//  CLMTagManager.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLMEntity;
@interface CLMTagManager : NSObject

- (void)addObject:(NSObject*)object forTag:(NSString*)tag;
- (void)removeObject:(NSObject*)object forTag:(NSString*)tag;
- (NSObject*)getObjectForTag:(NSString*)tag;
@end
