# a) Ctrl + \: '1 p u' x 3; i.e. SERVER PUBLIC IP is entered THRICE

# b) Ctrl + \: '2 p u' x 1; i.e. WORKKER-0 PUBLIC IP is entered ONCE
# c) Ctrl + \: '2 p r' x 2; i.e. WORKER-0 PRIVATE IP is entered TWICE

# d) Ctrl + \: '3 p u' x 1; i.e. WORKER-1 PUBLIC IP is entered ONCE
# e) Ctrl + \: '3 p r' x 2; i.e. WORKER-1 PRIVATE IP is entered TWICE

sed -i 's/172.2.3.4/2pr/g' hvd16uh_run_classifier.sh
sed -i 's/172.3.4.5/3pr/g' hvd16uh_run_classifier.sh

# INSTANCE 1, c5n.18xlarge SERVER-PUBLIC-IP TWICE BELOW:
scp -i trialp32xlarge.pem id_rsa* ubuntu@1pu:/home/ubuntu/.ssh/
scp -i trialp32xlarge.pem hvd16uh_run_classifier.sh ubuntu@1pu:/home/ubuntu/my_bert_tf1/

# INSTANCE 2, p3dn.24xlarge WORKER-0-PUBLIC-IP BELOW:
cat id_rsa.pub | ssh -i trialp32xlarge.pem ubuntu@2pu "cat >> ~/.ssh/authorized_keys"

# INSTANCE 3, p3dn.24xlarge WORKER-1-PUBLIC-IP BELOW:
cat id_rsa.pub | ssh -i trialp32xlarge.pem ubuntu@3pu "cat >> ~/.ssh/authorized_keys"

# INSTANCE 1 PUBLIC-IP and INSTANCE 2 & 3 PRIVATE-IPs BELOW:
lxterminal -e ssh -t -i trialp32xlarge.pem ubuntu@1pu '. tf1/bin/activate; cd my_bert_tf1; bash hvd16uh_run_classifier.sh; bash -l'

sed -i 's/2pr/172.2.3.4/g' hvd16uh_run_classifier.sh
sed -i 's/3pr/172.3.4.5/g' hvd16uh_run_classifier.sh
