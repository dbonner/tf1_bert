export BERT_LARGE_DIR="/home/ubuntu/bert_input_tf1/uncased_L-24_H-1024_A-16"
export SQUAD_DIR="/home/ubuntu/bert_input_tf1or2/bert_squad_1.1"

horovodrun -np 8 \
  -H localhost:8 \
  python run_squad_hvd.py \
  --vocab_file=$BERT_LARGE_DIR/vocab.txt \
  --bert_config_file=$BERT_LARGE_DIR/bert_config.json \
  --init_checkpoint=$BERT_LARGE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$SQUAD_DIR/train-v1.1.json \
  --do_predict=True \
  --predict_file=$SQUAD_DIR/dev-v1.1.json \
  --train_batch_size=12 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=256 \
  --doc_stride=128 \
  --output_dir=/home/ubuntu/s3/bert_output_tf1/BERT_LARGE/SQUAD_1.1/run_squad/init_bert_model_ckpt/
