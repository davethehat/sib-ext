# sib-ext
Utilities for array, string and object handling for Sibelius ManuScript plugin development

## Introduction
While there are several useful functions lurking on the ManuScript Object class, the Sibelius object
and in the util package, (a) sometimes it's not clear which of these three you should be looking at
for a particular function, and (b) there are some useful abstractions now commonplace in languages
like JavaScript, Ruby, Python that are missing. The goal of the *Ext* plugin is firstly to provide
some of these additional string, array and object functions, and secondly to collect all these
methods (even when implemented on other objects) into one place.

A supplemental goal is to demonstrate the capabilities of the [sib-test] and [plgToMSS] package and
toolset. All the functions in sib-ext are unit-tested, and the source and test code are created in
the directory structure used by plgToMSS for ease of study and development.

Note that methods whose names start with underscores are not inteded to be used in code outside Ext

## String functions
All string functions return new strings - the passed strings are unchanged.

```javascript
// Trim spaces from left and right
result = Ext.Trim(string);

// Return a string of repetitions of a given character
result = Ext.StringOf(character, num);

// Add spaces or pad character to left of string making total length *length*
result = Ext.PadLeft(string, length);
result = Ext.PadLeftC(string, length, paddingCharacter);

// Add spaces or pad character to right of string making total length *length*
result = Ext.PadRight(string, length);
result = Ext.PadRightC(string, length, paddingCharacter);

// Add spaces or pad character to both ends of string to center it in length *length*
result = Ext.Center(string, length);
result = Ext.CenterC(string, length, paddingCharacter);

// The 'C' variants of the above take a string third parameter, the first
// character of this will be used instead of the default space
```

## Array functions - contents maniplulation

All array functions take a SparseArray as first argument. This set of functions
change the contents of the array.

```javascript
// Insert an item into array at position. Shifts contents to make room if necessary
// Returns the array
Ext.Insert(array, position,item);

// Remove an item from an array. Adjusts contents and length. Has no effect if
// position is equal to or greater than array length. Returns the array
Ext.Remove(array, position);

// Pluck an item from an array at position, removing the item and returning it.
// Returns null if position >= array length.
item = Ext.Pluck(array, position);

// Shift an item from the beginning of the array, removing it and returning it.
// Returns null if array is empty.
item = Ext.Shift(array);

// Unshift an item - insert it at the beginning of the array. Returns the item.
item = Ext.Unshift(array, item);
```

## Array functions - map, reduce and friends

These functions all take a SparseArray as a first argument. Map and filter methods
return a new array, reduce will return an object that depends on the passed accumulator
object and how it's handled in the reduce function.

All of these methods take an object and the name of a method on that object (this
could be a dictionary, or a plugin. To call functions defined in the current plugin, pass
```Self``` as the argument). The passed method is called on each item of the passed array,
given arguments as defined below - generally the item itself, its index in the array, and the
entire array object (the method called for Ext.Reduce takes an accumulator value as its first argument,
which is the return value of the call made on the previous item or the initial item seeded in the
call to Ext.Reduce).

An example to make this clear:

```javascript
numbers = CreateSparseArray(1,2,3,4,5,6);
evens = Ext.Filter(numbers, Self, '_even');
// evens is now [2,4,6]

sum = Ext.Reduce(numbers, Self, '_sum', 0);
// sum is 21

mapped = Ext.MapU(numbers, Self, '_adder', 10);
// mapped is [11,12,13,14,15,16]
...

function _even(number, index, array) {
  return (number % 2) = 0;
} //$end

...

function _sum(total, value, index, array) {
  return total + value;
} //$end

...

function _adder(value, index, array, number) {
  return value + number;
} //$end

```

The variants with a 'U' at the end of the name take an additional argument which is passed
to the applied function as a 'user' parameter - this object can be of any type, and can be
used to pass context or scope into the applied function.

```javascript

mapped = Ext.Map(sparseArray, context, methodName)
// form a new array from the result of applying apply context.@methodName to
// each item in sparseArray in turn. The called method:
// _mapFunc(item, index, array)

mapped = Ext.MapU(sparseArray, context, methodName, userData)
// _mapFunc(item, index, array, userData)

mapped = Ext.Map1(sparseArray, context, methodName)
mapped = Ext.Map1U(sparseArray, context, methodName, userData)
// calls _mapFunc(item, userData), i.e. a function with 1 arg only
// this lets you use Map1 with existing Manuscript functions of
// a single argument or two arguments, e.g. utils.UpperCase, utils.bwAND

Ext.Each(sparseArray, context, methodName)
Ext.EachU(sparseArray, context, methodName, userData)
// call context.@methodName on each item in sparseArray in turn
// No return value

Ext.Filter(sparseArray, context, methodName)
Ext.FilterU(sparseArray, context, methodName, userData)
// form a new array from the items in sparseArray for which the
// function context.@methodName(item, index, array) returns true

Ext.Reduce(sparseArray, context, methodName, seed)
Ext.ReduceU(sparseArray, context, methodName, seed, userData)
// return the value returned by the last application of the
// function context.@methodName(accumulator, item, index, array)
// where the first argument accumulator is the result of the
// call with the previous index, or seed if the item is the
// first item in the array. See the example above.
```javascript







