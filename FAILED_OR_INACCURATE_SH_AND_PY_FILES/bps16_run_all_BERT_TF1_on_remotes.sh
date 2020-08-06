# a) Ctrl + \: '1 p u' x 2; i.e. SCHEDULER PUBLIC-IP is entered TWICE
# b) Ctrl + \: '1 p r' x 2; i.e. SCHEDULER PRIVATE-IP is entered TWICE
# c) Ctrl + \: '2 p u' x 2; i.e. SERVER PUBLIC-IP is entered TWICE
# d) Ctrl + \: '3 p u' x 2; i.e. WORKER-0 PUBLIC-IP is entered TWICE
# e) Ctrl + \: '4 p u' x 2; i.e. WORKER-1 PUBLIC-IP is entered TWICE

sed -i 's/172.31.49.102/1pr/g' bps_scheduler.sh bps_server.sh bps16u0_run_classifier.sh bps16u1_run_classifier.sh

# INSTANCE 1, c5n.18xlarge, PUBLIC-IP-ADDRESS TWICE BELOW:
scp -i trialp32xlarge.pem bps_scheduler.sh ubuntu@1pu:~/my_bert_tf1/
lxterminal -e ssh -t -i trialp32xlarge.pem ubuntu@1pu '. tf1/bin/activate; cd my_bert_tf1; bash bps_scheduler.sh; bash -l'

# INSTANCE 2, c5n.18xlarge, PUBLIC-IP-ADDRESS TWICE BELOW:
scp -i trialp32xlarge.pem bps_server.sh ubuntu@2pu:~/my_bert_tf1/
lxterminal -e ssh -t -i trialp32xlarge.pem ubuntu@2pu '. tf1/bin/activate; cd my_bert_tf1; bash bps_server.sh; bash -l'

# INSTANCE 3,p3dn.24xlarge, PUBLIC-IP-ADDRESS TWICE BELOW:
scp -i trialp32xlarge.pem bps16u0_run_classifier.sh ubuntu@3pu:~/my_bert_tf1/
lxterminal -e ssh -t -i trialp32xlarge.pem ubuntu@3pu '. tf1/bin/activate; cd my_bert_tf1; bash bps16u0_run_classifier.sh; bash -l'

# INSTANCE 4,p3dn.24xlarge, PUBLIC-IP-ADDRESS TWICE BELOW:
scp -i trialp32xlarge.pem bps16u1_run_classifier.sh ubuntu@4pu:~/my_bert_tf1/
lxterminal -e ssh -t -i trialp32xlarge.pem ubuntu@4pu '. tf1/bin/activate; cd my_bert_tf1; bash bps16u1_run_classifier.sh; bash -l'

sed -i 's/1pr/172.31.49.102/g' bps_scheduler.sh bps_server.sh bps16u0_run_classifier.sh bps16u1_run_classifier.sh
