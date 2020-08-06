export BERT_BASE_DIR="/media/daniel/samsung/bert_input_tf1/uncased_L-12_H-768_A-12"

python extract_features.py \
  --input_file=/media/daniel/samsung/bert_input_tf1or2/extract_features_input_file/input.txt \
  --output_file=/media/daniel/samsung/bert_output_tf1/BERT_BASE/extract_featues/output.jsonl \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --layers=-1,-2,-3,-4 \
  --max_seq_length=128 \
  --batch_size=8
