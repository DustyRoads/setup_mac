options.subscribe = true

account1 = IMAP {
  server = 'SERVER',
  username = 'USERNAME',
  password = 'PASSWORD',
  ssl = 'ssl3'
}
msgs = account1.INBOX:contain_from('alert@stem.com') +
account1.INBOX:contain_subject('Alert') +
account1.INBOX:contain_subject('Server State')
oldermsgs = msgs:is_older(1) + msgs:is_seen()
oldermsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Alerts'], oldermsgs)

toweralerts = account1.INBOX:contain_from('client_support@stem.com') +
account1.INBOX:contain_subject('Alert')
account1.INBOX:move_messages(account1['INBOX/Alerts'],toweralerts)

gitlabmsgs = account1.INBOX:contain_from('gitlab@gitlab.stem.com')
gitlabmsgs = gitlabmsgs:is_older(1)
gitlabmsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Gitlab'], gitlabmsgs)

oldalertsdel = account1['INBOX/Alerts']:is_older(14)
oldalertsdel:delete_messages()

statusreportmsgs = account1.INBOX:contain_to('Stem Status') +
account1.INBOX:contain_cc('Stem Status') +
account1.INBOX:contain_to('Powergetics Point in Time')
statusreportmsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/status reports'], statusreportmsgs)

provmsgs = account1.INBOX:contain_from('customer_application@stem.com') *
account1.INBOX:contain_subject('Provisioning')
provmsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Provisioning App'], provmsgs)

ticketmsgs = account1.INBOX:contain_from('issues@getmypower.com')
ticketmsgs = ticketmsgs:is_older(1) + ticketmsgs:is_seen()
ticketmsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/issue tracking'], ticketmsgs)

boundarymsgs = account1.INBOX:contain_subject('Report') +
account1.INBOX:contain_from('Cloudability') +
account1.INBOX:contain_from('noreply-reports@stem.com') +
account1.INBOX:contain_subject('report') +
account1.INBOX:contain_from('boundary')
boundarymsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Reports'], boundarymsgs)

icsfmsgs = account1.INBOX:contain_subject('icsf') +
account1.INBOX:contain_subject('intercon')
icsfmsgs:is_older(7)
icsfmsgs:mark_seen()
icsfmsgs:move_messages(account1['INBOX/ICSF'])

applemsgs = account1.INBOX:contain_from('Apple') +
account1.INBOX:contain_to('Apple DL')
applemsgs = applemsgs:is_older(1)
applemsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Apple'], applemsgs)

fdanews = account1.INBOX:contain_from('fdanewswatch')
fdanews:mark_seen()
account1.INBOX:move_messages(account1['INBOX/FDA Newswatch'], fdanews)

boxmsgs = account1.INBOX:contain_subject('Box') +
account1.INBOX:contain_from('Box')
boxmsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Box'], boxmsgs)

liveoffice = account1.INBOX:contain_subject('iveoffice')
liveoffice = liveoffice:is_older(1) + liveoffice:is_seen()
liveoffice:mark_seen()
account1.INBOX:move_messages(account1['INBOX/LiveOffice'], liveoffice)

jenkins = account1.INBOX:contain_subject('Jenkins')
jenkins:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Jenkins'], jenkins)

sgipapps = account1.INBOX:contain_subject('SGIP Application')
sgipapps:mark_seen()
account1.INBOX:move_messages(account1['INBOX/SGIP Applications'], sgipapps)

awsmsgs = account1.INBOX:contain_from('Amazon Web Service') +
account1.INBOX:contain_subject('Amazon Web Service')
awsmsgs = awsmsgs:is_older(1)
awsmsgs:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Amazon Web Services'], awsmsgs)

bizspark = account1.INBOX:contain_from('Bizspark') +
account1.INBOX:contain_subject('BizSpark')
bizspark = bizspark:is_older(1)
bizspark:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Bispark'], bizspark)

--rsicri = account1.INBOX:send_query('rsi-cri')
--rsicri = rsicri:is_older(1)
--account1.INBOX:move_messages(account1['INBOX/RSI-CRI'], rsicri)

sprint = account1.INBOX:contain_subject('Command Center')
sprint:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Sprint'], sprint)

vonage = account1.INBOX:contain_subject('Vonage')
vonage = vonage:is_older(1)
vonage:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Vonage'], vonage)


adobe = account1.INBOX:contain_from('Adobe')
adobe = adobe:is_older(1)
adobe:mark_seen()
account1.INBOX:move_messages(account1['INBOX/Adobe'], adobe)

canceled = account1.INBOX:contain_subject('Canceled:')
canceled = canceled:is_older(1)
canceled:delete_messages()

openadr = account1.INBOX:contain_subject('openadr')
openadr = openadr:is_older(1)
openadr:mark_seen()
account1.INBOX:move_messages(account1['INBOX/OpenADR'], openadr)

shoeii = account1.INBOX:contain_subject('shoei')
shoeii = shoeii:is_older(1)
shoeii:mark_seen()
shoeii:move_messages(account1['INBOX/Shoeii'])

alsco = account1.INBOX:contain_subject('alsco')
alsco = alsco:is_older(1)
alsco:mark_seen()
alsco:move_messages(account1['INBOX/Alsco'])

wj = account1.INBOX:contain_subject('world journal') +
account1.INBOX:contain_subject('worldjournal') +
account1.INBOX:contain_subject('WJ')
wj = wj:is_older(1)
wj:mark_seen()
wj:move_messages(account1['INBOX/WorldJournal'])

extendedstay = account1.INBOX:contain_subject('extended stay') +
account1.INBOX:contain_subject('ESSJ')
extendedstay = extendedstay:is_older(1)
extendedstay:mark_seen()
extendedstay:move_messages(account1['INBOX/ExtendedStay'])

wfh = account1.INBOX:contain_subject('WFH')
wfh = wfh:is_older(7)
wfh:delete_messages()

sdn = account1.INBOX:contain_from('Stem Daily News')
sdn = sdn:is_older(7)
sdn:delete_messages()

django_errors = account1.INBOX:contain_from('root@locahost')
django_errors = django_errors:contain_subject('ERROR')
django_errors = django_errors:is_older(1)
django_errors:move_messages(account1['INBOX/DjangoErrors'])

spam = account1.INBOX:contain_cc('blhill@stem.com')
spam:delete_messages()
