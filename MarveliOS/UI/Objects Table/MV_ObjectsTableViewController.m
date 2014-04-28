//
//  MV_ObjectsTableViewController.m
//  MarveliOS
//
//  Created by Ben Gottlieb on 4/27/14.
//  Copyright (c) 2014 Stand Alone, Inc. All rights reserved.
//

#import "MV_ObjectsTableViewController.h"
#import "MV_Store.h"
#import "MVM_Object.h"
#import "MV_ServerQuery.h"
#import "NSManagedObjectContext+MV_.h"

#import <CoreData/CoreData.h>

@interface MV_ObjectsTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSString *sortKey;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) Class objectTypeClass;
@end

@implementation MV_ObjectsTableViewController

+ (instancetype) controllerForObjectType: (MV_Object_type) type {
	MV_ObjectsTableViewController		*controller = [self new];
	
	controller.objectType = type;
	return controller;
}

- (void) viewDidLoad {
	[super viewDidLoad];
	
}

//================================================================================================================
#pragma mark Properties

- (void) setObjectType: (MV_Object_type) type {
	if (type == _objectType) return;
	
	_objectType = type;
	
	self.objectTypeClass = [MV_Store classForObjectType: self.objectType];
	self.sortKey = [self.objectTypeClass defaultSortKey];

	NSFetchRequest				*request = self.fetchRequest;
	NSError						*error = nil;
	
	[NSFetchedResultsController deleteCacheWithName: nil];

	self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest: request
																		managedObjectContext: [MV_Store store].mainThreadContext
																		  sectionNameKeyPath: [self.sortKey stringByAppendingString: @"Initial"]
																				   cacheName: [self.objectTypeClass userVisiblePluralName]];
	
	
	self.fetchedResultsController.delegate = self;
	[self.fetchedResultsController performFetch: &error];
	[self.tableView reloadData];

	
	if ([[MV_Store store].mainThreadContext countForFetchRequest: request error: &error] == 0) {
		NSString					*title = [NSString stringWithFormat: @"Updating %@", [self.objectTypeClass userVisiblePluralName]];
		__block UIAlertView			*alert = [[UIAlertView alloc] initWithTitle: title message: @"Downloading…" delegate: nil cancelButtonTitle: nil otherButtonTitles: nil];
		[alert show];
		
		MV_ServerQuery				*query = [MV_ServerQuery queryForAllObjectsOfType: self.objectType];
		query.progressBlock = ^(CGFloat progress) {
			dispatch_async(dispatch_get_main_queue(), ^{
				[alert dismissWithClickedButtonIndex: 0 animated: NO];
				alert = [[UIAlertView alloc] initWithTitle: title message: [NSString stringWithFormat: @"Downloading… %.0f%%", progress * 100.0] delegate: nil cancelButtonTitle: nil otherButtonTitles: nil];
				[alert show];
			});
		};
		
		[query fetchWithCompletion:^(NSError *error) {
			dispatch_async(dispatch_get_main_queue(), ^{
				[alert dismissWithClickedButtonIndex: 0 animated: YES];
			});
		}];
	}
	
}

- (NSFetchRequest *) fetchRequest {
	NSArray					*sort = @[ [[NSSortDescriptor alloc] initWithKey: self.sortKey ascending: YES]];
	NSPredicate				*predicate = [NSPredicate predicateWithFormat: @"partialImport = false"];
	
	return [[MV_Store store].mainThreadContext mv_fetchRequestWithEntityName: [self.objectTypeClass entityName] predicate: predicate sortBy: sort fetchLimit: 0];
}

- (UIView *) disclaimerLabelForView: (UIView *) parent {
	CGFloat				height = 11;
	UILabel				*label = [[UILabel alloc] initWithFrame: CGRectMake(0, parent.bounds.size.height - height, parent.bounds.size.width, height)];
	
	label.backgroundColor = [UIColor colorWithWhite: 0.9 alpha: 0.5];
	label.font = [UIFont systemFontOfSize: 9];
	label.textAlignment = NSTextAlignmentCenter;
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	
	label.text = @"Data provided by Marvel. © 2014 Marvel";
	return label;
}

//================================================================================================================
#pragma mark FetchedResultsController delegate

- (void) controllerWillChangeContent: (NSFetchedResultsController *) controller {
	[self.tableView beginUpdates];
}

- (void) controller: (NSFetchedResultsController *) controller didChangeObject: (id) anObject atIndexPath: (NSIndexPath *) indexPath forChangeType: (NSFetchedResultsChangeType) type newIndexPath: (NSIndexPath *) newIndexPath {
	switch (type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertRowsAtIndexPaths: @[ newIndexPath] withRowAnimation: UITableViewRowAnimationBottom];
			break;

		case NSFetchedResultsChangeDelete:
			[self.tableView deleteRowsAtIndexPaths: @[ indexPath] withRowAnimation: UITableViewRowAnimationBottom];
			break;

		case NSFetchedResultsChangeUpdate:
			[self.tableView reloadRowsAtIndexPaths: @[ indexPath] withRowAnimation: UITableViewRowAnimationBottom];
			break;

		case NSFetchedResultsChangeMove:
			[self.tableView moveRowAtIndexPath: indexPath toIndexPath: newIndexPath];
			break;

	}
}

- (void) controller: (NSFetchedResultsController *) controller didChangeSection: (id <NSFetchedResultsSectionInfo>) sectionInfo atIndex: (NSUInteger) sectionIndex forChangeType: (NSFetchedResultsChangeType) type {
	switch (type) {
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections: [NSIndexSet indexSetWithIndex: sectionIndex] withRowAnimation: UITableViewRowAnimationBottom];
			break;
			
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections: [NSIndexSet indexSetWithIndex: sectionIndex] withRowAnimation: UITableViewRowAnimationBottom];
			break;
			
		default: break;
			
	}
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	[self.tableView endUpdates];
}

//================================================================================================================
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section { return [self.fetchedResultsController.sections[section] numberOfObjects]; }
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return self.fetchedResultsController.sections.count; }
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section { return [self.fetchedResultsController.sections[section] name]; }
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView { return [self.fetchedResultsController sectionIndexTitles]; }
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index { return [self.fetchedResultsController sectionForSectionIndexTitle: title atIndex: index]; }

- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath {
	UITableViewCell				*cell = [tableView dequeueReusableCellWithIdentifier: @"ident"];
	MVM_Object					*object = [self.fetchedResultsController.sections[indexPath.section] objects][indexPath.row];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"ident"];
	}
	
	cell.textLabel.text = object.mainTableText;
	cell.tag = indexPath.hash;
	cell.imageView.image = nil;
	
	[object fetchThumbnailWithCompletion:^(UIImage *image, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			if (indexPath.hash == cell.tag) cell.imageView.image = image;
			[cell setNeedsLayout];
		});
	}];
	return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	MVM_Object					*object = [self.fetchedResultsController.sections[indexPath.section] objects][indexPath.row];
	
	UIViewController			*controller = [UIViewController new];
	UIImageView					*imageView = [[UIImageView alloc] initWithFrame: self.view.bounds];
	
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	controller.view = imageView;
	controller.title = object.mainTableText;
	
	[imageView addSubview: [self disclaimerLabelForView: imageView]];
	
	[self.navigationController pushViewController: controller animated: YES];
	[object fetchFullScreenImageWithCompletion:^(UIImage *image, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			imageView.image = image;
		});
	}];

}

- (UIView *) tableView: (UITableView *) tableView viewForFooterInSection: (NSInteger) section {
	return [self disclaimerLabelForView: tableView];
}

- (CGFloat) tableView:(UITableView *) tableView heightForFooterInSection:(NSInteger)section { return  11; }

@end
