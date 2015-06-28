//
//  LSCMenuViewCOntroller.m
//  侧面菜单
//
//  Created by 兜麦 on 15/6/28.
//  Copyright (c) 2015年 ShengCheng. All rights reserved.
//

#import "LSCMenuViewCOntroller.h"
#define LSCRandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0]

@implementation LSCMenuViewCOntroller

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = LSCRandomColor;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = LSCRandomColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd - %zd", indexPath.section, indexPath.row];
    return cell;
}


@end
