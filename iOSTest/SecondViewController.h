//
//  SecondViewController.h
//  iOSTest
//
//  Created by vasi on 8/13/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
{
    NSArray *contacts;
    NSArray *searchResults;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic,strong) NSMutableArray * arrayResults;
@property (nonatomic,strong) NSArray * arrayAll;
@end
