//
//  CLMGroupManager.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLMGroupManager : NSObject

- (void)addObject:(NSObject *)object forTag:(NSString *)tag;
- (void)removeObject:(NSObject *)object forTag:(NSString *)tag;
- (NSSet *)getObjectForTag:(NSString *)tag;
@end
