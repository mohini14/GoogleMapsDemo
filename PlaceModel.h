//
//  PlaceModel.h
//  GoogleMapsDemo
//
//  Created by Mohini on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Define.h"

@interface PlaceModel : NSObject

@property  NSString *name;
@property  NSNumber *lat;
@property  NSNumber *longt;
@property  NSString *vicinity;

- (instancetype) initWithDictionary:(NSDictionary*)dictionary;

@end
