class Queue:
  def __init__(self):
    self.array = []
  def push(self, value):
    self.array.append(value)
  def pop(self):
    if len(self.array) >= 0:
      return self.array.pop(0)
    else:
      print "Error, array length is less than 0"
  def print_array(self):
    print self.array


myQueue = Queue()
myQueue.push(4)
myQueue.push(3)
myQueue.push(18)
myQueue.print_array
myQueue.pop()
myQueue.print_array