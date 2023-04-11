#!/bin/bash

# script file path including script name & filetype ( likely .sh)
script_path=

# path to directory to clean video segments out of
dir_clean_path=

#create script to be run
sudo cat > ${script_path} << EOL
#!/bin/bash
find ${dir_clean_path} \( -name "*.m4a" -o -name "*.m4v" -o -name "*.ts" \) -mmin +1 -exec rm {} \;
EOL

# make script executeable
sudo chmod +x ${script_path}

# create root crontab
sudo touch /etc/crontab 

# create root cronjob that runs every minute
sudo crontab -l | { cat; echo "* * * * * ${script_path}"; } | sudo crontab -
