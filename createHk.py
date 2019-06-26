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
os.system("heroku config:set NAME={1} --app={0}".format(buy,sys.argv[4]))
os.system("heroku config:set NAME2={0} --app={1}".format(sys.argv[3],buy))
os.system("heroku config:set BACKUP={0} --app={1}".format(backup,buy))
#os.system("heroku container:release web --app={0}".format(buy))
if len(sys.argv)>5:
    os.system("heroku config:set SYNC={0} --app={1}".format(sys.argv[5],buy))
