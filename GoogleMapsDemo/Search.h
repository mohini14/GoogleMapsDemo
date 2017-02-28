//
//  Search.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 28/02/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Search : UIView <UITableViewDataSource,UITableViewDelegate>



@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)doneButton:(UIButton *)sender;
- (IBAction)searchButton:(UIButton *)sender;

@end
