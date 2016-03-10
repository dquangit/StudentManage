//
//  highestScoreView.m
//  studentManager
//
//  Created by DQuang on 3/4/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import "HighestScoreView.h"

@interface highestScoreView ()

@end


@implementation highestScoreView



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFrame];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)diemVan:(id)sender {
    [self showInfoOfMon:@"diemvan"];
}

- (IBAction)diemToan:(id)sender {
    [self showInfoOfMon:@"diemtoan"];
}

- (IBAction)diemSu:(id)sender {
    [self showInfoOfMon:@"diemsu"];
}
- (IBAction)diemLy:(id)sender {
    [self showInfoOfMon:@"diemly"];
}
- (void)setFrame {
    _fullName.enabled   = NO;
    _score.enabled      = NO;
}

-(int)highestScoreWithString:(NSString *)string {
    int indexOfMaxValue = 0;
    NSInteger quantity  = [_listSV count];
    for (int i = 1;  i < quantity; i++) {
        if ([[[_listSV objectAtIndex:indexOfMaxValue] objectForKey:string] floatValue ] < [[[_listSV objectAtIndex:i] objectForKey:string] floatValue])
            indexOfMaxValue = i;
    }
    return indexOfMaxValue;
}

- (void)showInformationOfIndex :(int)index string:(NSString *)string{
    if ([_listSV count] > 0) {
        _fullName.text  = [[_listSV objectAtIndex:index] objectForKey:@"fullname"];
        _score.text     = [[[_listSV objectAtIndex:index] objectForKey:string] stringValue];
        NSString *mon;
        if ([string isEqualToString:@"diemvan"])
        {
            mon = @"Môn Văn";
        } else if ([string isEqualToString:@"diemtoan"]){
            mon = @"Môn Toán";
        } else if ([string isEqualToString:@"diemly"]){
            mon = @"Môn Lý";
        } else {
            mon = @"Môn Sử";
        }
        _lblTitle.text = [NSString stringWithFormat:@"Điểm Cao Nhất %@",mon];
    } else {
        _fullName.text  = @"";
        _score.text     = @"";
        _lblTitle.text  = @"Điểm Cao Nhất";
    }
}

-(void)showInfoOfMon:(NSString *)string {
    int index = [self highestScoreWithString:string];
    [self showInformationOfIndex:index string:string];
}

- (void)viewDidAppear:(BOOL)animated {
    if ([_listSV count] < 1) {
        _fullName.text  = @"";
        _score.text     = @"";
        _lblTitle.text  = @"Điểm Cao Nhất";
    }
}

@end
