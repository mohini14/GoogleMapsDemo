//
//  DataParser.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationManager.h"
#import "Define.h"
#import "ServiceManager.h"
#import "PlaceModel.h"

@interface DataParser : NSObject

+(void) parseSearchData :(NSString *)serchType withLatitude:(double)latitude withLongitude:(double)longitude withCompletionHandler:(void(^)(NSArray *array,NSString *errorMsg))CallBackToMainVC;

@end
