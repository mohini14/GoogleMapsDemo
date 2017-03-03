//
//  DataParser.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "DataParser.h"

@implementation DataParser


//method parses result obtained from google places api
+(void) parseSearchData :(NSString *)serchType withLatitude:(double)latitude withLongitude:(double)longitude withCompletionHandler:(void(^)(NSArray *array,NSString *errorMsg))CallBackToMainVC{
    
		NSString *url=[NSString stringWithFormat:PLACES_URL,latitude,longitude,RADIUS,serchType,GOOGLE_PLACES_KEY];
        [ServiceManager GETSearchResults:url withCompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSDictionary *responseData=nil;
            NSString *errorMsg=nil;
			NSMutableArray *places = [[NSMutableArray alloc]init];
            if(error!=nil){
                errorMsg=SERVER_FAILED;//if status code==5XX
            }else{
                NSError *err;
                responseData=[NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableLeaves) error:&err];
                if(err!=nil){
                    errorMsg=PARSING_ERROR_MSG;// if JSON data was not parsable
                }else{
					for(NSDictionary *obj in responseData[PLACES_RESULTS_KEY]){
                        PlaceModel *p = [[PlaceModel alloc] initWithDictionary:obj];//if status code ==2XX will instantiate model class object
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
