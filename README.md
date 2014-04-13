### Install

    # yum install -y mutt offlineimap w3m openssl-devel.i686
    # wget http://sourceforge.net/projects/msmtp/files/msmtp/1.4.31/msmtp-1.4.31.tar.bz2
    # tar -xf msmtp-1.4.31.tar.bz2
    # cd msmtp-1.4.31
    # ./configure && make && make install

### Configure

    chmod +x ./setup.sh

### crontab

    # crontab -e
```
/home/yourname/.mutt/mailrun.sh
```

### update mail

    offlineimap -o

### start mutt

    mutt

### help

    ?
