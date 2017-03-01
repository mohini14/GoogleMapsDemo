//
//  ServiceManager.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"



@interface ServiceManager : NSObject
+ (void) GETSearchResults :(NSString *)urlString withCompletionHandler:(void (^)(NSData *data,NSURLResponse *response,NSError *error))callBAckToDataParser;

@end
