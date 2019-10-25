#!/usr/bin/python
import os,sys
buy=sys.argv[1]
num=sys.argv[1][7:]
backup=sys.argv[2]+"/data"
print backup
arg4=sys.argv[4]

os.system("heroku container:login")
for i in range(1,6):

#with open('listbuy.txt','rt') as f:
 #   lines=f.read().splitlines()
  #  for buy in lines:
    print buy
    print arg4
    os.system("heroku create {0}".format(buy))
    os.system("heroku container:push web --app={0}".format(buy))
    os.system("heroku config:set NAME={1} --app={0}".format(buy,arg4))
    os.system("heroku config:set NAME2={0} --app={1}".format(sys.argv[3],buy))
    os.system("heroku config:set BACKUP={0} --app={1}".format(backup,buy))
    os.system("heroku container:release web --app={0}".format(buy))
    if len(sys.argv)>5:
        os.system("heroku config:set SYNC={0} --app={1}".format(sys.argv[5],buy))
    num=int(num)+1
    buy=sys.argv[1][:7]+str(num)
    arg4=sys.argv[4][:7]+str(num)


