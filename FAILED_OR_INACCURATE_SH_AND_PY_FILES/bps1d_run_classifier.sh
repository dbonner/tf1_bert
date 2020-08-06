export BERT_BASE_DIR="/home/daniel/uncased_L-12_H-768_A-12"
export GLUE_DIR="/home/daniel/bert_glue_data"
export NVIDIA_VISIBLE_DEVICES=0  # gpus list
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
    --output_dir=/home/daniel/bert_output/mrpc_output/
