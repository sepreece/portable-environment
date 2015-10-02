ssh gdmconsole.ygrid.yahoo.com
ssh replication.blue.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "AlertingService.java"
e ./core/src/main/java/com/yahoo/grid/tools/application/alert/AlertingService.java
find . -name "ServicesRegistry.java"
e ./core/src/main/java/com/yahoo/grid/tools/util/ServicesRegistry.java
ls core/src/main/java/com/yahoo/grid/tools/application/alert
find . -name "DataSetExplorer.java"
e console/src/main/java/com/yahoo/grid/tools/console/explorer/DataSetExplorer.jav
cd src
ls
cd oozie
ls
git pull
ack "@Service"
ack publish
cd ..
cd falcon
git pull
ack publish
cd ../GDM/GDM
ack alertingservice
cd src/falcon
ls
cd messa*
ls
cd src
ls
cd main
s
ls
cd java
ls
cd org
ls
cd apache
ls
cd falcon
ls
cd me*
ls
e *.java
cd src/falcon
ack concrete
ack monitored
cd src/oozie
ack monitored
cd src/falcon
ack messag --type=twiki
ack messag --type=wiki
ack messag
e metrics/src/main/java/org/apache/falcon/aspect/AlertMessage.java
ack TOPIC_NAME
cd src/falcon
ack mapmessage
e messaging/src/main/java/org/apache/falcon/messaging/JMSMessageProducer.java
ack monitored
e metrics/src/main/java/org/apache/falcon/aspect/GenericAlert.java
ack instance-failed
fg
ack failedinstance
fg
hunt . -name "Operability.*"
find . -name "Operability.*"
fg
ack succeededinstance
fg
e common/src/main/java/org/apache/falcon/workflow/WorkflowJobEndNotificationService.java
ssh dense03.blue.ygrid.yahoo.com
ssh gsbl90421.blue.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
ssh replication.blue.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
ssh gsbl90431.blue.ygrid.yahoo.com
cd src/GDM/GDM
git pull
find . -name "*etric*"
e ./core/src/main/java/com/yahoo/grid/tools/metrics/Metric.java
ack "total memory"
ack latencysecdatacommit
fg
ack mapfailures
ack "metric name"
ack metrics.js
fg
ack "@path.*details"
fg
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
git pull
find . -name "WorkflowsResource.java"
e ./webapp/src/main/java/com/yahoo/grid/tools/web/resource/WorkflowsResource.java
find . -name "Jdbc*Dao.java"
fg
ack "@path.*count"
fg
cd src
ls
cd Hive*
ls
ack facebook
ssh replication.red.ygrid.yahoo.com
ssh acquisition.red.ygrid.yahoo.com
scp ,em* .ba* .lo* acquisition.red.ygrid.yahoo.com:
ssh acquisition.red.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "*EventHandler*java"
e ./core/src/main/java/com/yahoo/grid/tools/webhooks/EventHandler.java
e ./replication/webapp/src/main/java/com/yahoo/grid/replication/web/servlet/DataAvailabilityEventHandlerServlet.java
ack dataavailability
e replication/webapp/src/main/webapp/WEB-INF/web.xml
e discovery/src/main/java/com/yahoo/grid/tools/discovery/adaptor/SubscribableDataSetDiscoveryAdaptor.java
find . -name "WebHooksEvent*java"
e ./core/src/main/java/com/yahoo/grid/tools/webhooks/WebHooksEventPublishingService.java
ack "either suspended or"
e workflow/src/main/java/com/yahoo/grid/tools/coordinator/CoordinationService.java
ack registerwithdata
e discovery/src/main/java/com/yahoo/grid/tools/discovery/adaptor/SubscribableDataSetDiscoveryAdaptor.java
ssh acquisition.red.ygrid.yahoo.com
e .bash_aliases
for c in "red blue tan"; do for f in "replication acquisition retention"; do scp .bash_aliases $f.$c.ygrid.yahoo.com:; done; done
for c in "red blue tan"; do for f in "replication acquisition retention"; do echo $f.$c.ygrid.yahoo.com; scp .bash_aliases $f.$c.ygrid.yahoo.com:; done; done
for c in red blue tan; do for f in replication acquisition retention; do echo $f.$c.ygrid.yahoo.com; scp .bash_aliases $f.$c.ygrid.yahoo.com:; done; done
e .ssh/known_hosts
for c in red blue tan; do for f in replication acquisition retention; do echo $f.$c.ygrid.yahoo.com; scp .bash_aliases $f.$c.ygrid.yahoo.com:; done; done
ssh warquickwhole.champ.corp.yahoo.com
cd src/GDM/GDM
find . -name "FileSystemInstanceList*java"
e ./hadoop-discovery/src/main/java/com/yahoo/grid/tools/discovery/query/FileSystemInstanceListQuery.java
ssh replication.tan.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "DataSetSpecificationParserTest.java"
e ./core/src/test/java/com/yahoo/grid/tools/model/dataset/specification/parser/DataSetSpecificationParserTest.java
cd core/src/testresources/data-flow/datasets
cd core
cd src/test/resources/data-flow/datasets
ls
grep "<Path" *
cd src/GDM/GDM
find . -name "FileSystemInstanceList*java"
e ./hadoop-discovery/src/main/java/com/yahoo/grid/tools/discovery/query/FileSystemInstanceListQuery.java
pwd
ls
ls ~/src/GDM//GDM
fg
ssh replication.red.ygrid.yahoo.com
ssh gsbl90214.blue.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
scp .bas* gdmconsole.ygrid.yahoo.com:
ssh gdmconsole.ygrid.yahoo.com
ls /usr
ls /usr/local
ls /
ls /bin
ls -l /usr
ls /usr/share
cd src/GDM/GDM
ls -R web-resource >q
t q
ssh gdmconsole.ygrid.yahoo.com
scp gdmconsole.ygrid.yahoo.com:unique-contacts .
late
rm c1 c2 c3 c4 c5 
late
cd src/GDM/GDM
git pull
ack "@path.*logs"
find . -name "*alert*jsp"
e ./console/src/main/webapp/alert/alerts.jsp
cd src/GDM/GDM
find . -name "editDataSet.jsp"
e ./console/src/main/webapp/dataset/editDataSet.jsp
ack verifyinstance
ack verificationinstance
fg
ack verificationinstance --type=java
fg
cd src/GDM/GDM
ack failuretype
e webapp/src/main/java/com/yahoo/grid/tools/web/util/WorkflowFailureUtils.java
ack wellknown.step.types
fg
cd src/GDM/GDM
ack instancedate
e metastore/tasklet/src/main/java/com/yahoo/grid/tools/metastore/executor/HCatalogClientUtil.java
ssh gdmconsole.ygrid.yahoo.com
cd src/GDM/GDM
ack "constructing remove block reader"
ack "constructing remote block reader"
ssh replication.red.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
ssh warquickwhole.champ.corp.yahoo.com
cd src/GDM/GDM
ack accept header
ack accept-header
ack accept
ack "application/"
e webapp/src/main/java/com/yahoo/grid/tools/web/resource/AlertsResource.java
ack "accept:"
ls
find . -name "Http*java"
e core/src/main/java/com/yahoo/grid/tools/util/HttpGetUtil.java commons/src/main/java/com/yahoo/grid/tools/util/HttpClientHelper.java
ack header-key
e core/src/main/java/com/yahoo/grid/tools/util/HttpGetUtil.java commons/src/main/java/com/yahoo/grid/tools/util/HttpClientHelper.java
ack header_key
cd src/GDM/GDM
ack yck
e .bash_aliases
scp gsbl90216.blue.ygrid.yahoo.com:.bash_aliases q
diff q .bash_aliases
e q .bash_aliases
diff q .bash_aliases
fg
diff q .bash_aliases
mv q .bash_aliases
e .bash_aliases
hostname
fg
scp .bash_aliases gsbl90216.blue.ygrid.yahoo.com:
ssh gsbl90214.blue.ygrid.yahoo.com
ssh gsbl90216.blue.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "BaseConfigResource.java"
e ./console/src/main/java/com/yahoo/grid/tools/configuration/rest/BaseConfigResource.java
ssh gsdaq314.tan.ygrid.yahoo.com
ssh replication.blue.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
cd src/GDM/GDM
ack isinstancewithindaterange
e core/src/main/java/com/yahoo/grid/tools/model/dataset/instance/DataSetIdentifier.java
cd src/GDM/GDM
ack perfstat
ssh gdbl90214.blue.ygrid.yahoo.com
ssh gsbl90214.blue.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
ack droppartition
e metastore/tasklet/src/main/java/com/yahoo/grid/tools/metastore/executor/MetastorePartitionManipulator.java
e metastore/tasklet/src/main/java/com/yahoo/grid/tools/metastore/executor/HCatClientPartitionManipulator.java
find . -name "DefaultMetricsCollector.java"
e ./core/src/main/java/com/yahoo/grid/tools/metrics/collector/DefaultMetricsCollector.java
ack defaultmetricscollector
fg
ssh gdmconsole.ygrid.yahoo.com
ssh gsbl90214.blue.ygrid.yahoo.com
cd src/GDM/GDM
cd core/src/main/java/com/yahoo/grid/tools/event/
ls
back
ack gdmevent
ack gmsevent
ack alertevent
find . -name "Event.java"
ack workflowexecutionevent
ack jms
ack metricevent
cd
cd src/falcon
ls
ack jms
back
cd src/GDM/GDM
ack jms
ack message
ack "import.*message"
ack jms
ack cms
ssh gdmconsole.ygrid.yahoo.com
ssh acquisition.blue.ygrid.yahoo.co
ssh acquisition.blue.ygrid.yahoo.com
cd src/GDM/GDM
ack availability
e discovery/src/main/java/com/yahoo/grid/tools/discovery/adaptor/SubscribableDataSetDiscoveryAdaptor.java
cd src/GDM/GDM
ack console_server_mode
cd src/GDM/GDM
ack replicationvalidation
git pull
ack replicationvalidation
cd src/GDM/GDM
find . -name "*emplat*"
cd src/GDM/GDM
find . -name "*DiscoveryPoller*"
e ./discovery/src/main/java/com/yahoo/grid/tools/discovery/adaptor/poll/DiscoveryPoller.java
find . -name "*ConfigWatcher*java"
fg
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
ack hrs
cd src/GDM/GDM
ack hrs
ack getelapsedfor
e webapp/src/main/java/com/yahoo/grid/tools/web/resource/WorkflowsResource.java
cd src/GDM/GDM
cd retention
ack hio
cd src/GDM/GDM
git pull
ssh gdmconsole.ygrid.yahoo.com
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "FacetSpecificationParser.java"
e ./core/src/main/java/com/yahoo/grid/tools/model/dataset/specification/parser/FacetSpecificationParser.java
find . -name "DataSEtDiscoveryService.java"
find . -name "DataSetDiscoveryService.java"
fg
ack getdiscoverytypes
cd src/GDM/GDM
ack getdiscoverytypes
ssh replication.blue.ygrid.yahoo.com
cd src/GDM/GDM
ack mapdownloaderrors
e core/src/main/java/com/yahoo/grid/tools/workflow/StepExecution.java
e replication/distcopy/src/main/java/com/yahoo/grid/replication/distcopy/tasklet/HFTPDistributedCopy.java
traceroute vpn2-1-gci.corp.yahoo.com
whois 96.120.29.49
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
ack exclude.path.list.override
e replication/distcopy/src/main/java/com/yahoo/grid/replication/distcopy/tasklet/HFTPDistributedCopy.java
ssh replication.blue.ygrid.yahoo.com
ssh gsbl90214.blue.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "WorkflowsResource.java"
e ./webapp/src/main/java/com/yahoo/grid/tools/web/resource/WorkflowsResource.java
find . -name "workflows.jsp"
fg
find . -name "jobs.js"
fg
ssh -X warquickwhole.champ.corp.yahoo.com
ssh warquickwhole.champ.corp.yahoo.com
cd src/GDM/GDM
find . -name "new.*jsp"
find . -name "New.*jsp"
find . -name "new*jsp"
e ./console/src/main/webapp/common/new_header.jsp
find . -name "defaults.js"
e ./console/src/main/webapp/webdev/js/core/defaults.js
find . -name "workflows.jsp"
e ./console/src/main/webapp/workflows/workflows.jsp
ack customcolumns
ack daq.cookie
fg
find . -name "jobs.js"
fg
ssh gsbl90214.blue.ygrid.yahoo.com
ssh warquickwhole.champ.corp.yahoo.com
fg
history 20
e ./console/src/main/webapp/workflows/workflows.jsp
ssh warquickwhole.champ.corp.yahoo.com
top
ssh gsbl90214.blue.ygrid.yahoo.com
traceroute http://flubber-data.blue.ygrid.yahoo.com:9999/loadproxy/4http?redirect=
cfi.ysm.vip.sp1.yahoo.comtraceroute 
traceroute cfi.ysm.vip.sp1.yahoo.com
traceroute flubber-data.blue.ygrid.yahoo.com
traceroute dogma-cfi.data.yahoo.com
traceroute savcfi.data.adx.vip.yahoo.com
traceroute savcfi.data.adx.vip.ac4.yahoo.com
ssh replication.red.ygrid.yahoo.com
cd src/GDM/GDM
ack "XmlElement"
e console/src/main/java/com/yahoo/grid/tools/console/bean/DataSetInstanceSnapshot.java
ack datasetinstancesnapshot
ack xjc
e console/src/main/java/com/yahoo/grid/tools/console/bean/DataSetInstanceSnapshot.java
ack "@xmltype"
ack javax.xml.bind
e acquisition/loader/src/main/java/com/yahoo/grid/daq/pull/http/mapred/HttpDistributedLoaderStrategy.java
e console/src/main/java/com/yahoo/grid/tools/console/bean/KnownDataSet.java
ack knowndataset
ack marshaller
e workflow/src/main/java/com/yahoo/grid/tools/explorer/GDMFacetEventsExplorer.java
ack jaxb
cd src/GDM/GDM
ack javax.xml.ws.service
cd src/GDM/GDM
ack basedir
ack "base.dir"
find . -name "dataset.xsd"
ack pending
e console/src/main/java/com/yahoo/grid/tools/console/bean/DataSetInstanceSnapshot.java console/src/main/java/com/yahoo/grid/tools/console/explorer/DataSetExplorer.java
ssh gdmconsole.ygrid.yahoo.com
cd  src/GDM/GDM
ack transform.output.type.text.class
ack transform.output
ssh acquisition.red.ygrid.yahoo.com
cd src/falcon
ls
ack "@post"
e prism/src/main/java/org/apache/falcon/resource/proxy/SchedulableEntityManagerProxy.java
cd src/GDM/GDM
git pull
ack feed_discovery_default
e commons/src/main/java/com/yahoo/grid/tools/util/PluginProperties.java
cd src/GDM/GDM
e commons/src/main/java/com/yahoo/grid/tools/util/PluginProperties.java
ssh replication.red.ygrid.yahoo.com
ssh retention.ygrid.yahoo.com
ssh retention.red.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
cd src/GDM/GDM
ack instancekey
ssh gdmconsole.ygrid.yahoo.com
ssh replication.blue.ygrid.yahoo.com
ssh retention.blue.ygrid.yahoo.com
scp .ba* .en* .em* .lo* retention.blue.ygrid.yahoo.com:
ssh retention.blue.ygrid.yahoo.com
ssh gsbl90214.blue.ygrid.yahoo.com
ssh replication.blue.ygrid.yahoo.com
ssh retention.blue.ygrid.yahoo.com
ls *ook*
ls
ls -l "--cookie"
ls \-\-cookie
ls "\-\-cookie"
ls -l '--cookie'
clean
ls -l>q
t q
late
ls -alt|head 20
ssh retention.blue.ygrid.yahoo.com
ls *ook*
ls
ls -l "--cookie"
ls \-\-cookie
ls "\-\-cookie"
ls -l '--cookie'
clean
ls -l>q
t q
late
ls -alt|head 20
jobs
kill %1
jobs
ls -alt
jobs
top
late
chmod +x mkcookie
mkcookie
./mkcookie
mv mkcookie createYbyCookie.pl
perl createYbyCookie.pl -u preece -d ygrid -o cookie0923
curl -v --cookie `cat  ybycookie.ybraun`  -d  'resourceNames=[{"ResourceName":"gdm-dataset-ybtest32-15m"},{"ResourceName":"gdm-dataset-ybtest32-hourly"}]' http://gsbl90206.blue.ygrid.yahoo.com:9999/console/rest/config/dataset/getRetentionPolicies
late
curl -v --cookie `cat  cookie0923`  -d  'resourceNames=[{"ResourceName":"gdm-dataset-ybtest32-15m"},{"ResourceName":"gdm-dataset-ybtest32-hourly"}]' http://gsbl90206.blue.ygrid.yahoo.com:9999/console/rest/config/dataset/getRetentionPolicies
man curl
history 10
curl -v --cookie `cat  cookie0923` http://gdmconsole.ygrid.yahoo.com:9999/console/api/userdashboard/instance/detail?frominstance=2015092110&toinstance=2015092114
curl -v --cookie `cat  cookie0923` http://gdmconsole.ygrid.yahoo.com:9999/console/query/config/dataset/Benzene_1_5
history 30
ssh gdmconsole.ygrid.yahoo.com
cd src
cd GDM/GDM
git pull
cd src/GDM/GDM
find . -name "bizuser.js"
e ./console/src/main/webapp/webdev/js/bizuser.js
ssh adm102.ygrid.yahoo.com
ssh adm102.blue.ygrid.yahoo.com
stop-facet console
ssh gsbl90214.blue.ygrid.yahoo.com
cd src/GDM/GDM
find . -name "daqDataTable.js"
e ./console/src/main/webapp/webdev/js/core/daqDataTable.js
fg
find . -name "bizuser.js"
e ./console/src/main/webapp/webdev/js/bizuser.js
fg
ack "oCfgs.*initial"
ack initialload
fg
ssh warquickwhole.champ.corp.yahoo.com
ssh console.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
ssh gsdaqstgcon300.tan.ygrid.yahoo.com
scp .en* .em* .ba* .lo* gsdaqstgcon300.tan.ygrid.yahoo.com:
ssh gsdaqstgcon300.tan.ygrid.yahoo.com
ssh gdmconsole.ygrid.yahoo.com
history 20
sc src/GDM/GDM
cd src/GDM/GDM
ack removeall
e discovery/src/main/java/com/yahoo/grid/tools/monitor/DataSetAvailabilityMonitor.java
e core/src/main/java/com/yahoo/grid/tools/workflow/repository/dao/WorkflowRepositoryConsistencyVerifier.java
e replication/coordinator/src/main/java/com/yahoo/grid/tools/replication/coordinator/workflow/ColoAwareReplicationWorkflowGenerator.java
e retention/discovery/src/main/java/com/yahoo/grid/tools/discovery/filter/TargetAwareRepositoryBasedFilter.java
e workflow/src/main/java/com/yahoo/grid/tools/service/workflow/DefaultAsynchronousWorkflowLauncher.java
e core/src/main/java/com/yahoo/grid/tools/util/classloader/HadoopClassLoaderFactory.java
ssh retention.blue.ygrid.yahoo.com
