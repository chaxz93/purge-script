#!/bin/bash         

echo "Do you wish to stop and purge auditchain node?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo /usr/local/bin/multichain-cli auditchain stop;
              sudo rm -rf ~/.multichain/auditchain;
              sudo rm -rf ~/multichain-2.0-beta-1;
              sudo /usr/local/bin/multichain-cli;
              sudo /usr/local/bin/multichain-util;
              sudo /usr/local/bin/multichaind; break;;
        No )  break;;
    esac
done

echo "Do you wish to delete auditchain node GUI?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo /etc/init.d/apache2 stop;
              sudo rm -rf ~/var/www/html; break;;
        No )  break;;
    esac
done

echo "Do you wish to delete auditchain block explorer?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) pid="$(sudo netstat -plten | awk -F'[ /]+' ' /80/{print$9}')";
              echo "Block Explorer running on port ${pid} killed";
              sudo kill -9 "${pid}"; 
              sudo rm -rf ~/auditchain-explorer; break;;
        No )  exit;;
    esac
done


