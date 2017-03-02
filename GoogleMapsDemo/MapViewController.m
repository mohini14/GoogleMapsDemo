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
    self.mapView.delegate = self;
    [self setMapToDefaultLocation];
	
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





-(void)setMapToDefaultLocation{
	
	//create a GMSCameraPosition that tells map to display corresponding coordinates
	[self.searchBarView setHidden:YES];
    [[LocationManager getInstance] getLocation:^(double lat, double lon, NSError *error){
        GMSCameraPosition *camera;
        if(error == nil) {
            camera = [GMSCameraPosition cameraWithLatitude:lat longitude:lon zoom:16];
        }else{
            camera = [GMSCameraPosition cameraWithLatitude:28 longitude:77 zoom:16];
        }
        self.mapView = [GMSMapView mapWithFrame:self.mapContainerView.frame camera:camera];
        self.mapView.myLocationEnabled = YES;
//        //in order to create markers in centre of the map
//        GMSMarker *marker=[[GMSMarker alloc]init];
//        marker.position=camera.target;
//        marker.appearAnimation = kGMSMarkerAnimationPop;
//        marker.map=self.mapView;
        [self.view addSubview:self.mapView] ;
    }];

	
	
	
}

-(void) updateLocation{
    GMSMarker *marker=[[GMSMarker alloc]init];
    marker.position=_mapView.camera.target;
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map=self.mapView;
    self.view = self.mapView;

    
}

- (IBAction)refreshButton:(id)sender {
    [self setMapToDefaultLocation];
}



- (IBAction)searchButton:(UIBarButtonItem *)sender {
	
	if(_searchView==nil){
	self.searchView = [Search loadXIB];
	self.searchView.frame=self.searchBarView.frame;
	[self.view addSubview:self.searchView];
	[self.searchBarView setHidden:NO];
    [self.searchView.searchBar becomeFirstResponder];
        
        
	
	}

}
@end
