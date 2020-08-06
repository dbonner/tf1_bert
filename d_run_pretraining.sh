export BERT_BASE_DIR="/media/daniel/samsung/bert_input_tf1/uncased_L-12_H-768_A-12"

python run_pretraining.py \
  --input_file=/media/daniel/samsung/bert_output_tf1/BERT_BASE/create_pretraining_data/tf_examples.tfrecord \
  --output_dir=/media/daniel/samsung/bert_output_tf1/BERT_BASE/run_pretraining \
  --do_train=True \
  --do_eval=True \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --train_batch_size=32 \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --num_train_steps=20 \
  --num_warmup_steps=10 \
  --learning_rate=2e-5
