//
//  PlaceModel.m
//  GoogleMapsDemo
//
//  Created by Mohini on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "PlaceModel.h"

@implementation PlaceModel

- (instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self && dictionary){
        self.name = dictionary[PLACES_NAME_KEY];
        self.lat= dictionary[PLACES_GEOMETRY_KEY][PLACES_LOCATION_KEY][PLACES_LAT_KEY];
        self.longt = dictionary[PLACES_GEOMETRY_KEY][PLACES_LOCATION_KEY][PLACES_LONG_KEY];
        self.vicinity = dictionary[PLACES_VICINITY_KEY];
        }
        return self;
}


@end
