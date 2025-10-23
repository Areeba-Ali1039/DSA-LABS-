Doubly Linked List (DLL) in C++
📘 Overview

This project demonstrates the implementation of a Doubly Linked List (DLL) in C++, a dynamic data structure that allows traversal in both directions — forward and backward.

Each node contains:

data → stores an integer value

next → pointer to the next node

prev → pointer to the previous node

The project includes basic operations like insertion, deletion, searching, and node display — along with four key debugging and pointer correction tasks.

🏗️ Class Structure
1. Node Class

Represents a single node of the list.

class Node {
public:
    int data;
    Node* next;
    Node* prev;
    Node(int value);
};


Each node stores:

data: integer value

next: pointer to next node

prev: pointer to previous node

2. DLL Class

Manages the entire linked list and provides key operations:

class DLL {
public:
    Node* head;
    Node* tail;

    DLL();
    ~DLL(); // Destructor (Task 1)
    
    void insertAtBegin(int value);
    void insertAtEnd(int value);
    void insertAtPos(int position, int value); // Task 2
    void deleteFB(); // Delete from front (Task 3)
    void search(int value);
    void display();
    void Display();
    void DisplayNode(Node* node); // Task 4
};


✅ Task 1 – Destructor

Location: Inside class DLL
Purpose: Free all dynamically allocated nodes when the program ends.
Output Example:

Deleting Node with Data: 10
Deleting Node with Data: 20
...
All nodes deleted successfully!

✅ Task 2 – Fix insertAtPos()

Problem: The original function failed when inserting the 5th or last element.
Fix: Added proper handling for:

Empty list

Insertion at beginning

Insertion at end

Insertion at any valid position

Expected Output:

NULL <- [10] <-> [20] <-> [30] <-> [40] <-> [50] -> NULL

✅ Task 3 – Fix deleteFB()

Problem: After deleting the first node, head->prev wasn’t updated — caused invalid pointer access.
Fix:

head = head->next;
if (head != nullptr)
    head->prev = nullptr;
else
    tail = nullptr;


Result:

Before Deletion: 10 <-> 20 <-> 30 <-> 40 <-> 50
After Deletion:  20 <-> 30 <-> 40 <-> 50

✅ Task 4 – Fix DisplayNode()

Problem: Printed all nodes instead of one specific node.
Fix: Removed the loop and displayed only the node passed as a parameter.
Output Example:

------------------------------------------------------
     Prev Address        |   Data   |     Next Address |   Node Address
------------------------------------------------------
  0x0000000000000000     |      25  |   0x0000000000AA |   0x0000000000CC
------------------------------------------------------

🧠 Example Execution
main()
int main() {
    DLL list;

    // Insert elements
    list.insertAtBegin(10);
    list.insertAtEnd(20);
    list.insertAtEnd(30);
    list.insertAtEnd(40);
    list.insertAtPos(5, 50); // Insert at position 5

    list.Display();          // Show all nodes
    list.deleteFB();         // Delete first node
    list.Display();          // Show updated list
    list.search(30);         // Search for a node

    return 0;
}

💻 Sample Output
------------------------------------------------------
     Prev Address        |   Data   |     Next Address |   Node Address
------------------------------------------------------
       0x0000000000      |     10   |   0x00000289BB0  |   0x00000289BA0
       0x00000289BA0     |     20   |   0x00000289BC0  |   0x00000289BB0
       0x00000289BB0     |     30   |   0x00000289BD0  |   0x00000289BC0
       0x00000289BC0     |     40   |   0x00000289BE0  |   0x00000289BD0
       0x00000289BD0     |     50   |   0x0000000000    |   0x00000289BE0
------------------------------------------------------

After deleteFB():
------------------------------------------------------
       0x0000000000      |     20   |   0x00000289BC0  |   0x00000289BB0
       0x00000289BB0     |     30   |   0x00000289BD0  |   0x00000289BC0
       0x00000289BC0     |     40   |   0x00000289BE0  |   0x00000289BD0
       0x00000289BD0     |     50   |   0x0000000000    |   0x00000289BE0
------------------------------------------------------

Node found...
------------------------------------------------------
     Prev Address        |   Data   |     Next Address |   Node Address
------------------------------------------------------
  0x00000289BB0          |     30   |   0x00000289BD0  |   0x00000289BC0
------------------------------------------------------

🧱 Node Structure Diagram
NULL <- [Prev | 10 | Next] <-> [Prev | 20 | Next] <-> [Prev | 30 | Next] -> NULL


Each [Prev | Data | Next] box represents a single node.
Arrows <-> represent double links (both directions).

🧹 Memory Management

Each new node is deleted by the destructor.

No dangling pointers remain.

Prevents memory leaks on program exit.

🧰 Technologies Used

Language: C++

Libraries: <iostream>, <iomanip>

Concepts: Classes, Pointers, Dynamic Memory, Linked Structures

🏁 Learning Outcomes

By completing this project, you’ll understand:

How to dynamically manage linked structures in C++

Proper pointer handling (prev and next)

Safe memory management using destructors

Traversal and manipulation of nodes in both directions

Would you like me to include a diagr
