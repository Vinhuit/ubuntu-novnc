from pexpect import pxssh
import pexpect
import sys
try:
    s = pxssh.pxssh(options={
                    "StrictHostKeyChecking": "no",
                    "UserKnownHostsFile": "/dev/null"})
    hostname = sys.argv[1]
    try:
        name = sys.argv[2]
    except:
        name = "Vinh"
    
    username = 'caubequay00'
    password = 'Qwertyuiop12@#'
    s.login(hostname, username,port="6000",ssh_key="gcloud.pem")
    s.sendline('uptime')   # run a command
    s.prompt()             # match the prompt
    print(s.before)        # print everything before the prompt.
   
    s.sendline('ls')   # run a command
    s.prompt()             # match the prompt
    print(s.before)        # print everything before the prompt.
    s.logout()
except pxssh.ExceptionPxssh as e:
    print("pxssh failed on login.")
    print(e)

