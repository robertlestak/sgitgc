# run git garbage collector in current directory

gitgc() {
  echo "git gc " $1;
  git gc;
}

loop() {
  echo "Starting sgitgc";
  # for each directory in current directory excluding git
  for D in `find . -mindepth 1 -maxdepth 1  -type d -not -path ./.git`
  do
      # Go to directory
      cd $D;
      # run gitgc function
      gitgc $D;
      # go back to parent directory
      cd ..;
  done;
  echo "sgitgc complete";
}


loop;