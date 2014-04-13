#!/usr/bin/env bash
# set -x

msmtp_path=`type msmtp | awk '{print $3}'`

printf "username: "
read your_user_name
printf "password: "
read your_password
printf "realname: "
read your_real_name
printf "website: "
read your_website

str=".msmtprc .offlineimaprc .muttrc .mutt/signature"
array=($str)
length=${#array[@]}

for name in `ls`
do
    mkdir -p $HOME/mutt.bak
    mv $HOME/.${name}  $HOME/mutt.bak &> /dev/null

    if [ ${name} != "setup.sh" -a ${name} != "README.md" ]
    then
        cp -r ${name} $HOME/.${name}
    fi
done

cd $HOME

for (( i = 0; i < $length; i++ ))
do
    sed -i "s/your_user_name/$your_user_name/"  $HOME/${array[$i]}
    sed -i "s/your_password/$your_password/"    $HOME/${array[$i]}
    sed -i "s/your_real_name/$your_real_name/"  $HOME/${array[$i]}
    sed -i "s/your_website/$your_website/"      $HOME/${array[$i]}
    chmod 600 $HOME/${array[$i]}
done

sed -i "s:msmtp_path:$msmtp_path:" $HOME/.muttrc
chmod +x $HOME/.mutt/mailrun.sh

[ ! -d $HOME/.Mails ] && mkdir $HOME/.Mails
