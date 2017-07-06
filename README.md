# Humhub IIS Instalation
------------------------

The idea of this repository is to:
- Be able to download HumHub master
- Install on IIS via batch file
  - Add web.host (https://github.com/Buliwyfa/humhub_IIS_web.host)
  - modify grunt file to work on windows (https://github.com/Buliwyfa/humhub_Windows_Grunt)
  - Add IIS permissions
  - Add production or development modifications
  - Enable Pretty URL
  - On development install allow YII tool from every where
  
  
  
REQUIREMENTS
------------
Please note:
 - This assumes public web folder is "public"
 - It requires to have grunt and git installed

How to use it
--------------
1) Download all
2) Make sure is at same level as folder "public" which it is the web public access folder
3) run the .bat file (and wait)


  
  Know issues
  -----------
  - 1st version
  - not enough testing
  - Assumes web publicly access directory is “public” not “wwwroot”

