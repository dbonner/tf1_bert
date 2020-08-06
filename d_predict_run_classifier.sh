export BERT_BASE_DIR="/media/daniel/samsung/bert_input_tf1/uncased_L-12_H-768_A-12"
export GLUE_DIR="/media/daniel/samsung/bert_inputtf1or2/bert_glue_data"
export TRAINED_CLASSIFIER="/media/daniel/samsung/bert_output_tf1/BERT_BASE/GLUE/MRPC/run_classifier/init_bert_model_ckpt/model.ckpt-343"

python run_classifier.py \
  --task_name=MRPC \
  --do_predict=true \
  --data_dir=$GLUE_DIR/MRPC \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$TRAINED_CLASSIFIER \
  --max_seq_length=128 \
  --output_dir=/media/daniel/samsung/bert_output_tf1/BERT_BASE/GLUE/MRPC/run_classifier/init_bert_model_ckpt/
