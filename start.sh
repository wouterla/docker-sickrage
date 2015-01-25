#! /bin/sh

mkdir -p /config
mkdir -p /config/cache

cd /sickrage
if [ -f /config/config.ini ]
then
	rm -rf /sickrage/config.ini
	rm -rf /sickrage/sickbeard.db
	rm -rf /sickrage/cache.db
else
	touch /config/config.ini
	touch /config/sickbeard.db
	cp -fr /sickrage/cache/* /config/cache/
	touch /sickrage/cache.db
#	mv -f /sickbeard/autoprocesstv/autoProcessTV.cfg /config/autoProcessTV.cfg
fi
ln -sf /config/config.ini /sickrage/config.ini
ln -sf /config/sickbeard.db /sickrage/sickbeard.db
ln -sf /config/cache /sickrage/cache
ln -sf /sickrage/cache.db /sickrage/cache.db
#ln -sf /config/autoProcessTV.cfg sickbeard/autoprocesstv/autoProcessTV.cfg

/usr/bin/python SickBeard.py
