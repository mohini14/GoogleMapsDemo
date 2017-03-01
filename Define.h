//
//  Define.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#define ROW_HIEGHT 120
#define GOOGLE_MAP_KEY @"AIzaSyDBc6Ywk2UB2l-ds0gQ1jyYkU5Utn9c9zY"
#define GOOGLE_PLACES_KEY @"AIzaSyDWgFFDdBCITqHc3NsdKL8fWGzAD7zX-s4"
#define BACKGROUND_QUEUE  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define SERVER_FAILED @"SERVER FAILED ERROR"
#define RADIUS @"500"
#define PLACES_URL @"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@"
#define PARSING_ERROR_MSG @"SOMETHING WENT WRONG"

#define PLACES_RESULTS_KEY @"results"
#define PLACES_NAME_KEY @"name"
#define PLACES_GEOMETRY_KEY @"geometry"
#define PLACES_LOCATION_KEY @"location"
#define PLACES_LAT_KEY @"lat"
#define PLACES_LONG_KEY @"lng"
#define PLACES_VICINITY_KEY @"vicinity"

@interface Define : NSObject

@end
