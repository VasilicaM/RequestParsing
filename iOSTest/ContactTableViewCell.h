//
//  ContactTableViewCell.h
//  iOSTest
//
//  Created by vasi on 8/15/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImg;
@property (weak, nonatomic) IBOutlet UILabel *nameContact;
@property (weak, nonatomic) IBOutlet UIImageView *availableImg;
@property (weak, nonatomic) IBOutlet UILabel *status;
@end
