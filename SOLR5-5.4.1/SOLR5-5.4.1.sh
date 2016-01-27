set -e
SOLR_VERSION=5.4.1
PARCEL_ROOT_DIR=SOLR5-$SOLR_VERSION
wget http://mirrors.dotsrc.org/apache/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz
mkdir $PARCEL_ROOT_DIR
tar xzf solr-$SOLR_VERSION.tgz -C $PARCEL_ROOT_DIR --strip 1
mv  $PARCEL_ROOT_DIR/bin/solr.in.sh $PARCEL_ROOT_DIR/bin/solr.in.sh_base
cp -rf meta $PARCEL_ROOT_DIR
tar zcvf SOLR5-${SOLR_VERSION}-el6.parcel $PARCEL_ROOT_DIR/
sha1sum SOLR5-${SOLR_VERSION}-el6.parcel >> SOLR5-${SOLR_VERSION}-el6.parcel.sha1
rm -rf $PARCEL_ROOT_DIR solr-$SOLR_VERSION.tgz