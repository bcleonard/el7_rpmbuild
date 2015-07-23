#!/bin/sh -x

ROOTBUILDDIR="/root/rpmbuild"
SPECSDIR=${ROOTBUILDDIR}/SPECS
LOGSDIR=${ROOTBUILDDIR}/LOGS
ERROR=1
RPMBUILD="/usr/bin/rpmbuild"
RPMBUILD_OPTS="-ba"

#
# Check for the existance of the SPECS directory.  Exit if not present
#
if [ ! -d "${SPECSDIR}" ]
then
  exit ${ERROR}
fi

#
# Check for the existance of the LOGS directory.  Exit if not present
#
if [ ! -d "${LOGSDIR}" ]
then
  exit ${ERROR}
fi

#
# logfile for this run
#
LOG="${LOGSDIR}/rpmbuild.log.`date +%Y%m%d%H%M%S`"

#
# start parsing through the rpm spec files
#
for spec in `ls ${SPECSDIR}`
do
  echo "Processing ${spec}" >> ${LOG}
  echo ""
  ${RPMBUILD} ${RPMBUILD_OPTS} ${SPECSDIR}/${spec} >> ${LOG}
done

