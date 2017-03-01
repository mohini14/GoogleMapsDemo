//
//  DataParser.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "DataParser.h"

@implementation DataParser



+(void) parseSearchData :(NSString *)serchType withRadius :(double) radius{
	[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error) {
		NSString *url=[NSString stringWithFormat:PLACES_URL,latitude,longitude,RADIUS,serchType,GOOGLE_PLACES_KEY];
	}
}

@end
