//
//  ImageManager.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 03/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "ImageManager.h"

@implementation ImageManager

//method resizes an object of UIImage
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
	UIGraphicsBeginImageContextWithOptions(newSize, NO, CONST_ZERO_FLOAT);
	[image drawInRect:CGRectMake(CONST_ZERO_INT, CONST_ZERO_INT, newSize.width, newSize.height)];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

@end
