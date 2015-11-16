# rubyはすべてのデータがオブジェクト

# 文字列出力
print("Hello");

puts("Hello")
puts("World")

# comment on single line
=begin
 comment on multiple
 lines
=end

# 以下、すべておなじ
String.new("Hello");
String.new('Hello');
'Hello'

print ("こんにちは".class())
print ("こんにちは\n")
print ('こんにちは\n')

# 以下、%Q="",%q=''
%Q{こんにちは\n}
%Q(こんにちは\n)
%Q[こんにちは\n]
%Q<こんにちは\n>
%q{こんにちは\n}
print(%Q{こんにちは\n})
print(%q{こんにちは\n})

# ヒアドキュメント
print(<<"EOS")
がーっはっはっは
がーっはっはっは
EOS

# 文字列中で計算・展開
print("こんにちは、きょうは#{20-5}日です。")
name = "東京"
print("出身は #{name} です")

# 文字列連結
name = "東京都" + "港区";
print (name);
name += "赤坂";
print(name);
name << "です"
print(name);
name.concat("よー")
print(name);


# 文字列繰り返し 文字列*回数,回数*文字列はNG
src = "GOOD!"
num = 3
str = src * num
print(str)

# 数値
x10 = 214
x2x10 = 0b110111
x8x10 = 0123
x16x10 = 0xD1
print(x10, "\n");
print(x2x10, "\n");
print(x8x10, "\n");
print(x16x10, "\n");

# 数値表現に関して変な表現方法がある.アンスコで区切り文字として表現できる
num = 123456;
xnum = 123_456;
# __を重ねるとNG。xnum = 123__456;

print("5 * 3 = ", 5 * 3, "\n");


# 定数
# 1文字目は英大文字
# 2文字目以降は英数文字、アンダーバー
# 予約後は使用できない
# 変更するとエラーとなる
MODE = "定数"
Color = "定数"
var = "ノット定数"
cOLOR = "ノット定数"


# 条件
# if then    end. thenは省略可能
hoge = 1
if hoge != 0 then
  print("hoge != 0\n")
end

if hoge != 0
  print("hoge != 0\n")
end

# false, nil はif内ではfalse扱いとなる
hoge = nil
if !hoge
  print("hoge == 0\n")
end

# elsif, else
hoge = 1
if hoge == 1 then
  print("hoge = ", hoge)
elsif hoge == nil then
  print("hoge = nil")
else
  print("hoge != ", hoge)
end

# unless
unless hoge == 1 then
  print("hoge != 1\n")
else
  print("hoge == 1\n")
end

# not switch! case!
# thenは省略可能
case hoge
when 2 then
  print("2\n")
when 3 then
  print("3\n")
else
  print("else\n")
end

# 条件演算子 条件式 ? 真の時の値 : 偽の時の値

# 実行 if 条件式 は下記と等価
#if hoge == 1 then
#  print("hoge", hoge)
#end
print("hoge == 1\n") if hoge == 1
# unlessも同様に記載できる
print("hoge == 1\n") unless hoge != 1

# while 条件式 do
# end
# +=はあるが、++（インクリメント）は存在しない
hoge = 0
while hoge != 5 do
  print(hoge)
  hoge += 1;
end

# 真の時に実行する式 while 条件式 も等価
print("\nnext while\n");
hoge = 5
(print(hoge);hoge-=1) while hoge !=0

# until 条件式 do
# whileの逆条件式が偽の間はループ処理を実行する
# end
hoge = 5
until hoge == 0 do
  print(hoge)
  hoge -= 1;
end

# 偽の時に実行する式 until 条件式 も等価
print("\nnext until\n");
hoge = 5
(print(hoge);hoge-=1) until hoge ==0

# for num in 1..3 do
# end
for num in 1..3 do
  print(num)
end

# 範囲オブジェクト
# 1..3
# "A".."G"
# ..の場合は最後の値を含む
# ...の場合は最後の値を含まない
# また、必ず範囲がsuccメソッドに従うようにする必要があり
# デフォルトの範囲オブジェクトではG小..大になるように設定する必要がある
for c in "A".."Z" do
  print(c);
end
print "\n"
for c in "A"..."Z" do
  print(c);
end
print "\n"
# doesnt work
for c in "Z"..."A" do
  print(c);
end
# Rangeクラスで定義してもよい
# Range.new(first, last[, exclude_end])
print("a".succ)
print "\n"
print("z".succ)
print "\n"
print("a9".succ)
print "\n"

# eachメソッド
# 基本的にfor文で範囲オブジェクトを扱ったのと同じ仕組である
# 範囲オブジェクト.each{|実行する処理|
# }
# ｛｝の代わりにdo,endを使うことも可能
# 範囲オブジェクト.each do |実行する処理|
# end 
range = 5..10
range.each{|num|
  print(num)
}
# timesメソッド
# 0からX回繰り返すなどの処理に利用する
print("\n")
10.times {|num|
  print(num)
}

# uptoメソッド
print("\n")
3.upto(7) {|num|
  print(num)
}

print("\n")
# downtoメソッド
7.downto(0) {|num|
  print(num)
}

# stepメソッド
# timesメソッドと異なりfloatオブジェクトに対しても適用できる
# オブジェクト.step(limit, stepno) do
# end
print("\n")
2.4.step(5.2, 0.8) {|num|
  print(num)
}

# loopメソッド
# 無限ループを行う
# 抜けるときはbreakを行う
print("\n")
i = 0;
loop {
  print(i)
  if i >= 10 then
    break;
  end
  i += 1
}

print("\n")
i = 0
# next like continue
loop {
  print(i)
  if i >= 10 then
    break;
  end
  if i%2 == 0 then
    i += 2
    next
  end
  i += 1
}

# redo現在の繰り返しを再度最初から行う
# nextとの違いはイテレータの値を次へ進めないということ
# 下記の実装だと無限ループになる
#(1..9).each{|num|
#  print(num,"\n");
#  if num % 3 == 0 then
#    redo
#  end
#}
(1..9).each{|num|
  num += 1;
  print(num,"\n");
  if num % 3 == 0 then
    redo
  end
}

# 配列オブジェクト
# Arrayクラスを省略しているだけなので、等価
array = [1,2,"3"]
print(array[2] + "\n");
print(array.at(2) + "\n");

array = Array[1,2,"3"]
print(array[2] + "\n");
print(array.at(2) + "\n");

# Arrayクラスのコンストラクタより引数でサイズ指定で作成することもできるが、中身はnilで作成される
array1 = Array.new(3)
array2 = Array.new
print(array1[2]);

# 配列オブジェクトの複製
array3 = Array.new(array)
print("#{array3[2]}\n");

# 配列への代入
array[1] = "2番めの要素"
# 配列の長さ
print("length:#{array.length}\n")
array[1] = nil
# countによりカスタマイズした数の集計
print("length:#{array.count{|item| item != nil}}\n")
# 要素へのオブジェクト挿入
# 任意のオブジェクトがいれられるのでもちろん多重配列も可能
array[1] = ["A","B"]
print("length:#{array[1].length} array[1]=#{array[1]}\n")
# 任意の位置に挿入可能だが、歯抜けにすることもできるその場合nilとなる
array[4] = "hoge"
array[6] = "hoge"
print(array)

# ハッシュ
hash = {"Apple" => "red", "Pear" => "fruit"}
print("#{hash["Apple"]}\n")
print("#{hash.fetch("Apple")}\n")
# 通常の取得とfetchとの違い
# 存在しないキーにアクセスしたときに通常の取得の場合、ArgumentErrorとなり、fetchの場合,KeyErrorとなる
#hash("HOGE")
#hash.fetch("HOGE")
# Hashオブジェクトをnewで生成
# 下記により、値のデフォルト値がnoneになる
hash = Hash.new{|hash, key| hash[key] = "none"}
print(hash["notexist"])
print(hash.fetch("notexist"))
# アクセスした時点で要素が追加されている
# 要素数はlength or sizeで取得可能
print("#{hash.length}\n")
# デフォルト値は下記の方法でも変更が可能
hash.default = "new"
print(hash["not"])
print("\n")
# ハッシュのコピー
hash2 = Hash[hash]
# ハッシュの値の変更
# 要素を直接指定する場合と関数を使う場合の2通りがある
hash = Hash.new()
hash.store("TEST", "test")
hash["TEST2"] = "test2"
print(hash)

# top levelで定義されているクラス、オブジェクト
print(self.to_s + "\n")
print(self.class.to_s + "\n")

# defining method
# メソッドは先に定義されていないといけない
# 1文字目は英文字かアンダーバー
# 2文字目以降は英数文字、アンダーバー
def printHello
  print("Hello\n")
end
printHello()
# 引数のあるなしに関わらず2重定義はオーバーライドとなる
def printHello(str)
  print("Hello #{str}\n")
end
printHello("JAPAN")
# methodでの引数は参照渡しとなる。この時オブジェクトそのものを変更する場合は置き換わる
# 引数にはデフォルト値を設定ｓるうことも可能
# 文字列の例だとよくわからない
def addStr(str, appenStr = ", added")
  str << appenStr
end
def doesNotAddStr(str)
  str = str + "added"
end
str = "moji"
addStr(str)
print("#{str}\n")
str = "moji"
doesNotAddStr(str)
print("#{str}\n")

# 配列引数
def printHello(msg, *names)
  allname = ""
  names.each do |name|
    allname << name << " "
  end
  print(msg + " " + allname + "\n")
end
printHello("こんにちは", "A", "B","C")

# 引数のタプル化
def tuppleSample
  return "1","2","3"
end
ret1, ret2, ret3 = tuppleSample()
print(ret1 + ret2 + ret3 + "\n")

# クラス
# インスタンス変数は@記号で始まる
# constructor相当はinitializeを利用する
# accessorを定義することができる
# attr_accessor:読み書き可能
# attr_reader:読み取りのみ可能
# attr_writer:書きこみ可能
# 定数はクラス外からはクラス名::定数でアクセスできる
# 定数の書式は他と同様大文字始まり
class Car
  NAME = "Car Defined class"
  def initialize(carname, detail = "")
    print(NAME)
    @name = carname
    @detail_name = detail
  end

  def dispName
    print(@name + "\n")
  end

  def dispMemo
    print(@memo+ "\n")
  end

  attr_accessor :maker,:type
  attr_reader :detail_name
  attr_writer :memo
end

car = Car.new("Fit", "Fit 1010")
car.dispName
car.maker = "Honda"
print(car.maker + "\n")
car.type = "FF"
print(car.type+ "\n")
print(car.detail_name+ "\n")
# This causes an error
# car.detail_name = "Fit"
car.memo = "this is nice car"
# This causes an error
# print(car.memo)
car.dispMemo
print(Car::NAME)

# 継承
#  < で親クラスを設定できる
#  overrideは単純に同名メソッドで上書きすればよい
#  親クラス定義メソッドはsuperで呼び出せばよく、括弧を省略するとそのまま親クラスの同メソッドに引数が渡される
#
class Fit < Car
  NAME = "Fit Defined class"
  def openWindow
    print("Opened the window")
  end
  def dispName
    super
    print("made by Honda" + "\n")
  end
end
print("\n")
fit = Fit.new("Fit", "Fit 4649")
print("\n")
fit.openWindow
print("\n")
fit.dispName

# アクセス制御
class AccessControl
  def pubMethod
    print("public\n")
  end
  public :pubMethod
  def proMethod
    print("protected\n")
  end
  protected :proMethod
  def priMethod
    print("public\n")
  end
  private :priMethod
end
accessControl = AccessControl.new()
accessControl.pubMethod
# エラーになります
# accessControl.proMethod
# エラーになります
# accessControl.priMethod

module SampleModule
  def sample
    print("sample")
  end
end

class SampleModuleClass
  include SampleModule

  def sampleMethod
    print("sample method\n")
  end
end

sampleModuleImpl = SampleModuleClass.new
sampleModuleImpl.sampleMethod
