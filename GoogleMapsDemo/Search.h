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

@interface Search : UIView <UITableViewDelegate,UITableViewDataSource>



@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;




- (IBAction)searchButton:(UIButton *)sender;

+(instancetype) loadXIB;

@end
