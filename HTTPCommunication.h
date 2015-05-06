//
//  HTTPCommunication.h
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPCommunication : NSObject <NSURLSessionDownloadDelegate>


//successBlock will contain the block you are going to call when the request is completed

@property (copy, nonatomic) void (^successBlock)(NSData *);


//craft and send using NSURLRequest and NSURLConnection

- (void)retrieveURL:(NSURL *)url
       successBlock:(void (^)(NSData *))successBlock;

//Task has finished downloading the delegate method

-(void)URLSession:(NSURLSession *)session
     downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location;


@end
