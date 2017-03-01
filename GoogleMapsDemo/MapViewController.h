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


@interface MapViewController : UIViewController



@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
@property (strong, nonatomic) IBOutlet UIView *mapContainerView;
@property(strong,nonatomic) Search *searchView;
@property (weak, nonatomic) IBOutlet UIView *searchBarView;


- (void)setMapToDefaultLocation;
- (IBAction)refreshButton:(id)sender;
- (IBAction)searchButton:(UIBarButtonItem *)sender;

@end
