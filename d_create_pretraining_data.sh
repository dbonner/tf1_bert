export BERT_BASE_DIR="/media/daniel/samsung/bert_input_tf1/uncased_L-12_H-768_A-12"

python create_pretraining_data.py \
  --input_file=./sample_text.txt \
  --output_file=/media/daniel/samsung/bert_output_tf1/BERT_BASE/create_pretraining_data/tf_examples.tfrecord \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --do_lower_case=True \
  --max_seq_length=128 \
  --max_predictions_per_seq=20 \
  --masked_lm_prob=0.15 \
  --random_seed=12345 \
  --dupe_factor=5
