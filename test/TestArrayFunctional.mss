function TestArrayMap(assert, plugin) {
  //$module(TestArrayFunctional.mss)
  a = CreateSparseArray(1,2,3);
  b = plugin.Map(a, Self, '_mapFunc');

  assert.Equal(b.Length, 3, 'Expected length');

  result = b[0];
  assert.Equal(result[0], 2, 'Expected mapped value 0');
  assert.Equal(result[1], 0, 'Expected index 0');
  assert.Equal(result[2], a, 'Expected array 0');

  result = b[1];
  assert.Equal(result[0], 4, 'Expected mapped value 1');
  assert.Equal(result[1], 1, 'Expected index 1');
  assert.Equal(result[2], a, 'Expected array 1');

  result = b[2];
  assert.Equal(result[0], 6, 'Expected mapped value 2');
  assert.Equal(result[1], 2, 'Expected index 2');
  assert.Equal(result[2], a, 'Expected array 2');
} //$end

function TestArrayMap1(assert, plugin) {
  //$module(TestArrayFunctional.mss)
  a = CreateSparseArray(1,2,3);
  b = plugin.Map1(a, Self, '_map1Func');

  assert.Equal(b.Length, 3, 'Expected length');
  assert.Equal(b[0], 2, 'Expected mapped value 0');
  assert.Equal(b[1], 4, 'Expected mapped value 0');
  assert.Equal(b[2], 6, 'Expected mapped value 0');
} //$end

function TestArrayMap1U(assert, plugin) {
  //$module(TestArrayFunctional.mss)
  a = CreateSparseArray(1,2,3);
  b = plugin.Map1U(a, Self, '_map1UFunc', 3);

  assert.Equal(b.Length, 3, 'Expected length');
  assert.Equal(b[0], 3, 'Expected mapped value 0');
  assert.Equal(b[1], 6, 'Expected mapped value 0');
  assert.Equal(b[2], 9, 'Expected mapped value 0');
} //$end

function TestArrayMapU(assert, plugin) {
  //$module(TestArrayFunctional.mss)
  a = CreateSparseArray(1,2,3);
  b = plugin.MapU(a, Self, '_mapUFunc', 3);

  assert.Equal(b.Length, 3, 'Expected length');

  result = b[0];
  assert.Equal(result[0], 4, 'Expected mapped value 0');
  assert.Equal(result[1], 0, 'Expected index 0');
  assert.Equal(result[2], a, 'Expected array 0');

  result = b[1];
  assert.Equal(result[0], 5, 'Expected mapped value 1');
  assert.Equal(result[1], 1, 'Expected index 1');
  assert.Equal(result[2], a, 'Expected array 1');

  result = b[2];
  assert.Equal(result[0], 6, 'Expected mapped value 2');
  assert.Equal(result[1], 2, 'Expected index 2');
  assert.Equal(result[2], a, 'Expected array 2');
} //$end


function TestArrayReduce(assert, plugin) {
  //$module(testArrayFunctional.mss)
  a = CreateSparseArray(1,2,3);
  b = plugin.Reduce(a, Self, '_reduceFunc', 0);

  assert.Equal(b, 6, 'Expected sum of items reduced in array');
} //$end

function TestArrayFilter(assert, plugin) {
  //$module(testArrayFunctional.mss)
  a = CreateSparseArray(1,2,3,4,5);
  b = plugin.Filter(a, Self, '_filterFunc');

  assert.Equal(b.Length, 2, 'Expected number of items in filtered array');
  assert.Equal(b[0], 2, 'Expected first item');
  assert.Equal(b[1], 4, 'Expected second item');
} //$end


function _mapFunc(value, index, array) {
  //$module(TestArrayFunctional.mss)
  return CreateSparseArray(value * 2, index, array);
} //$end

function _map1Func(value) {
  //$module(TestArrayFunctional.mss)
  return value * 2;
} //$end

function _mapFunc(value, index, array) {
  //$module(TestArrayFunctional.mss)
  return CreateSparseArray(value * 2, index, array);
} //$end

function _mapUFunc(value, index, array, user) {
  //$module(TestArrayFunctional.mss)
  return CreateSparseArray(value + user, index, array);
} //$end

function _map1Func(value) {
  //$module(TestArrayFunctional.mss)
  return value * 2;
} //$end

function _map1UFunc(value, user) {
  //$module(TestArrayFunctional.mss)
  return value * user;
} //$end

function _reduceFunc(accumulator, value, index, array) {
  //$module(TestArrayFunctional.mss)
  return accumulator + value;
} //$end

function _filterFunc(value, index, array) {
  return (value % 2 = 0);
} //$end
