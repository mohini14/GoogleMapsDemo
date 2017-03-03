//
//  PlaceModel.h
//  GoogleMapsDemo
//
//  Created by Mohini on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Define.h"
#import "CacheManager.h"

@interface PlaceModel : NSObject

@property  NSString *name;
@property  NSNumber *lat;
@property  NSNumber *longt;
@property  NSString *vicinity;
@property  NSString *iconURL;
@property  UIImage *iconImage;

-(void) getImage :(void (^)(UIImage * image))callBack;
- (instancetype) initWithDictionary:(NSDictionary*)dictionary;


@end
