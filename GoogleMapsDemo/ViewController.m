//
//  ViewController.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 27/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	[self setUpMap];//to set up initial steps to incorporate google maps
	
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


#pragma mark :to initiate maps


-(void) setUpMap{
	
	//create a GMSCameraPosition that tells map to display corresponding coordinates

	GMSCameraPosition *camera=[GMSCameraPosition  cameraWithLatitude:28.5355 longitude:77.3910 zoom:6];
	GMSMapView *mapView=[GMSMapView mapWithFrame:(CGRectZero) camera:camera];
	mapView.myLocationEnabled=YES;
	self.view=mapView;
	
	//in order to create markers in centre of the map
	GMSMarker *marker=[[GMSMarker alloc]init];	marker.position=CLLocationCoordinate2DMake(28.5355, 77.3910);
	marker.title=@"India";
	marker.snippet=@"Noida";
	marker.map=mapView;
	
	
	
}
@end
