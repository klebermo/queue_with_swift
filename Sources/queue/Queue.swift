class Node<T> {
    var data: T
    var next: Node<T>?
    var previous: Node<T>?

    init(_ data: T) {
        self.data = data
        self.next = nil
        self.previous = nil
    }
}


class Queue<T> {
    var begin: Node<T>?
    var end: Node<T>?

    init() {
        self.begin = nil
        self.end = nil
    }

    func queue(_ value: T) {
        var aux = begin
        var auxPrevious: Node<T>? = nil

        if begin == nil {
            begin = Node(value)
        } else {
            while(aux != nil) {
                auxPrevious = aux
                aux = aux?.next
            }
            aux = Node(value)
            aux?.previous = auxPrevious
            auxPrevious?.next = aux
            end = aux
        }
    }

    func dequeue() -> T? {
        if begin == nil {
            return nil
        } else {
            let aux = begin
            let auxPrevious = begin?.next

            auxPrevious?.previous = nil
            begin?.next = nil
            begin = auxPrevious

            return aux?.data
        }
    }
}
