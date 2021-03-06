export BERT_BASE_DIR="/media/daniel/samsung/bert_input_tf1/uncased_L-12_H-768_A-12"
export SQUAD_DIR="/media/daniel/samsung/bert_input_tf1or2/bert_squad_1.1"

python run_squad.py \
    --vocab_file=$BERT_BASE_DIR/vocab.txt \
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \
    --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
    --do_train=True \
    --train_file=$SQUAD_DIR/train-v1.1.json \
    --do_predict=True \
    --predict_file=$SQUAD_DIR/dev-v1.1.json \
    --train_batch_size=12 \
    --learning_rate=3e-5 \
    --num_train_epochs=2.0 \
    --max_seq_length=256 \
    --doc_stride=128 \
    --output_dir=/media/daniel/samsung/bert_output_tf1/BERT_BASE/SQUAD_1.1/run_squad/init_bert_model_ckpt/
