//
//  HTTPCommunication.m
//  BikeShare
//
//  Created by Daniel Kwiatkowski on 2015-05-06.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "HTTPCommunication.h"

@implementation HTTPCommunication

-(void)retrieveURL:(NSURL *)url successBlock:(void (^)(NSData *))successBlock
{
    //persisting given successBlock for calling it later
    self.successBlock = successBlock;
    //creating the request using the given url
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    //creating a session using the default configuration and setting our instance and delegate
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:nil];
    //preparing the download task
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request];
    //establishing a connection
    [task resume];
}

-(void)URLSession:(NSURLSession *)session
     downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    //getting the data from local storage
    NSData *data = [NSData dataWithContentsOfURL:location];
    dispatch_async(dispatch_get_main_queue(), ^{
    //calling the block stored before as as a callback
        self.successBlock(data);
    });
}




@end
