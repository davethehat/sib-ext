function TestArrayInsert(assert, plugin) {
  //$module(TestArray.mss)
  a = CreateSparseArray();

  a[0] = 100;
  a[1] = 200;
  a[2] = 300;

  plugin.Insert(a, 1, 'hello');
  assert.Equal(a.Length, 4, 'Expected length');
  assert.Equal(a[1],'hello', 'Expected inserted element');
} //$end

function TestArrayRemove(assert, plugin) {
  //$module(TestArray.mss)
  a = CreateSparseArray();

  a[0] = 100;
  a[1] = 200;
  a[2] = 300;

  plugin.Remove(a, 1);
  assert.Equal(a.Length, 2, 'Expected length');
  assert.Equal(a[0],100, 'Expected first element as it was');  
  assert.Equal(a[1],300, 'Expected element shuffled down');

  plugin.Remove(a,10);
  assert.Equal(a.Length, 2, 'Expected length unchaged after remove of non-existent position');
  assert.Equal(a[0],100, 'Expected first element as it was');  
  assert.Equal(a[1],300, 'Expected second element as it was');
} //$end

function TestArrayShift(assert, plugin) {
  //$module(TestArray.mss)
  a = CreateSparseArray();

  a[0] = 100;
  a[1] = 200;
  a[2] = 300;

  item = plugin.Shift(a);
  assert.Equal(a.Length, 2, 'Expected length');
  assert.Equal(a[0],200, 'Expected first element as it was');  
  assert.Equal(a[1],300, 'Expected element shuffled down');
  assert.Equal(item, 100, 'Expected value of shifted item');

  b = CreateSparseArray();
  item = plugin.Shift(b);
  assert.Equal(item, null, 'Expected null value when shifting from empty array');
} //$end

function TestArrayUnshift(assert, plugin) {
  //$module(TestArray.mss)
  a = CreateSparseArray();

  plugin.Unshift(a, 'world');
  assert.Equal(a.Length, 1, 'Expected length after unshifting 1 item');
  assert.Equal(a[0], 'world', 'Expected first item');

  plugin.Unshift(a, 'hello');
  assert.Equal(a.Length, 2, 'Expected length after unshifting 2 items');
  assert.Equal(a[0], 'hello', 'Expected first item');
  assert.Equal(a[1], 'world', 'Expected second item');
} //$end
