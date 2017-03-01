//
//  ServiceManager.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "ServiceManager.h"

@implementation ServiceManager

+ (void) GETSearchResults :(NSString *)urlString withCompletionHandler:(void (^)(NSData *data,NSURLResponse *response,NSError *error))callBAckToDataParser{
	NSURL *url=[NSURL URLWithString:urlString];
	NSURLSessionConfiguration *defaultSessionConfiguration=[NSURLSessionConfiguration defaultSessionConfiguration];
	NSURLSession *defaultSession=[NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
	NSURLSessionDataTask *dataTask=[defaultSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		NSLog(@"HTTP GET LOG url:%@, data:%@, response:%@, error:%@", url.description, data.description, response.description, error.description);
		callBAckToDataParser(data,response,error);
		
	}];
	
	[dataTask resume];
}



@end
