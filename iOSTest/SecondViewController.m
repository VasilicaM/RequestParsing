//
//  SecondViewController.m
//  iOSTest
//
//  Created by vasi on 8/13/14.
//  Copyright (c) 2014 vasi. All rights reserved.
//

#import "SecondViewController.h"
#import "ContactTableViewCell.h"
#import "Contact.h"
#import "RequestManager.h"
#import "RequestResponse.h"
#import "Globals.h"
#import "Group.h"



@interface SecondViewController ()

@end


@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.arrayResults=[NSMutableArray new];
    self.arrayAll =[NSArray new];
    
    [[RequestManager sharedInstance]callService:^(RequestResponse *response) {
        if (response.responseCode==200) {
            
            NSArray * array= ArrayFromJSONObject(response.object[@"groups"]);
            for (id object in array) {
                Group * group=[[Group alloc]initWithJSONObject:object];
                [_arrayResults addObject:group];
            }
            NSMutableArray * arrayObj=[NSMutableArray array];
            for (Group *group in self.arrayResults) {
                [arrayObj addObjectsFromArray:group.people];
            }
            _arrayAll=[arrayObj copy];
            NSLog(@"%d",_arrayAll.count);
            [self.tableView reloadData];
        }
        else
        {
            
        }
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * groupName=nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        groupName=@"";
    }
    else
    {
    Group * group=[self.arrayResults objectAtIndex:section];
    groupName= group.groupName;
    }
    return groupName;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    else
    {
    Group * group=[self.arrayResults objectAtIndex:section];
    NSLog(@"%d",self.arrayResults.count);
    return group.people.count;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
    }
    else
    {
    NSLog(@"%d",self.arrayResults.count);
    return self.arrayResults.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    ContactTableViewCell *cell = (ContactTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Group * group=nil;
    Contact * contact=nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
//        group = [searchResults objectAtIndex:indexPath.section];
        contact=[searchResults objectAtIndex:indexPath.row];
    }
    else
    {
       group = [self.arrayResults objectAtIndex:indexPath.section];
        contact=[group.people objectAtIndex:indexPath.row];
    }
    

    [cell.nameContact setText:[NSString stringWithFormat:@"%@ %@",contact.firstName,contact.lastName]];
    if (contact.statusMessage)
    {
        [cell.status setText:contact.statusMessage];
    }
    
    [cell.avatarImg setImage:[UIImage imageNamed:@"contacts_list_avatar_male.png"]];
    
    NSString * online=@"contacts_list_status_online.png";
    NSString * offline=@"contacts_list_status_offline.png";

    if (contact.statusIcon)
    {
        if ([contact.statusIcon isEqualToString:@"online"])
        {
            if (online) {
                [cell.availableImg setImage:[UIImage imageNamed:online]];
            }
        }
        if ([contact.statusIcon isEqualToString:@"offline"])
        {
            if (offline) {
                [cell.availableImg setImage:[UIImage imageNamed:offline]];
            }
        }
        
        if ([contact.statusIcon isEqualToString:@"callforwarding"])
        {
            [cell.availableImg setImage:[UIImage imageNamed:@"contacts_list_call_forward.png"]];
        }
        
        if ([contact.statusIcon isEqualToString:@"away"])
        {
            [cell.availableImg setImage:[UIImage imageNamed:@"contacts_list_status_away.png"]];
        }
        
        if ([contact.statusIcon isEqualToString:@"busy"])
        {
            [cell.availableImg setImage:[UIImage imageNamed:@"contacts_list_status_busy.png"]];
        }
    }
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{

    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"firstName contains[c] %@", searchText];
    searchResults = [_arrayAll filteredArrayUsingPredicate:resultPredicate];
    NSLog(@"%d",searchResults.count);
    
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"%@",searchString);
    
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

@end
