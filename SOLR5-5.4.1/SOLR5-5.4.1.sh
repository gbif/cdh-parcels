set -e
SOLR_VERSION=5.4.1
PARCEL_ROOT_DIR=SOLR5-$SOLR_VERSION
wget http://mirrors.dotsrc.org/apache/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
mkdir $PARCEL_ROOT_DIR
tar xzf solr-$SOLR_VERSION.tgz -C $PARCEL_ROOT_DIR --strip 1
mv  $PARCEL_ROOT_DIR/bin/solr.in.sh $PARCEL_ROOT_DIR/bin/solr.in.sh_base
cp  jts-1.13.jar $PARCEL_ROOT_DIR/server/solr-webapp/webapp/WEB-INF/lib/
cp -f set-map-reduce-classpath.sh $PARCEL_ROOT_DIR/server/scripts/map-reduce/
cp -rf meta $PARCEL_ROOT_DIR
tar zcvf SOLR5-${SOLR_VERSION}-el7.parcel $PARCEL_ROOT_DIR/
sha1sum SOLR5-${SOLR_VERSION}-el7.parcel >> SOLR5-${SOLR_VERSION}-el7.parcel.sha1
rm -rf $PARCEL_ROOT_DIR solr-$SOLR_VERSION.tgz
