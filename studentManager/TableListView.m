//
//  tableListView.m
//  studentManager
//
//  Created by DQuang on 3/6/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import "TableListView.h"
#import "ListView.h"

@interface tableListView ()

@end

NSString *tmpString;
@implementation tableListView

- (IBAction)diemToan:(id)sender {
    [self sortArrayWithString:@"diemtoan"];
}

- (IBAction)diemLy:(id)sender {
    [self sortArrayWithString:@"diemly"];
}

- (IBAction)diemVan:(id)sender {
    [self sortArrayWithString:@"diemvan"];
}

- (IBAction)diemSu:(id)sender {
    [self sortArrayWithString:@"diemsu"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sortArrayWithString:@"diemtoan"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listSV count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentView.layer.borderColor  = [UIColor blackColor].CGColor;
    cell.contentView.layer.borderWidth  = 0.25;
    NSMutableDictionary *tmp            = [_listSV objectAtIndex:indexPath.row];
    cell.fullName.text                  = [tmp objectForKey:@"fullname"];
    cell.info.text                      = [[tmp objectForKey:tmpString] stringValue];
    if (indexPath.row == 0) {
        cell.medal.image = [UIImage imageNamed:@"gold.png"];
    } else if (indexPath.row == 1) {
        cell.medal.image = [UIImage imageNamed:@"silver.png"];
    } else if (indexPath.row == 2) {
        cell.medal.image = [UIImage imageNamed:@"bronze.png"];
    } else {
        cell.medal.image = nil;
    }
    return cell;
}

-(void)viewDidAppear:(BOOL)animated {
    [_tableListView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listSV removeObjectAtIndex:indexPath.row];
        [_tableListView reloadData];
        NSLog(@"Delete Success");
    }
}

-(void)sortArrayWithString:(NSString *)string {
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:string
                                                 ascending:NO];
    NSMutableArray *sortDescriptors = [NSMutableArray arrayWithObject:sortDescriptor];
    NSArray *arrayToSort = [NSArray arrayWithArray:_listSV];
    [_listSV removeAllObjects];
    _listSV = [NSMutableArray arrayWithArray:[arrayToSort sortedArrayUsingDescriptors:sortDescriptors]];
    tmpString = string;
    [_tableListView reloadData];
    NSString *tittle;
    if ([tmpString isEqualToString:@"diemtoan"]) {
        tittle = @"Toán";
    } else if ([tmpString isEqualToString:@"diemly"]) {
        tittle = @"Lý";
    } else if ([tmpString isEqualToString:@"diemsu"]) {
        tittle = @"Sử";
    } else {
        tittle = @"Văn";
    }
    _lblTittle.text = [NSString stringWithFormat:@"Điểm Môn %@",tittle];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pushToListViewController:indexPath.row];
}

- (void)pushToListViewController:(NSInteger)index{
    listView            *listViewController;
    UIStoryboard *storyboard                      = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    listViewController              = [storyboard instantiateViewControllerWithIdentifier:@"listView"];
    [listViewController.listSV removeAllObjects];
    listViewController.listSV = [NSMutableArray arrayWithArray:_listSV];
    listViewController.indexSelected = index;
    listViewController.delegate = self;
    [self.navigationController pushViewController:listViewController animated:YES];

}

-(void)viewWillDisappear:(BOOL)animated{
    [_delegate sendDataToA:_listSV];
}

-(void)sendDataToA:(NSMutableArray *)array{
    [_listSV removeAllObjects];
    _listSV = [NSMutableArray arrayWithArray:array];
    NSLog(@"data forward OK %d",[_listSV count]);
}

@end
