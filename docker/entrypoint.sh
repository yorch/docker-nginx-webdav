#!/bin/bash

HTPASSWD_FILE=/etc/nginx/htpasswd

if [[ -n "${USERNAME}" ]] && [[ -n "${HASHED_PASSWORD}" ]]
then
	echo "${USERNAME}:${PASSWORD}" > ${HTPASSWD_FILE}
	echo Created htpasswd file with given credentials.
elif [[ -n "${USERNAME}" ]] && [[ -n "${PASSWORD}" ]]
then
	htpasswd -bc ${HTPASSWD_FILE} ${USERNAME} ${PASSWORD}
	echo Hashed given password and created htpasswd file.
else
	echo Using no auth.
	sed -i 's%auth_basic "Restricted";% %g'       /etc/nginx/conf.d/default.conf
	sed -i 's%auth_basic_user_file htpasswd;% %g' /etc/nginx/conf.d/default.conf
fi
