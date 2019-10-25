#counter=1
#name=$(echo $NAME | cut -c4-)
#counter=${name##+(0)}
while true ;
do
  #if [[ "$counter" -eq 0 ]]; then
  #     user="caubequay00@zrhino.tk"
  #fi
 # url="http://xjsonserver01.herokuapp.com/temp/"$counter
 # echo $url
 # user=$(curl $url | jq -r '.device')
 # echo $user
  rm ~/.ssh/known_hosts 
#  az login --tenant 604c1504-c6a3-4080-81aa-b33091104187 --username $user --password Anhvinh12@#
  sleep 2
  numdev=$(az vm list-ip-addresses | jq -r '.[].virtualMachine.name' | wc -l)
if [ $numdev -lt 87 ]
  then
  for i in `seq 1 5`;
  do
    myip=0
    export resource=$(az resource list  | jq -r 'first(.[].resourceGroup)')
    export myip=$(az vm create --name $RANDOM --resource-group $resource --image UbuntuLTS --size Standard_DS3_v2 --location southeastasia --admin-username caubequay00 --admin-password Qwertyuiop12@# | echo $(jq -r 'first(.publicIpAddress)'))
    expect exp.exp $myip
    rm ~/.ssh/known_hosts 
  done
else
	az vm list-ip-addresses | jq -r '.[].virtualMachine.network.publicIpAddresses[].ipAddress' | xargs -i expect exp.exp {}
        sleep 60
fi
  echo "done"
 # counter=$((counter+1))
  #user=$(curl $url | jq -r '.device')
  #if [[ "$counter" -gt 5 ]]; then
#	  counter=1
  sleep 10
 #fi
done
