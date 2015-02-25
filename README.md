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
