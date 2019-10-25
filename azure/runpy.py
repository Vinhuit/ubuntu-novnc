from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.chrome.options import Options
import time, sys ,os ,threading, shutil, json
import re
#import speech_recognition as sr
import os
import subprocess

#from queryAPI import bing, google, ibm
#r = sr.Recognizer()
def getemail():
	from apiclient import errors
	import base64
	import email
	# If modifying these scopes, delete the file token.pickle.
	SCOPES = ['https://www.googleapis.com/auth/gmail.readonly','https://www.googleapis.com/auth/gmail.modify']
	creds = None
	# The file token.pickle stores the user's access and refresh tokens, and is
	# created automatically when the authorization flow completes for the first
	# time.
	if os.path.exists('token.pickle'):
		with open('token.pickle', 'rb') as token:
			creds = pickle.load(token)
	# If there are no (valid) credentials available, let the user log in.
	if not creds or not creds.valid:
		if creds and creds.expired and creds.refresh_token:
			creds.refresh(Request())
		else:
			flow = InstalledAppFlow.from_client_secrets_file(
				'credentials.json', SCOPES)
			creds = flow.run_local_server()
		# Save the credentials for the next run
		with open('token.pickle', 'wb') as token:
			pickle.dump(creds, token)
	
	service = build('gmail', 'v1', credentials=creds)
	
	# Call the Gmail API
	#results = service.users().labels().list(userId='me').execute()
	#labels = results.get('labels', [])
	
	# if not labels:
		# print('No labels found.')
	# else:
		# print('Labels:')
	#for label in labels:
			#print(label['id'])
	user_id='104605678381354538540'
	#label_ids='Label_3510901534034291719'
	label_ids='Label_6056113043921333498'
	try:
		response = service.users().messages().list(userId=user_id,labelIds=label_ids).execute()
		messages = []
		if 'messages' in response:	
			messages.extend(response['messages'])
		
		while 'nextPageToken' in response:
			page_token = response['nextPageToken']
			response = service.users().messages().list(userId=user_id,labelIds=label_ids,pageToken=page_token).execute()
			messages.extend(response['messages'])
		if len(response)>1:
			print(len(response['messages']))
			linklist=[]
			msgIdlist=[]
			#msg_id=response['messages'][1]['id']
			for msg_id in response['messages']:
				msg_id=msg_id['id']
				print(msg_id)
				message = service.users().messages().get(userId=user_id, id=msg_id,format='raw').execute()
				msg_str = base64.urlsafe_b64decode(message['raw'].encode('ASCII'))

				mime_msg = email.message_from_string(msg_str)
				result = re.search('security code: (.*)', str(mime_msg))
				print(result.group(1))
				#linklist.append(re.search("(?security code:[^\s]+)", str(mime_msg)).group("url"))
				
				msgIdlist.append(msg_id)
				#print (linklist)
			#ConfirmEmail(linklist)
			#herokuFork(len(linklist),1)
			for i in msgIdlist:
				service.users().messages().	trash(userId=user_id, id=i).execute();
			return result.group(1)
		else:
			pass
	except:
		print ('An error occurred')
#startNumber = input('Number start: ')
#chrome_options = Options()
#if(headless=='yes'):
#	chrome_options.add_argument("--headless")	
#
#with sr.AudioFile('./audio.wav') as source:
#	audio = r.record(source)

#print("Submitting To Speech to Text:")
#determined = google(audio) # Instead of google, you can use ibm or bing here
#print(determined)

chrome_options = Options()
#chrome_options.add_extension('audiocapture.crx')
driver = webdriver.Firefox("/usr/bin")
driver.implicitly_wait(10)
driver.get("https://docs.microsoft.com/en-us/learn/modules/n-tier-architecture/3-deploy-n-tier-architecture")
time.sleep(95)
pyautogui.typewrite("aaaaaaa")	
elem= driver.switch_to.frame(driver.find_element_by_xpath("//*[@id=\"interactive-container\"]/div/iframe"))
elem = driver.find_element_by_xpath("//*[@id=\"terminal-container\"]")
elem.click()
elem.send_keys("sunup@silvercoin.life")
elem = driver.find_element_by_xpath("//*[@id=\"terminal-container\"]/div/div[2]/canvas[4]")
elem.click()
elem.send_keys("sunup@silvercoin.life")

print("da xing")
time.sleep(1445)
elem = driver.find_element_by_xpath("/html/body/div[4]/div/section/div/div/main/div[3]/div/div[1]/p[2]/a")
elem.click()

elem = driver.find_element_by_xpath("//*[@id=\"signup\"]")
elem.click()

elem = driver.find_element_by_xpath("//*[@id=\"MemberName\"]")
elem.send_keys("sunup@silvercoin.life")

elem = driver.find_element_by_xpath("//*[@id=\"iSignupAction\"]")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"PasswordInput\"]")
elem.send_keys("anhvinh12")
elem = driver.find_element_by_xpath("//*[@id=\"iSignupAction\"]")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"FirstName\"]")
elem.send_keys("tu")
elem = driver.find_element_by_xpath("//*[@id=\"LastName\"]")
elem.send_keys("miu")
elem = driver.find_element_by_xpath("//*[@id=\"iSignupAction\"]")
elem.click()
select = Select(driver.find_element_by_xpath("//*[@id=\"BirthMonth\"]"))
select.select_by_index(4)

select = Select(driver.find_element_by_xpath("//*[@id=\"BirthDay\"]"))
select.select_by_index(4)

select = Select(driver.find_element_by_xpath("//*[@id=\"BirthYear\"]"))
select.select_by_index(20)
elem = driver.find_element_by_xpath("//*[@id=\"iSignupAction\"]")
elem.click()
time.sleep(15)
#code =getemail()
#print (code)



elem = driver.find_element_by_xpath("//*[@id=\"VerificationCode\"]")
#elem.send_keys(code)
time.sleep(7)
elem = driver.find_element_by_xpath("//*[@id=\"iSignupAction\"]")
elem.click()
time.sleep(30)
elem = driver.find_element_by_xpath("//*[@id=\"profile-creation-next\"]")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"acct-confirmation-next\"]")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"email-notifs-skip\"]")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"register-panel\"]/div/a")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"main\"]/div[3]/div/div[1]/p[2]/a")
elem.click()
elem = driver.find_element_by_xpath("//*[@id=\"idSIButton9\"]")
elem.click()

driver.close()

