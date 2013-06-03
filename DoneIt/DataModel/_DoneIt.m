// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DoneIt.m instead.

#import "_DoneIt.h"

const struct DoneItAttributes DoneItAttributes = {
	.content = @"content",
	.day = @"day",
	.end = @"end",
	.month = @"month",
	.start = @"start",
	.timeout = @"timeout",
	.year = @"year",
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
	
	if ([key isEqualToString:@"dayValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"day"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"monthValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"month"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"timeoutValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"timeout"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"yearValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"year"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic content;






@dynamic day;



- (int16_t)dayValue {
	NSNumber *result = [self day];
	return [result shortValue];
}

- (void)setDayValue:(int16_t)value_ {
	[self setDay:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveDayValue {
	NSNumber *result = [self primitiveDay];
	return [result shortValue];
}

- (void)setPrimitiveDayValue:(int16_t)value_ {
	[self setPrimitiveDay:[NSNumber numberWithShort:value_]];
}





@dynamic end;






@dynamic month;



- (int16_t)monthValue {
	NSNumber *result = [self month];
	return [result shortValue];
}

- (void)setMonthValue:(int16_t)value_ {
	[self setMonth:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveMonthValue {
	NSNumber *result = [self primitiveMonth];
	return [result shortValue];
}

- (void)setPrimitiveMonthValue:(int16_t)value_ {
	[self setPrimitiveMonth:[NSNumber numberWithShort:value_]];
}





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





@dynamic year;



- (int16_t)yearValue {
	NSNumber *result = [self year];
	return [result shortValue];
}

- (void)setYearValue:(int16_t)value_ {
	[self setYear:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveYearValue {
	NSNumber *result = [self primitiveYear];
	return [result shortValue];
}

- (void)setPrimitiveYearValue:(int16_t)value_ {
	[self setPrimitiveYear:[NSNumber numberWithShort:value_]];
}










@end
