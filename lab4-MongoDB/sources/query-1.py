# Jan Gołda, 291431

from pymongo import MongoClient

# connect
client = MongoClient()
question = client.jeopardy.question

# Query 1 - quesions from rounds 'double' and 'final' in show number 2047, ordered by question value
# (ordered is lexicographical order, since given data is broken and sometimes uses "," ect.)
result = question.find({
    "round": {"$in": ["Double Jeopardy!", "Final Jeopardy!"]},
    "show_number": "2047"
  }, {
    "value": 1,
    "question": 1,
    "answer": 1,
    "_id": 0
  }).sort("value")

# display
for q in result:
  print("{value}\t{question:.40}...\t{answer}".format(**q))

# cleanup
client.close()
