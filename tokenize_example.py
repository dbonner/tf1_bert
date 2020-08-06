import tokenization

### Input
orig_tokens = ["John", "Johanson", "'s",  "house"]
labels      = ["NNP",  "NNP",      "POS", "NN"]

vocab_file = "/media/daniel/samsung/bert_input/uncased_L-12_H-768_A-12/vocab.txt"

### Output
bert_tokens = []

# Token map will be an int -> int mapping between the `orig_tokens` index and
# the `bert_tokens` index.
orig_to_tok_map = []

tokenizer = tokenization.FullTokenizer(
    vocab_file=vocab_file, do_lower_case=True)

bert_tokens.append("[CLS]")
for orig_token in orig_tokens:
  orig_to_tok_map.append(len(bert_tokens))
  bert_tokens.extend(tokenizer.tokenize(orig_token))
bert_tokens.append("[SEP]")

# bert_tokens == ["[CLS]", "john", "johan", "##son", "'", "s", "house", "[SEP]"]
# orig_to_tok_map == [1, 2, 4, 6]
print(f"bert_tokens = {bert_tokens}")
print(f"orig_to_tok_map = {orig_to_tok_map}")
