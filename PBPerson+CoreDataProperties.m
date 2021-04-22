//
//  PBPerson+CoreDataProperties.m
//  PBCoreDataDemo
//
//  Created by wentao lu on 2021/4/22.
//
//

#import "PBPerson+CoreDataProperties.h"

@implementation PBPerson (CoreDataProperties)

+ (NSFetchRequest<PBPerson *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"PBPerson"];
}

@dynamic age;
@dynamic name;
@dynamic nation;

@end
