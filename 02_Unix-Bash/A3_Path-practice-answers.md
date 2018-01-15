# Path Practice

## Absolute path of each directory

/
/Users
/Users/Rochelle
/Users/Rochelle/Thesis
/Users/Rochelle/Teaching
/Users/Rochelle/Teaching/Fall-2015
/Users/Rochelle/Teaching/Spring-2015

## Absolute path with ~

/
/Users
~
~/Thesis
~/Teaching
~/Teaching/Fall-2015
~/Teaching/Spring-2015

## Path Relative to `Thesis`

../../..
../..
..
.
../Teaching
../Teaching/Fall-2015
../Teaching/Spring-2015

## Path Relative to `Fall-2015`

../../../..
../../..
../..
../../Thesis
..
.
../Spring-2015

## Move `file.txt` from `Fall-2015` to `Thesis`, while at `Teaching`
mv Fall-2015/file.txt ../Thesis/file-changed.txt

## Copy every file in `Thesis` to `Spring 2015` while at `Rochelle`
cp Thesis/* Teaching/Spring-2015

cd Thesis
cp * ../Teaching/Spring-2015

cd Teaching
cp ../Thesis/* Spring-2015



