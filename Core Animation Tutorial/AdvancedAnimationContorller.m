//
//  AdvancedAnimationContorller.m
//  Core Animation Tutorial
//
//  Created by LU YAJUN  on 12/2/14.
//  Copyright (c) 2014 Oklahoma state university. All rights reserved.
//

#import "AdvancedAnimationContorller.h"

@interface AdvancedAnimationContorller ()

@property (strong,nonatomic) NSMutableArray *AdvancedAnimationList;
@property (strong,nonatomic) NSMutableArray *detailAdvancedAnimationList;

@end

@implementation AdvancedAnimationContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.AdvancedAnimationList = [NSMutableArray arrayWithCapacity:5];
    self.detailAdvancedAnimationList = [NSMutableArray arrayWithCapacity:5];
    
    NSArray *myArray =@[@"Snow Animation",@"Merry Christmas Animation"];
    NSArray *myDetailArray =@[@"Show big snow animation",@"Show fireworks and gift animation for Merry Christmas"];
    
    self.AdvancedAnimationList = [NSMutableArray arrayWithArray:myArray];
    self.detailAdvancedAnimationList = [NSMutableArray arrayWithArray:myDetailArray];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.AdvancedAnimationList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"advancedAnimation" forIndexPath:indexPath];
    
    cell.textLabel.text= [self.AdvancedAnimationList objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    cell.detailTextLabel.text=[self.detailAdvancedAnimationList objectAtIndex:indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        
        [self performSegueWithIdentifier:@"a1" sender:self];
        
    }
    else if (indexPath.row==1)
        
    {
        [self performSegueWithIdentifier:@"a2" sender:self];
    }
    

    
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
