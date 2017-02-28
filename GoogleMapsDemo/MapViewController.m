//
//  MapViewController.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//	[self setUp];
	
	[LocationManager getInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





-(void) setUp{
	
	//create a GMSCameraPosition that tells map to display corresponding coordinates
	
	GMSCameraPosition *camera=[GMSCameraPosition  cameraWithLatitude:28.5355 longitude:77.3910 zoom:6];
	_mapView=[GMSMapView mapWithFrame:(CGRectZero) camera:camera];
	_mapView.myLocationEnabled=YES;

	
	//in order to create markers in centre of the map
	GMSMarker *marker=[[GMSMarker alloc]init];	marker.position=CLLocationCoordinate2DMake(28.5355, 77.3910);
	marker.title=@"India";
	marker.snippet=@"Noida";
	marker.map=_mapView;
	
	
	
}


- (IBAction)refreshButton:(id)sender {
	
	GMSCameraPosition *camera=[GMSCameraPosition  cameraWithLatitude:28.5355 longitude:77.3910 zoom:6];
	_mapView=[GMSMapView mapWithFrame:(CGRectZero) camera:camera];
	_mapView.myLocationEnabled=YES;
	
	
	//in order to create markers in centre of the map
	GMSMarker *marker=[[GMSMarker alloc]init];	marker.position=CLLocationCoordinate2DMake(28.5355, 77.3910);
	marker.title=@"India";
	marker.snippet=@"Noida";
	marker.map=_mapView;
}



- (IBAction)searchButton:(UIBarButtonItem *)sender {
	
	
	
}
@end
