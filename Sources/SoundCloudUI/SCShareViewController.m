/*
 * Copyright 2010, 2011 nxtbgthng for SoundCloud Ltd.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 *
 * For more information and documentation refer to
 * http://soundcloud.com/api
 * 
 */

#import "UIViewController+SoundCloudUI.h"
#import "UIDevice+SoundCloudUI.h"

#import "SCRecordingSaveViewController.h"


#import "SCShareViewController.h"

@interface SCShareViewController ()
- (SCRecordingSaveViewController *)recordSaveController;
@end


@implementation SCShareViewController

#pragma mark Class methods

+ (SCShareViewController *)shareViewControllerWithFileURL:(NSURL *)aFileURL
                                        completionHandler:(SCSharingViewControllerCompletionHandler)aCompletionHandler;
{
    SCRecordingSaveViewController *recView = [[SCRecordingSaveViewController alloc] init];
    if (!recView) return nil;
    
    [recView setFileURL:aFileURL];
    [recView setCompletionHandler:aCompletionHandler];
    
    SCShareViewController *shareViewController = [[SCShareViewController alloc] initWithRootViewController:recView];
    [shareViewController setModalPresentationStyle:UIModalPresentationFormSheet];
    return shareViewController;
}

+ (SCShareViewController *)shareViewControllerWithFileData:(NSData *)someData
                                         completionHandler:(SCSharingViewControllerCompletionHandler)aCompletionHandler;
{
    SCRecordingSaveViewController *recView = [[SCRecordingSaveViewController alloc] init];
    if (!recView) return nil;
    
    [recView setFileData:someData];
    [recView setCompletionHandler:aCompletionHandler];
    
    SCShareViewController *shareViewController = [[SCShareViewController alloc] initWithRootViewController:recView];
    [shareViewController setModalPresentationStyle:UIModalPresentationFormSheet];
    return shareViewController;
}


#pragma mark Accessors

- (void)setPrivate:(BOOL)isPrivate;
{
    [self.recordSaveController setPrivate:isPrivate];
}

- (void)setDownloadable:(BOOL)downloadable
{
    [self.recordSaveController setDownloadable:downloadable];
}

- (void)setCoverImage:(UIImage *)aCoverImage;
{
    [self.recordSaveController setCoverImage:aCoverImage];
}

- (void)setTitle:(NSString *)aTitle;
{
    [self.recordSaveController setTitle:aTitle];
}

- (void)setLocationTitle: (NSString*)aLocationTitle
{
    [self.recordSaveController setLocationTitle: aLocationTitle];
}

- (void)setCreationDate:(NSDate *)aDate;
{
    [self.recordSaveController setCreationDate:aDate];
}

- (void)setTags:(NSArray *)someTags;
{
    [self.recordSaveController setTags:someTags];
}

- (void)setBpm:(NSString *)aBmp;
{
	[self.recordSaveController setBpm:aBmp];
}

- (void)setSharingNote:(NSString *)aSharingNote;
{
    [self.recordSaveController setSharingNote:aSharingNote];
}

- (void)setCustomParameters:(NSDictionary*)dictionary;
{
    [self.recordSaveController setCustomParameters:dictionary];
}

- (SCRecordingSaveViewController *)recordSaveController;
{
    return (SCRecordingSaveViewController *)self.topViewController;
}


#pragma mark Foursquare

- (void)setFoursquareClientID:(NSString *)aClientID
                 clientSecret:(NSString *)aClientSecret;
{
    [self.recordSaveController setFoursquareClientID:aClientID
                                        clientSecret:aClientSecret];
}

#pragma View Controller

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
	return UIInterfaceOrientationMaskAll;
//	if ([UIDevice isIPad]) {
//		return UIInterfaceOrientationMaskAll;
//	}
//	return UIInterfaceOrientationMaskAllButUpsideDown;
}



@end
