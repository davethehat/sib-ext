function Trim(string) {
  //$module(String.mss)
  i = 0;
  while (i + 1 < Length(string) and CharAt(string, i) = ' ') { i = i + 1; }

  j = Length(string) - 1;
  while (j >= i and CharAt(string, j) = ' ') { j = j - 1; }

  return Substring(string, i, j - i + 1);
} //$end

function PadLeft(string, length) {
  //$module(String.mss)
  return PadLeftC(string, length, SPACE);
} //$end

function PadLeftC(string, length, pad) {
  //$module(String.mss)
  return StringOf(pad, length - Length(string)) & string;
} //$end

function PadRight(string, length) {
  //$module(String.mss)
  return PadRightC(string, length, SPACE);
} //$end

function PadRightC(string, length, pad) {
  //$module(String.mss)
  return string & StringOf(pad, length - Length(string));
} //$end

function Center(string, length) {
  //$module(String.mss)
  return CenterC(string, length, SPACE);
} //$end

function CenterC(string, length, pad) {
  //$module(String.mss)
  diff = length - Length(string);
  if (diff <= 0) { return string; }
  ll = RoundDown(diff/2) + Length(string);
  return PadRightC(PadLeftC(string, ll, pad), length, pad);
} //$end


function StringOf(pad, num) {
  //$module(String.mss)
  pad = charAt(pad, 0);
  ret = '';
  while (num > 0) {
    ret = ret & pad;
    num = num - 1;
  }
  return ret;
} //$end
