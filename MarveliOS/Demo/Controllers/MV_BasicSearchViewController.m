//
//  MV_BasicSearchViewController.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/26/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_BasicSearchViewController.h"
#import "MV_Query+FrequentQueries.h"

@interface MV_BasicSearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *results;
@end

@implementation MV_BasicSearchViewController

- (void) viewDidLoad {
    [super viewDidLoad];
	
	self.tableView.tableHeaderView = self.searchBar;
}

- (void) searchBarSearchButtonClicked: (UISearchBar *) searchBar {
	if (searchBar.text.length == 0) return;
	
	MV_Query_result_type		types[] = { MV_Query_result_type_character, MV_Query_result_type_creator, MV_Query_result_type_event, MV_Query_result_type_series };
	
	MV_Query			*query = [MV_Query queryForResultType: types[searchBar.selectedScopeButtonIndex] withSearchText: searchBar.text];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[query fetch: 100 withCompletion: ^(NSError *error) {
		self.results = query.results;
		dispatch_async(dispatch_get_main_queue(), ^{
			if (error) {
				[UIAlertView showAlertWithTitle: @"An Error Occurred while Fetching" message: error.localizedDescription];
			}
			[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
			[self.tableView reloadData];
		});
	}];
}

//==========================================================================================
#pragma mark Table DataSource/Delegate
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	//   NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath: indexPath];
	NSString								*cellIdentifier = @"cell";
	UITableViewCell							*cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
	NSDictionary							*info = self.results[indexPath.row];
	
	if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
	
	cell.textLabel.text = info[@"name"] ?: info[@"title"];
	if (cell.textLabel.text.length == 0) cell.textLabel.text = info[@"fullName"];
	
	return cell;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *) tableView {
	//return [[self.fetchedResultsController sections] count];
	return 1;
}

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
	//	id <NSFetchedResultsSectionInfo>		sectionInfo = [[self.fetchedResultsController sections] objectAtIndex: section];
	//	return [sectionInfo numberOfObjects];
	return self.results.count;
}

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
	[tableView deselectRowAtIndexPath: indexPath animated: YES];
}

/*
 - (CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath: (NSIndexPath *) indexPath {
 return 44;
 }
 
 - (NSString *) tableView: (UITableView *) tableView titleForHeaderInSection: (NSInteger) section {
 return nil;
 }
 
 - (UIView *) tableView: (UITableView *) tableView viewForHeaderInSection: (NSInteger) sectionIndex {
 return nil;
 }
 
 - (UIView *) tableView: (UITableView *) tableView viewForFooterInSection: (NSInteger) sectionIndex {
 return nil;
 }
 
 - (CGFloat) tableView: (UITableView *) tableView heightForHeaderInSection: (NSInteger) section {
 return 0;
 }
 
 - (CGFloat) tableView: (UITableView *) tableView heightForFooterInSection: (NSInteger) section {
 return 0;
 }
 
 - (BOOL) tableView: (UITableView *) tableView canEditRowAtIndexPath: (NSIndexPath *) indexPath {
 return YES;
 }
 
 - (void) tableView: (UITableView *) tableView willBeginEditingRowAtIndexPath: (NSIndexPath *) indexPath {
 }
 
 - (void) tableView: (UITableView *) tableView didEndEditingRowAtIndexPath: (NSIndexPath *) indexPath {
 }
 */


@end
