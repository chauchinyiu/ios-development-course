//: [Previous](@previous)

import Foundation
import Combine

//: ##Publishers and Subscribers
//: You can subscribe to a publisher by calling sink on in
print("--------- Publishers and Subscribers ----------------------")
let publisher = Just("Combine Swift")
let subscribtion = publisher.sink { value in
  print(value)
}

//: using sequence
let sequencePublisher = Publishers.Sequence<[Int], Never>(sequence: [1,2,3,5,6])
let subscribtion2 = sequencePublisher.sink { value in
  print(value)
}

//: You can also use the sink method to receive an event when the publisher is finished
let subscriber = publisher.sink(receiveCompletion: { _ in
    print("finished")
}) { value in
    print(value)
}

//:Subscribers can be also canceled at any time in order to avoid receiving events from the publishers by simply calling cancel on them
subscriber.cancel()

//: ##Subjects
print("----------------- Subjects 1 ----------------------")
let subject_a = PassthroughSubject<String, Never>()
let publisher_a  = subject_a.eraseToAnyPublisher()

let subscriber_a = publisher_a.sink(receiveValue: { value in
    print(value)
})

subject_a.send("Combine") //The Subscriber will print "Combine"
subject_a.send("Swift")   //The Subscriber will print "Swift"

print("----------------- Subjects 2 ----------------------")
let subject_b = PassthroughSubject<String, Never>()
let publisher_b = subject_b.eraseToAnyPublisher()


let subscriber_b = publisher_b.sink(receiveValue: { value in
    print("\(value) from subscriber_b")
})

//subscriber1 will recive the events but not the subscriber_c
subject_b.send("Event1")
subject_b.send("Event2")


let subscriber_c = publisher_b.sink(receiveValue: { value in
    print("\(value) from subscriber_c")
})
//subscriber_c and subscriber_b will recive this event
subject_b.send("Event3")

