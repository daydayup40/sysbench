########################################################################
# --report-checkpoints tests
########################################################################

  $ if [ -z "$SBTEST_HAS_MYSQL" ]
  > then
  >   exit 80
  > fi

  $ sysbench ${SBTEST_SCRIPTDIR}/oltp_read_write.lua --db-driver=mysql --mysql-dry-run --max-time=3 --max-requests=0 --report-checkpoints=1,2 run | egrep '(Checkpoint report|SQL statistics)'
  [   1s] Checkpoint report:
  SQL statistics:
  [   2s] Checkpoint report:
  SQL statistics:
  SQL statistics:

# Run a test that does not support checkpoint reports

  $ sysbench cpu --report-checkpoints=1 --max-time=2 run | grep 'Checkpoint report'
  [   1s] Checkpoint report:
