//
//  DataParser.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "DataParser.h"

@implementation DataParser



+(void) parseSearchData :(NSString *)serchType withLatitude:(double)latitude withLongitude:(double)longitude withCompletionHandler:(void(^)(NSArray *array,NSString *errorMsg))CallBackToMainVC{
    
		NSString *url=[NSString stringWithFormat:PLACES_URL,latitude,longitude,RADIUS,serchType,GOOGLE_PLACES_KEY];
        [ServiceManager GETSearchResults:url withCompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSDictionary *responseData=nil;
            NSString *errorMsg=nil;
            NSMutableArray *places = [@[] mutableCopy];
            if(error!=nil){
                errorMsg=SERVER_FAILED;
            }else{
                NSError *err;
                responseData=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&err];
                if(err!=nil){
                    errorMsg=PARSING_ERROR_MSG;
                }else{
                     //places=[responseData objectForKey:PLACES_RESULTS_KEY];
                    for(NSDictionary *obj in responseData[PLACES_RESULTS_KEY]){
                        PlaceModel *p = [[PlaceModel alloc] initWithDictionary:obj];
                        [places addObject:p];
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                CallBackToMainVC(places,errorMsg);
            });
            
        }];
	}

@end
