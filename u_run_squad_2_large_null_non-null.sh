export THRESH=-1.2082452774047852

export BERT_LARGE_DIR="/home/ubuntu/bert_input_tf1/uncased_L-24_H-1024_A-16"
export SQUAD_DIR="/home/ubuntu/bert_input_tf1or2/bert_squad_2.0"

python run_squad.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=False \
  --train_file=$SQUAD_DIR/train-v2.0.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v2.0.json \
  --train_batch_size=12 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=/home/ubuntu/s3/bert_output_tf1/BERT_LARGE/SQUAD_2.0/run_squad/thresh_null_non-null/ \
  --version_2_with_negative=True \
  --null_score_diff_threshold=$THRESH
