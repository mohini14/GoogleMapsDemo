//
//  TableViewCell.h
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceModel.h"
#import "CacheManager.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconLabel;

-(void) setCellAttribute :(PlaceModel *)place;

@end
