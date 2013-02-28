//
//  CLMSystem.h
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLMEntity;
@interface CLMSystem : NSObject
@property (nonatomic, readonly) NSString *identifierType;

- (void)processEntity:(CLMEntity*)entity;
@end
