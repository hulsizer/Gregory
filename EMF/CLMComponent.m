//
//  CLMComponent.m
//  EMF
//
//  Created by Andrew Hulsizer on 2/24/13.
//  Copyright (c) 2013 Classy Monsters. All rights reserved.
//

#import "CLMComponent.h"

@implementation CLMComponent

- (id)init
{
    self = [super init];
    if (self)
    {
        _identifierType = @"DefaultComponent";
    }
    return self;
}
@end
