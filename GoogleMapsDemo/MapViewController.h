//
//  MapViewController.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>
#import "LocationManager.h"
#import "Search.h"
#import "DataParser.h"
#import "AlertManager.h"
#import "ImageManager.h"

@interface MapViewController : UIViewController<GMSMapViewDelegate>



@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *mapContainerView;
@property (strong,nonatomic) Search *searchView;
@property (weak, nonatomic) IBOutlet UIView *searchBarView;
@property (strong,nonatomic) NSArray *places;


-(void) SetUpVC;
-(void) setMarker;
- (void)setMapToDefaultLocation;
- (IBAction)refreshButton:(id)sender;
- (IBAction)searchButton:(UIBarButtonItem *)sender;
-(void) updateMarker :(double)lat withlongitude:(double)longt;

@end
