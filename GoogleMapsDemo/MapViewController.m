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
	[self SetUpVC];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}



#pragma mark- set up Initial VC
-(void) SetUpVC{
	
	self.mapView.delegate = self;
	[self setMapToDefaultLocation];
	[self.searchBarView setHidden:YES];
}



#pragma mark-set up Map
-(void)setMapToDefaultLocation{
	
	//create a GMSCameraPosition that tells map to display corresponding coordinates
    [[LocationManager getInstance] getLocation:^(double lat, double lon, NSError *error){
        GMSCameraPosition *camera;
        if(error == nil) {
            camera = [GMSCameraPosition cameraWithLatitude:lat longitude:lon zoom:16];
        }else{
            camera = [GMSCameraPosition cameraWithLatitude:28 longitude:77 zoom:16];
        }
        self.mapView = [GMSMapView mapWithFrame:self.mapContainerView.frame camera:camera];
        self.mapView.myLocationEnabled = YES;
		//[self updateMarker];
		[self.view addSubview:self.mapView] ;
    }];

	
	
	
}


//-(void) updateMarker{
//    GMSMarker *marker=[[GMSMarker alloc]init];
//    marker.position=_mapView.camera.target;
//    marker.appearAnimation = kGMSMarkerAnimationPop;
//    marker.map=self.mapView;
//    self.view = self.mapView;
//
//    
//}


-(void) setMarker
{
	
	[self.mapView clear];
	
	for(PlaceModel *obj in self.places){
		GMSMarker *marker=[[GMSMarker alloc]init];
		marker.position=CLLocationCoordinate2DMake([obj.lat doubleValue], [obj.longt doubleValue]);// method gives location for given latitude and longitude
		marker.title=obj.name;
		marker.icon=obj.iconImage;
		marker.map=self.mapView;
		
	}
	
	
}



#pragma mark-mapView Delegates
- (void) mapView:(GMSMapView *)mapView didTapAtCoordinate :(CLLocationCoordinate2D)coordinate{
	[self.searchBarView setHidden:YES];
	[self setMarker];
	
}


#pragma mark-Methods to handle actions on VC

- (IBAction)refreshButton:(id)sender {
    [self setMapToDefaultLocation];
}


- (IBAction)searchButton:(UIBarButtonItem *)sender {
	
	[self.searchBarView setHidden:NO];
	[self.searchView.searchBar becomeFirstResponder];
	
	self.searchView = [Search loadXIB];
	
	[_searchView showSearchView:self.view overView:_searchBarView completion:^(NSArray *searchResult) {
	
		_places = searchResult;
		[self setMarker];
		[self.searchBarView setHidden:YES];
		
	}];
	
	
	
}



@end
