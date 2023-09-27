#!/bin/bash

cleanup () {
  for file in "${1}.aux" "${1}.log" "${1}.out" "${1}.pdf" "${1}.toc"; do
    rm -f ${file}
  done
}

makebatch () {
  lualatex --interaction=batchmode --halt-on-error "${1}.tex" > /dev/null
  if [ $? != 0 ]; then
    cat "${1}".log
    return 1
  fi
}

echo "Compiling PDF Documents. Please wait..."

makebatch atsc
if [ $? != 0 ]; then
  exit 1
fi
makebatch atsc
if [ $? != 0 ]; then
  exit 1
fi
makebatch atsc
if [ $? != 0 ]; then
  exit 1
fi

if [ -f atsc.pdf ]; then
  mv atsc.pdf FCC-Letter-TwoSided.pdf
  echo "FCC-Letter-TwoSided.pdf created."
  echo "Creating single-sided. Please wait..."
  cleanup atsc
else
  echo "Uh-oh, something went wrong."
  exit 1
fi

cat atsc.tex |\
sed -e s?"twoside=true"?"twoside=false"? > oneside.tex

makebatch oneside
if [ $? != 0 ]; then
  exit 1
fi
makebatch oneside
if [ $? != 0 ]; then
  exit 1
fi
makebatch oneside
if [ $? != 0 ]; then
  exit 1
fi

if [ -f oneside.pdf ]; then
  mv oneside.pdf FCC-Letter-OneSided.pdf
  echo "FCC-Letter-OneSided.pdf created."
  rm -f oneside.tex
  cleanup oneside
else
  echo "Uh-oh, something went wrong."
  exit 1
fi




