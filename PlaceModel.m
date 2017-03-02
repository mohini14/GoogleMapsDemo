//
//  PlaceModel.m
//  GoogleMapsDemo
//
//  Created by Mohini on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "PlaceModel.h"

@implementation PlaceModel

//method to initialise model class
- (instancetype) initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    if (self && dictionary){
        self.name = dictionary[PLACES_NAME_KEY];
        self.lat= dictionary[PLACES_GEOMETRY_KEY][PLACES_LOCATION_KEY][PLACES_LAT_KEY];
        self.longt = dictionary[PLACES_GEOMETRY_KEY][PLACES_LOCATION_KEY][PLACES_LONG_KEY];
        self.vicinity = dictionary[PLACES_VICINITY_KEY];
		self.iconURL=dictionary[PLACES_ICON_KEY]; // setting iconURL as a Property because we cannont make the Dictonary flow through models.
		[self getImage:^(UIImage *image) {
			self.iconImage=image;
		}];
		
        }
        return self;
}


//method to get image from Cached Data
-(void) getImage :(void (^)(UIImage * image))callBack{
	
	[[CacheManager getInstance]imageForURL:self.iconURL withCompletionHandler:^(UIImage *image) {
		callBack(image);
	}];
	
}
@end
