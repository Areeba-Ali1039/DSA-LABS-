#include <iostream>
#include <iomanip>
using namespace std;

class Node {
public:
    int data;
    Node* next;
    Node* prev;

    Node(int value) {
        data = value;
        next = nullptr;
        prev = nullptr;
    }
};

class DLL {
public:
    Node* head;
    Node* tail;

    DLL() {
        head = nullptr;
        tail = nullptr;
    }
    ~DLL() {
        Node* current = head;
        while (current != nullptr) {
            Node* temp = current;
            cout << "Deleting Node with Data: " << temp->data << endl;
            current = current->next;
            delete temp;
        }
        cout << "All nodes deleted successfully!" << endl;
    }

    void display() {
        Node* current = head;
        if (current == nullptr) {
            cout << "List is Empty" << endl;
            return;
        }

        while (current != nullptr) {
            cout << current->data << " ";
            current = current->next;
        }
        cout << endl;
    }
    void Display() {
        Node* temp = head;
        cout << "\n------------------------------------------------------\n";
        cout << "     Prev Address        |   Data   |     Next Address |   Node Address\n";
        cout << "------------------------------------------------------\n";

        while (temp != nullptr) {
            cout << setw(20) << temp->prev
                 << " | " << setw(7) << temp->data
                 << " | " << setw(18) << temp->next
                 << " | " << setw(20) << temp
                 << endl;
            temp = temp->next;
        }
        cout << endl << "Tail: " << tail << endl;
        cout << "------------------------------------------------------\n";
    }
    void insertAtBegin(int value) {
        Node* newNode = new Node(value);
        newNode->next = head;

        if (head != nullptr) {
            head->prev = newNode;
        } else {
            tail = newNode;
        }
        head = newNode;
    }
    void insertAtPos(int position, int value) {
        if (position <= 0) {
            cout << "Invalid position!" << endl;
            return;
        }

        if (head == nullptr || position == 1) {
            insertAtBegin(value);
            return;
        }

        Node* current = head;
        int count = 1;
        while (current->next != nullptr && count < position - 1) {
            current = current->next;
            count++;
        }

        Node* newNode = new Node(value);
        newNode->next = current->next;
        newNode->prev = current;

        if (current->next != nullptr)
            current->next->prev = newNode;
        else
            tail = newNode; 

        current->next = newNode;
    }
    void deleteFB() {
        if (head == nullptr) {
            cout << "List is Empty" << endl;
            return;
        }

        Node* temp = head;
        head = head->next;
        delete temp;

        if (head != nullptr)
            head->prev = nullptr;
        else
            tail = nullptr;
    }
    void DisplayNode(Node* node) {
        if (node == nullptr) {
            cout << "Node not found or NULL!" << endl;
            return;
        }

        cout << "\n------------------------------------------------------\n";
        cout << "     Prev Address        |   Data   |     Next Address |   Node Address\n";
        cout << "------------------------------------------------------\n";
        cout << setw(20) << node->prev
             << " | " << setw(7) << node->data
             << " | " << setw(18) << node->next
             << " | " << setw(20) << node
             << endl;
        cout << "------------------------------------------------------\n";
    }

    void search(int value) {
        Node* current = head;
        while (current != nullptr) {
            if (current->data == value) {
                cout << "Node found...\n";
                DisplayNode(current);
                return;
            }
            current = current->next;
        }
        cout << "Node not found!\n";
    }

    void insertAtEnd(int value) {
        if (tail == nullptr) {
            insertAtBegin(value);
        } else {
            Node* newNode = new Node(value);
            tail->next = newNode;
            newNode->prev = tail;
            tail = newNode;
        }
    }
};

int main() {
    DLL list;
    list.insertAtBegin(10);
    list.insertAtEnd(20);
    list.insertAtEnd(30);
    list.insertAtEnd(40);
    list.insertAtPos(5, 50); 
    list.Display();
    list.deleteFB();
    list.Display();
    list.search(30);

    return 0;
}
