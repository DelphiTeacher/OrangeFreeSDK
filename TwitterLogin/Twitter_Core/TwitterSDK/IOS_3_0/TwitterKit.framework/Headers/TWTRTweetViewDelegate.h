//
//  TWTRTweetViewDelegate.h
//
//  Copyright (c) 2015 Twitter. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TWTRSession;
@class TWTRTweet;
@class TWTRTweetView;
@class TWTRUser;
@protocol TWTRSessionStore;

NS_ASSUME_NONNULL_BEGIN

typedef void (^TWTRAuthenticationCompletionHandler)(id<TWTRSessionStore> sessionStore, NSString *userID);

/**
 Delegate for `TWTRTweetView` to receive updates on the user interacting with this particular Tweet view.

    // Create the tweet view
    TWTRTweetView *tweetView = [[TWTRTweetView alloc] initWithTweet:tweet];
    // Set the delegate
    tweetView.delegate = self;
 */
@protocol TWTRTweetViewDelegate <NSObject>

@optional

/**
 *  The tweet view image was tapped.
 *
 *  @param tweetView The Tweet view that was tapped.
 *  @param image     The exact UIImage data shown by the Tweet view.
 *  @param imageURL  The full URL of the image being shown.
 */
- (void)tweetView:(TWTRTweetView *)tweetView didTapImage:(UIImage *)image withURL:(NSURL *)imageURL;

/**
 * The Tweet view video was tapped.
 * If this method is not implemented a video player will be presented.
 *
 *  @param tweetView The Tweet view that was tapped.
 *  @param videoURL  The full URL of the video being shown.
 */
- (void)tweetView:(TWTRTweetView *)tweetView didTapVideoWithURL:(NSURL *)videoURL;

/**
 *  A URL in the text of a tweet was tapped. Implement to show your own webview rather than opening Safari.
 *
 *  @param tweetView The Tweet view that was tapped.
 *  @param url       The URL that was tapped.
 */
- (void)tweetView:(TWTRTweetView *)tweetView didTapURL:(NSURL *)url;

/**
 *  Called when the user's profile image is tapped.
 *  If this method is not implemented, the default behavior is to deep link into Twitter application or twitter.com in a webview.
 *
 *  @param tweetView The Tweet view that was tapped.
 *  @param user The Twitter user.
 */
- (void)tweetView:(TWTRTweetView *)tweetView didTapProfileImageForUser:(TWTRUser *)user;

/**
 *  Called when the Tweet is tapped.
 *  If this method is not implemented, the default behavior is to deep link into Twitter application or twitter.com in a webview.
 *
 *  @param tweetView The Tweet view that was tapped.
 *  @param tweet The Tweet that user tapped.
 */
- (void)tweetView:(TWTRTweetView *)tweetView didTapTweet:(TWTRTweet *)tweet;

@end

NS_ASSUME_NONNULL_END
