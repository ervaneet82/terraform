#/usr/bin/curl -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/ervaneet82/terraform/commits | jq '.files[].filename'

SHA1=`git log --pretty=oneline --abbrev-commit | head -1 | awk -F' ' '{ print $1 }'`
SHA2=`git log --pretty=oneline --abbrev-commit | head -2 | tail -1  | awk -F' ' '{ print $1 }'`

echo "SHA1: $SHA1"
echo "SHA2: $SHA2"
git diff --name-only $SHA2..$SHA1 > test.txt

git clone https://$TOKEN@github.com/ervaneet82/devops.git
for f in `cat test.txt`
do
  cp $f devops/
done
cd devops
git add -a
git commit -m"test" -a
git push https://$TOKEN@github.com/ervaneet82/devops.git

