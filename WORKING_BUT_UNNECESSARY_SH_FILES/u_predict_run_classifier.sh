export BERT_BASE_DIR="/home/ubuntu/uncased_L-12_H-768_A-12"
export GLUE_DIR="/home/ubuntu/bert_glue_data"
export TRAINED_CLASSIFIER="/home/ubuntu/s3/bert_output/mrpc_output/model.ckpt-458"

python run_classifier.py \
  --task_name=MRPC \
  --do_predict=true \
  --data_dir=$GLUE_DIR/MRPC \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$TRAINED_CLASSIFIER \
  --max_seq_length=128 \
  --output_dir=/home/ubuntu/s3/bert_output/mrpc_output/
