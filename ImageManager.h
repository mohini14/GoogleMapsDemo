//
//  ImageManager.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 03/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Define.h"


@interface ImageManager : NSObject

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize ;

@end
