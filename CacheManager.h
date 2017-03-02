//
//  CacheManager.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 02/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Define.h"
#import "AlertManager.h"
@interface CacheManager : NSObject

+(instancetype) getInstance;
-(void) imageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *))CallBackToMainVC;
-(void) downloadImageForURL :(NSString *)imageURL withCompletionHandler:(void (^) (UIImage *downloadedImage))callBack;
-(void) saveDownloadedImage :(UIImage *)image withURL:imageURL;
-(NSString *)  retrievePathForNameInDocumentDirectory :(NSString *)Key;


@end
