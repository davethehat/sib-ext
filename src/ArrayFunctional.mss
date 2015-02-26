function Each(sparseArray, context, func) {
  for i = 0 to sparseArray.Length {
    context.@func(sparseArray[i], i, sparseArray);
  }
} //$end

function EachU(sparseArray, context, func, user) {
  for i = 0 to sparseArray.Length {
    context.@func(sparseArray[i], i, sparseArray, user);
  }
} //$end

function Map1(sparseArray, context, func) {
  //$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i]));
  }
  return ret;
} //$end

﻿function Map1U(sparseArray, context, func, user) {
  //$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i], user));
  }
  return ret;
} //$end

function Map(sparseArray, context, func) {
  //$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i], i, sparseArray));
  }
  return ret;
} //$end

function MapU(sparseArray, context, func, user) {
  //$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i], i, sparseArray, user));
  }
  return ret;
} //$end

function Reduce(sparseArray, context, func, accumulator) {
  //$module(Run.mss)
  for i = 0 to sparseArray.Length {
    accumulator = context.@func(accumulator, sparseArray[i], i, sparseArray);
  }
  return accumulator;
} //$end

function ReduceU(sparseArray, context, func, accumulator, user) {
  //$module(Run.mss)
  for i = 0 to sparseArray.Length {
    accumulator = context.@func(accumulator, sparseArray[i], i, sparseArray, user);
  }
  return accumulator;
} //$end

function Filter(sparseArray, context, func) {
  //$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    if (context.@func(sparseArray[i], i, sparseArray)) {
      ret.Push(context.@func(sparseArray[i], i, sparseArray));
    }
  }
  return ret;
} //$end

function FilterU(sparseArray, context, func, user) {
  //$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    if (context.@func(sparseArray[i], i, sparseArray)) {
      ret.Push(sparseArray[i]);
    }
  }
  return ret;
} //$end
