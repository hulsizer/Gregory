//
//  CLMSystemManager.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLMSystem;
@interface CLMSystemManager : NSObject

- (void)addSystem:(CLMSystem*)system;
- (CLMSystem*)getSystemForType:(NSString*)systemType;
@end
