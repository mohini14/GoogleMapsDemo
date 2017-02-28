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
	static LocationManager *sinstance=nil;
	@synchronized (self)
	{
		if(sinstance==nil)
		{
			sinstance=[[LocationManager alloc]init];
			sinstance.locationManager.delegate=sinstance;
			sinstance.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
		}
	}
	return sinstance;
	
}




-(void) getLocation :(void (^) (double latitude,double longitude,NSError *error))completionHandler{
	self.completionHandlerBlock=completionHandler;
	[self.locationManager startUpdatingLocation];
	
}


#pragma mark - Delegate Methods (CLLocationManager)



-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	dispatch_async(dispatch_get_main_queue(),^(){
		self.completionHandlerBlock(00,00,error);
		
	});
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	if(newLocation!=nil){
	dispatch_async(dispatch_get_main_queue(), ^()
	{
		
		self.completionHandlerBlock(newLocation.coordinate.latitude,newLocation.coordinate.latitude,nil);
		
	});
		
		
}
}
	

@end




