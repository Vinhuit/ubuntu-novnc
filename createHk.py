#!/usr/bin/python
import os,sys
buy=sys.argv[1]
backup=sys.argv[2]+"/data"
print backup
#with open('listbuy.txt','rt') as f:
 #   lines=f.read().splitlines()
  #  for buy in lines:
os.system("heroku create {0}".format(buy))
os.system("heroku container:push web --app={0}".format(buy))
os.system("heroku config:set NAME={0} --app={0}".format(buy))
os.system("heroku config:set BACKUP={0} --app={1}".format(backup,buy))
os.system("heroku container:release web --app={0}".format(buy))

