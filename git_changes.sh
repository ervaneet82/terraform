#/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'

SHA1=`git log --pretty=oneline --abbrev-commit | head -1 | awk -F' ' '{ print $1 }'`
SHA2=`git log --pretty=oneline --abbrev-commit | head -2 | tail -1  | awk -F' ' '{ print $1 }'`

git diff --name-only $SHA2..$SHA1 > test.txt
cat test.txt
git clone https://$TOKEN@github.com/ervaneet82/devops.git
for f in `cat test.txt`
do
  directory=`echo $f | awk -F'/' '{$NF=""; print $0}' | sed 's/ /\//g'`
  file=`echo $f | awk -F'/' '{print $NF}'`
  echo "Directory: $directory"
  echo "File :$file"
  if [ -d $directory ];then
    mkdir -p devops/$directory
    if [ ! -f $file ];then
      cp $directory/$file devops/$directory/
    else
      cp $file devops/
    fi
  fi
done
cd devops
ls
git add .
git config --global user.email "ervaneet82@gmail.com"
git config --global user.name "Vaneet Gupta"
git commit -m"test" -a
git push https://$TOKEN@github.com/ervaneet82/devops.git

