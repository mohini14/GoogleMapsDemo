//
//  Search.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "Search.h"

@implementation Search

#pragma  mark-To load customise XIB file
+(instancetype) loadXIB{
	Search *search=[[[NSBundle mainBundle]loadNibNamed:SEARCH_VIEW_CELL_IDENTIFIER owner:self options:nil]lastObject];
	search.tableView.delegate=search;
	search.tableView.dataSource=search;
    search.placesArray = @[];
	[search.tableView setHidden:YES];
	return search;
}



#pragma mark - Table View Delegates

-(NSInteger )tableView :(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.placesArray.count;
}

-(double)tableView : (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
	return ROW_HIEGHT;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TABLE_CELL_IDENTIFIER];
    if(cell==nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:TABLE_CELL_IDENTIFIER owner:self.tableView options:nil]firstObject];
    }
    PlaceModel *place=self.placesArray[indexPath.row];
	[cell setCellAttribute:place];  // setting the value of cell labels
	return cell;
}




#pragma mark-actions on customise view
- (IBAction)searchButton:(UIButton *)sender {
	
    NSString *searchString=[self.searchBar.text lowercaseString];
	if(searchString.length >0){
    [[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error) {
        [DataParser parseSearchData:searchString withLatitude:latitude withLongitude:longitude withCompletionHandler:^(NSArray *array, NSString *errorMsg) {
            if(errorMsg!=nil){
                [AlertManager showAlertPopupWithTitle:errorMsg forView:self.superview.inputViewController];
            }else{
                self.placesArray=array;
				[self.tableView setHidden:NO];
				[self.tableView reloadData];
            }
        }];
    }];
	}else{
		//[AlertManager showAlertPopupWithTitle:EMPTY_STRING_ERROR forView:self.superview];
	}

}


-(IBAction)onShowButtonClick:(id)sender
{
	if(_placesArray.count > CONST_ZERO_FLOAT)
		_callback(_placesArray);
	else
		_callback([NSArray new]);
	[self removeFromSuperview];
}


#pragma mark- to interact with main VC
//method would set the values of view on superview and woul send palces array to main VC
-(void)showSearchView:(UIView*)superView overView:(UIView*)subView  completion:(CompletionBlock)completion{
	self.frame = subView.frame;
	_callback = completion;
	[superView addSubview:self];
}


@end



