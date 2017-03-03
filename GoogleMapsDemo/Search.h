//
//  Search.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Define.h"
#import "TableViewCell.h"
#import "PlaceModel.h"
#import "LocationManager.h"
#import "DataParser.h"
#import "AlertManager.h"
#import "CacheManager.h"

typedef void (^CompletionBlock)(NSArray* searchResult);

@interface Search : UIView <UITableViewDelegate,UITableViewDataSource>



@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray *placesArray;
@property CompletionBlock callback;


-(IBAction)onShowButtonClick:(id)sender;

-(void)showSearchView:(UIView*)superView overView:(UIView*)subView  completion:(CompletionBlock)completion;

//-(void) sendData :(NSArray *)places withCompletionHandler:(void (^)(NSArray * array))callBack;
- (IBAction)searchButton:(UIButton *)sender;
+(instancetype) loadXIB;

@end
