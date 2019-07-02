//
//  KSPokemon.h
//  PokedexObjC
//
//  Created by Madison Kaori Shino on 7/2/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSPokemon : NSObject

//PROPERTIES
@property (nonatomic, copy, readonly) NSString *pokemonName;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

//DESIGNATED INITIALIZER
- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities;

@end

//EXTENSION FOR NEXT LEVEL DICTIONARY
@interface KSPokemon (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END


//.h = declare
//.m = implement

//readonly = 'let' constant

//'< >' to declare a generic

//@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
//*1, for the inidvidual strings
//*2, for the abilities array
