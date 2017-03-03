//
//  Define.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#define ROW_HIEGHT 100
#define DEFAULT_IMAGE_SIZE 20
#define  CONST_ZERO_INT 0
#define CONST_ZERO_FLOAT 0.0
#define GOOGLE_MAP_KEY @"AIzaSyDBc6Ywk2UB2l-ds0gQ1jyYkU5Utn9c9zY"
#define GOOGLE_PLACES_KEY @"AIzaSyDWgFFDdBCITqHc3NsdKL8fWGzAD7zX-s4"
#define BACKGROUND_QUEUE  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define SERVER_FAILED @"SERVER FAILED ERROR"
#define RADIUS @"500"
#define PARSING_ERROR_MSG @"SOMETHING WENT WRONG"
#define RESPONSE_WILL_NON_NIL_ERROR_MSG @"SOMETHING WENT WRONG"
#define EMPTY_STRING_ERROR @"cannot send an empty error"
#define TABLE_CELL_IDENTIFIER @"TableViewCell"
#define SEARCH_VIEW_CELL_IDENTIFIER @"SearchView"
#define APP_NAME_CONSTANT @"GOOGLE MAPS"
#define ALERT_TITLE_OK @"OK"


#define PLACES_RESULTS_KEY @"results"
#define PLACES_NAME_KEY @"name"
#define PLACES_GEOMETRY_KEY @"geometry"
#define PLACES_LOCATION_KEY @"location"
#define PLACES_LAT_KEY @"lat"
#define PLACES_LONG_KEY @"lng"
#define PLACES_VICINITY_KEY @"vicinity"
#define PLACES_ICON_KEY @"icon"
#define PLACES_URL @"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@"


@interface Define : NSObject

@end
