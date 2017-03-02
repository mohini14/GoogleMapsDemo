//
//  TableViewCell.m
//  GoogleMapsDemo
//
//  Created by Mohini Sindhu  on 01/03/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark- method to set the cell attribute value through model class

-(void) setCellAttribute :(PlaceModel *)place{
	
	self.nameLabel.text=place.name;
	self.adressLabel.text=place.vicinity;
	self.iconLabel.image=place.iconImage;
}

@end
