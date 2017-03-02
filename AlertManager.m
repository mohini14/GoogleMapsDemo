//
//  AlertManager.m
//  GoogleMapsDemo
//
//  Created by Mohini on 02/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "AlertManager.h"

//method displays warning or message on screen
@implementation AlertManager

+ (void)showAlertPopupWithTitle:(NSString *)message forView:(UIViewController *)view {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"GOOGLE MAPS", nil) message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [view presentViewController:alertController animated:YES completion:nil];
}


@end
