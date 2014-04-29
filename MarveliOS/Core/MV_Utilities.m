

NSString * const NO_IMAGE_AVAILABLE_PATH = @"http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available";

NSString * const MV_ErrorDomain = @"MV_ErrorDomain";



@implementation UIAlertView (MV_)
+ (void) showAlertWithTitle: (NSString *) title message: (NSString *) message {
	dispatch_async(dispatch_get_main_queue(), ^{
		UIAlertView			*alert = [[UIAlertView alloc] initWithTitle: title message: message delegate: nil cancelButtonTitle: NSLocalizedString(@"OK", @"OK") otherButtonTitles: nil];
	
		[alert show];
	});
}
@end