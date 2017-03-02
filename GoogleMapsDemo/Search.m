//
//  Search.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "Search.h"

@implementation Search


+(instancetype) loadXIB{
	Search *search=[[[NSBundle mainBundle]loadNibNamed:@"SearchView" owner:self options:nil]lastObject];
	search.tableView.delegate=search;
	search.tableView.dataSource=search;
    search.placesArray = @[];

	
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
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if(cell==nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self.tableView options:nil]firstObject];
    }
    PlaceModel *place=self.placesArray[indexPath.row];
    cell.nameLabel.text=place.name;
    cell.adressLabel.text=place.vicinity;
    
    return cell;
}



#pragma mark-actions on customise view

- (IBAction)searchButton:(UIButton *)sender {
    
    NSString *searchString=self.searchBar.text;
    [[LocationManager getInstance]getLocation:^(double latitude, double longitude, NSError *error) {
        [DataParser parseSearchData:searchString withLatitude:latitude withLongitude:longitude withCompletionHandler:^(NSArray *array, NSString *errorMsg) {
            if(errorMsg!=nil){
                [AlertManager showAlertPopupWithTitle:errorMsg forView:self.superview];
            }else{
                self.placesArray=array;
                [self.tableView reloadData];
            }
        }];
    }];
}


@end


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	static NSString *simpleTableIdentifier = @"SimpleTableItem";
//	
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//	
//	if (cell == nil) {
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//	}
//	cell.textLabel.text = self.dataArray[indexPath.row];
//	return cell;
//}
