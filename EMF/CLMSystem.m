//
//  CLMSystem.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMSystem.h"

@implementation CLMSystem

- (id)init
{
    self = [super init];
    if (self)
    {
        _identifierType = @"DefaultSystem";
        _runPriority = [NSNumber numberWithInt:0];
    }
    return self;
}

- (void)processEntity:(CLMEntity*)entity
{
    
}
@end
