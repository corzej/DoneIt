// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DoneIt.m instead.

#import "_DoneIt.h"

const struct DoneItAttributes DoneItAttributes = {
	.content = @"content",
	.end = @"end",
	.start = @"start",
	.timeout = @"timeout",
};

const struct DoneItRelationships DoneItRelationships = {
};

const struct DoneItFetchedProperties DoneItFetchedProperties = {
};

@implementation DoneItID
@end

@implementation _DoneIt

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DoneIt" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DoneIt";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DoneIt" inManagedObjectContext:moc_];
}

- (DoneItID*)objectID {
	return (DoneItID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"timeoutValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"timeout"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic content;






@dynamic end;






@dynamic start;






@dynamic timeout;



- (BOOL)timeoutValue {
	NSNumber *result = [self timeout];
	return [result boolValue];
}

- (void)setTimeoutValue:(BOOL)value_ {
	[self setTimeout:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveTimeoutValue {
	NSNumber *result = [self primitiveTimeout];
	return [result boolValue];
}

- (void)setPrimitiveTimeoutValue:(BOOL)value_ {
	[self setPrimitiveTimeout:[NSNumber numberWithBool:value_]];
}










@end
