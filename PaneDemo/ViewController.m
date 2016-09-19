//
//  ViewController.m
//  PaneDemo
//
//  Created by Ruby on 8/23/16.
//  Copyright © 2016 Ruby. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //web page
    NSString *webUrl = @"https://www.facebook.com/UniversityofDelhi/";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webUrl]];
    [self.webView loadRequest:request];
    
    //map
    
    double latitude=28.5842743;
    double longitude=77.1616442;
    
    MKPointAnnotation *bangalore = [[MKPointAnnotation alloc] init];
    bangalore.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    bangalore.title=@"University of Delhi";
    [self.mapView addAnnotation:bangalore];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(bangalore.coordinate, 10000, 10000);
    
    MKCoordinateRegion adjustRegion = [self.mapView regionThatFits:region];
    [self.mapView setRegion:adjustRegion animated:YES];
   
}


@end
