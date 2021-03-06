function Insert(array, position, item) {
  //$module(Array.mss)

  if (position >= array.Length) {
    array[position] = item;
    return array;
  }

  index = array.Length;
  for i = position to (array.Length) {
    array[index] = array[index-1];
    index = index - 1;
  }
  array[position] = item;

  return array;
} //$end

function Remove(array, position) {
  //$module(Array.mss)

  if (position >= array.Length) {
    return array;
  }

  for i = position to array.Length - 1 {
    array[i] = array[i+1];
  }
  array.Length = array.Length - 1;
  return array;
} //$end

function Shift(array) {
  //$module(Array.mss)
  if (array.Length = 0) {
    return null;
  }
  ret = array[0];
  Remove(array, 0);
  return ret;
} //$end

function Unshift(array, item) {
  //$module(Array.mss)
  Insert(array, 0, item);
  return item;
} //$end

function Pluck(array, position) {
  //$module(Array.mss)
  if (position >= array.Length) {
    return null;
  }
  ret = array[position];
  Remove(array, position);
  return ret;
} //$end

