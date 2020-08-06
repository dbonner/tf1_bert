export DMLC_NUM_WORKER=2
export DMLC_ROLE=server
export DMLC_NUM_SERVER=1
export DMLC_PS_ROOT_URI=172.31.49.102 # the scheduler IP
export DMLC_PS_ROOT_PORT=10000  # the scheduler port
export BYTEPS_SERVER_ENGINE_THREAD=72 # Use C5n.18xlarge

bpslaunch
