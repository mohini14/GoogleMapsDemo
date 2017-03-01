//
//  LocationManager.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager


+(instancetype) getInstance
{
	static LocationManager *instanceVar=nil;

    if(instanceVar != nil)
        return instanceVar;

	@synchronized (self)
	{
		if(instanceVar==nil)
		{
			instanceVar=[[LocationManager alloc]init];
            instanceVar.locationManager = [[CLLocationManager alloc] init];
            instanceVar.locationManager.delegate=instanceVar;
            instanceVar.locationManager.desiredAccuracy=kCLLocationAccuracyBest;

		}
	}
    return instanceVar;
}



-(void) getLocation :(void (^) (double latitude,double longitude,NSError *error))completionHandler{
	self.completionHandlerBlock=completionHandler;
	[self.locationManager startUpdatingLocation];
    self.isLocationUpdated = FALSE;
	
}


#pragma mark - Delegate Methods (CLLocationManager)



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
		self.completionHandlerBlock(00,00,error);
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
	if(newLocation!=nil){
        if(self.isLocationUpdated == FALSE) {
            NSLog(@"Location Updated successfully ");
            self.completionHandlerBlock(newLocation.coordinate.latitude, newLocation.coordinate.longitude, nil);
            self.isLocationUpdated = TRUE;
            [self.locationManager stopUpdatingLocation];
        }
        NSLog(@"Tried updating Location");

    };


}



@end




