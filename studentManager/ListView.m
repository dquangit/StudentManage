//
//  listView.m
//  studentManager
//
//  Created by DQuang on 3/4/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import "listView.h"
UIAlertView *alert;
@interface listView ()

@end

@implementation listView


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFrame];
    NSLog(@"_listSV count: %d",[_listSV count]);
    NSLog(@"asdsad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnFirst:(id)sender {
    _indexSelected = 0;
    [self showInformationOfIndex:0];
    
}

- (IBAction)btnPrevious:(id)sender {
    _indexSelected--;
    [self check_indexSelected];
    [self showInformationOfIndex:_indexSelected];
}

- (IBAction)btnNext:(id)sender {
    _indexSelected++;
    [self check_indexSelected];
    [self showInformationOfIndex:_indexSelected];
}

- (IBAction)btnLast:(id)sender {
    _indexSelected = [_listSV count] - 1;
    [self showInformationOfIndex:_indexSelected];
}

- (IBAction)btnDelete:(id)sender {
    [alert show];
    
}

- (void)setFrame {
    _fullName.enabled   = NO;
    _birth.enabled      = NO;
    _diemToan.enabled   = NO;
    _diemLy.enabled     = NO;
    _diemSu.enabled     = NO;
    _diemVan.enabled    = NO;
    [self showInformationOfIndex:_indexSelected];
    alert               = [[UIAlertView alloc]
                           initWithTitle        :@"Cảnh báo "
                           message              :@"Bạn có thực sự muốn xoá?"
                           delegate             :self
                           cancelButtonTitle    :@"OK"
                           otherButtonTitles    :@"Cancel",
                           nil];
}
- (void)showInformationOfIndex:(int)index{
    if ([_listSV count] > 0) {
    NSMutableDictionary *sinhvien   =  [_listSV objectAtIndex:index];
    _fullName.text                  = [sinhvien objectForKey        :@"fullname"];
    _birth.text                     = [sinhvien objectForKey        :@"birth"];
    _diemVan.text                   = [[sinhvien objectForKey       :@"diemvan"]    stringValue];
    _diemToan.text                  = [[sinhvien objectForKey       :@"diemtoan"]   stringValue];
    _diemSu.text                    = [[sinhvien objectForKey       :@"diemsu"]     stringValue];
    _diemLy.text                    = [[sinhvien objectForKey       :@"diemly"]     stringValue];
    _counter.text                   = [NSString stringWithFormat    :@"%d/%d",_indexSelected + 1,[_listSV count]];
    _btnDelete.enabled              = YES;
    NSLog(@"%@",sinhvien);
    } else {
    if ([_listSV count] == 0) {
        _fullName.text      = @"";
        _birth.text         = @"";
        _diemVan.text       = @"";
        _diemToan.text      = @"";
        _diemSu.text        = @"";
        _diemLy.text        = @"";
        [self check_indexSelected];
        _counter.text       = [NSString stringWithFormat:@"%d/%d",0 ,[_listSV count]];}
        _btnDelete.enabled  = NO;
        
    }
}

- (void)check_indexSelected{
    if (_indexSelected < 0 &&
        [_listSV count] >= 1) {
        _indexSelected = [_listSV count] - 1;
    } else if (_indexSelected >= [_listSV count]) {
                _indexSelected = 0;
            }

}

-(void)viewWillDisappear:(BOOL)animated{
    [_delegate sendDataToA:_listSV];
}

-(void)viewDidAppear:(BOOL)animated {
    [self showInformationOfIndex:_indexSelected];
}

-(void)alertView :(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [_listSV removeObjectAtIndex:_indexSelected];
        if (_indexSelected >= [_listSV count]) {
            _indexSelected--;
        }
        [self check_indexSelected];
        [self showInformationOfIndex:_indexSelected];
    }
}



@end
