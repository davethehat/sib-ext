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
  return _spaces(length - Length(string)) & string;
} //$end

function PadRight(string, length) {
  //$module(String.mss)
  return string & _spaces(length - Length(string));
} //$end

function Center(string, length) {
  //$module(String.mss)
  diff = length - Length(string);
  if (diff <= 0) { return string; }
  ll = RoundDown(diff/2) + Length(string);
  return PadRight(PadLeft(string, ll), length);
} //$end

function _spaces(numSpaces) {
  //$module(String.mss)
  padding = '';
  while (numSpaces > 0) {
    padding = padding & ' ';
    numSpaces = numSpaces - 1;
  }
  return padding;
} //$end
