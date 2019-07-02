//
//  KSPokemon.m
//  PokedexObjC
//
//  Created by Madison Kaori Shino on 7/2/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

#import "KSPokemon.h"

//INITIALIZE PROPERTIES/METHODS FROM .H
@implementation KSPokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if (self != nil) {
        _pokemonName = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

//RETRIEVE JSON KEY:VALUES
@implementation KSPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    NSString *name = topLevelDictionary[@"name"];
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    NSArray *abilitiesDictionary = topLevelDictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionary isKindOfClass:[NSArray class]])
    {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    for (NSDictionary *dictionary in abilitiesDictionary)
    {
        NSDictionary *abilityDictionary = dictionary[@"ability"];
        NSString *abilityName = abilityDictionary[@"name"];
        [abilities addObject:abilityName];
    }
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
}

@end

//if (self != nil) == (self)
//check that the parent class was initialized, if so run memberwise initializer


//if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionary isKindOfClass:[NSArray class]]) {
//    return nil;
//if name is not a string or abilitiesDictionary is not an array, then leave

//for (NSDictionary *dictionary in abilitiesDictionary)
//iterate through the abilities array collection to grab the dictionary we want that is name:ability

/*
 TopLevelDictionary
 {
 "name": "pokemonName"
 "id": identifier(int)
 "abilities":[
    {
    "ability": {
                "name":"abilityName"
                }
    }
 ]
 }
 */
