function Map1(sparseArray, context, func) {
//$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i]));
  }
  return ret;
}  //$end

﻿function Map2(sparseArray, context, func) {
//$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i], i));
  }
  return ret;
}  //$end

﻿function Map(sparseArray, context, func) {
//$module(ArrayFunctional.mss)
  ret = CreateSparseArray();

  for i = 0 to sparseArray.Length {
    ret.Push(context.@func(sparseArray[i], i, sparseArray));
  }
  return ret;
}  //$end

function Reduce(sparseArray, context, func, accumulator) {
//$module(Run.mss)
  for i = 0 to sparseArray.Length {
    accumulator = context.@func(accumulator, sparseArray[i], i, sparseArray);
  }
  return accumulator;
}  //$end
