#! /bin/sh

mkdir /config
cd /sickrage
if [ -f /config/config.ini ]
then
	rm -rf /sickrage/config.ini
	rm -rf /sickrage/sickbeard.db
else
	touch /config/config.ini
	touch /config/sickbeard.db
#	mv -f /sickbeard/autoprocesstv/autoProcessTV.cfg.sample /config/autoProcessTV.cfg
fi
ln -sf /config/config.ini /sickrage/config.ini
ln -sf /config/sickbeard.db /sickrage/sickbeard.db
cp -ra /sickbeard/autoprocesstv /scripts

/usr/bin/python SickBeard.py
