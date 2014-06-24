//
//  EZSImageView.h
//
//  Created by Zeke Shearer on 2/4/14.
//  Copyright (c) 2014 Zeke Shearer. All rights reserved.
//

#import "EZSImageView.h"
#import "AFNetworking.h"

@interface EZSImageCache : NSCache

- (UIImage *)cachedImageForRequest:(NSURLRequest *)request;
- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request;

@end

@interface EZSImageView ()

@property (strong, nonatomic) NSOperationQueue *operationQueue;

@end

@implementation EZSImageView

+ (EZSImageCache *)imageCache {
    static EZSImageCache *_cdImageCache = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _cdImageCache = [[EZSImageCache alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * __unused notification) {
            [_cdImageCache removeAllObjects];
        }];
    });
    
    return _cdImageCache;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self ) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    if ( !self.operationQueue ) {
        self.operationQueue = [[NSOperationQueue alloc] init];
    }
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.imageView];
    self.imageView.backgroundColor = self.backgroundColor;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

- (void)setContentMode:(UIViewContentMode)contentMode
{
    self.imageView.contentMode = contentMode;
    [self layoutSubviews];
}

- (UIViewContentMode)contentMode
{
    return self.imageView.contentMode;
}

- (void)setImageAtURL:(NSURL *)url
{
    self.imageURL = url;
    NSMutableURLRequest *request;
    UIImage *cachedImage;
    AFHTTPRequestOperation *operation;
    
    request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];
    request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    request.HTTPShouldUsePipelining = YES;
    
    self.imageView.frame = self.bounds;
    cachedImage = [[[self class] imageCache] cachedImageForRequest:request];
    if ( cachedImage ) {
        self.imageView.image = cachedImage;
        [self setNeedsLayout];
        return;
    } else {
        self.imageView.image = nil;
        [self setNeedsLayout];
    }
    
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.imageView.image = [UIImage imageWithData:responseObject];
    } failure:nil];
    
    [self.operationQueue cancelAllOperations];
    [self.operationQueue addOperation:operation];
    
}

@end

@implementation EZSImageCache

static inline NSString * CDImageCacheKeyFromURLRequest(NSURLRequest *request)
{
    return [[request URL] absoluteString];
}


- (UIImage *)cachedImageForRequest:(NSURLRequest *)request
{
    switch ([request cachePolicy]) {
        case NSURLRequestReloadIgnoringCacheData:
        case NSURLRequestReloadIgnoringLocalAndRemoteCacheData:
            return nil;
        default:
            break;
    }
    return [self objectForKey:CDImageCacheKeyFromURLRequest(request)];
}

- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request
{
    if (image && request) {
        [self setObject:image forKey:CDImageCacheKeyFromURLRequest(request)];
    }
}

@end
