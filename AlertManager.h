//
//  AlertManager.h
//  GoogleMapsDemo
//
//  Created by Mohini on 02/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Define.h"

@interface AlertManager : NSObject


+ (void)showAlertPopupWithTitle:(NSString *)message forView:(UIViewController *)view ;

@end
