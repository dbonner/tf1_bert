# THIS FILE IS FOR SINGLE MACHINE TRAINING
# (the machine can have 1, 4 or 8 GPUs)
export BERT_BASE_DIR="/home/ubuntu/uncased_L-12_H-768_A-12"
export GLUE_DIR="/home/ubuntu/bert_glue_data"
# GPUS LIST (Uncomment relevant line):
# export NVIDIA_VISIBLE_DEVICES=0               # Single GPU machine
export NVIDIA_VISIBLE_DEVICES=0,1,2,3         # 4 GPU machine
# export NVIDIA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 # 8 GPU machine

export DMLC_WORKER_ID=0 # your worker id
export DMLC_NUM_WORKER=1 # one worker
export DMLC_ROLE=worker
export DMLC_NUM_SERVER=1
export DMLC_PS_ROOT_URI=localhost
export DMLC_PS_ROOT_PORT=10000
bpslaunch python run_classifier_bps.py \
    --task_name=MRPC \
    --do_train=true \
    --do_eval=true \
    --data_dir=$GLUE_DIR/MRPC \
    --vocab_file=$BERT_BASE_DIR/vocab.txt \
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \
    --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
    --max_seq_length=128 \
    --train_batch_size=32 \
    --learning_rate=2e-5 \
    --num_train_epochs=4.0 \
    --output_dir=/home/ubuntu/s3/bert_output/mrpc_output/

