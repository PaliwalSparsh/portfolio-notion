#!/bin/bash
# copy notablog content to output
cd /Users/sparshpaliwal/Desktop/repos/notablog-starter ; 
notablog generate . ;
cd public ;
rm -rf home.html ;
cp -R ../../portfolio/out/. . ;

# copy next.js content to output
cd /Users/sparshpaliwal/Desktop/repos/portfolio
sed -i '' 's/<Image/<img/g' ./components/ProjectCard.js;
sed -i '' 1d ./components/ProjectCard.js;
sed -i '' 's/<Image/<img/g' ./pages/index.js;
sed -i '' 1d ./pages/index.js;
npm run export ;
sleep 15;
cp -R /Users/sparshpaliwal/Desktop/repos/portfolio/public/out/. /Users/sparshpaliwal/Desktop/repos/notablog-starter/public/.
git checkout . ; 

cd /Users/sparshpaliwal/Desktop/repos/notablog-starter/public ; 
git add . ;
git commit -m "Deploy" ;
git cherry-pick 13514e6de910fd3edfdb9a1614ddfb1a4c76a1a7 ;
git push origin -f master;
cd ..