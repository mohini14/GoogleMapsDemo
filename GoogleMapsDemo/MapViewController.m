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
-(void)setMapToDefaultLocation
{
	
	//create a GMSCameraPosition that tells map to display corresponding coordinates
	[self.mapView clear];
    [[LocationManager getInstance] getLocation:^(double lat, double lon, NSError *error){
        GMSCameraPosition *camera;
        if(error == nil) {
            camera = [GMSCameraPosition cameraWithLatitude:lat longitude:lon zoom:15];
			[_mapView setCamera:camera];//method sets camera of map to current location
			[self updateMarker:lat withlongitude:lon]; //method to add marker to current location
			self.mapView.myLocationEnabled = YES;
		}else{
			[AlertManager showAlertPopupWithTitle:PARSING_ERROR_MSG forView:self];
		}
	}];

}

// method to add marker to map
-(void) updateMarker :(double)lat withlongitude:(double)longt{
    GMSMarker *marker=[[GMSMarker alloc]init];
    marker.position=CLLocationCoordinate2DMake(lat,longt);
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.map=self.mapView;
}



//method to populate map for given search
-(void) setMarker
{
	
	[self.mapView clear];
	
	for(PlaceModel *obj in self.places){
		GMSMarker *marker=[[GMSMarker alloc]init];
		marker.position=CLLocationCoordinate2DMake([obj.lat doubleValue], [obj.longt doubleValue]);// method gives location for given latitude and longitude
		marker.title=obj.name;
		marker.icon=[ImageManager imageWithImage:obj.iconImage scaledToSize:CGSizeMake(DEFAULT_IMAGE_SIZE,DEFAULT_IMAGE_SIZE)];//to reset the size of icon
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
		[self setMarker]; //to populate map for given search
		[self.searchBarView setHidden:YES];
		
	}];
	
	
	
}



@end
