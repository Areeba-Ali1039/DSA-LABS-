#include <iostream>
#include <fstream>
#include <sstream>   
#include <string>
using namespace std;

struct Node {
    string ip;     
    Node* prev;    
    Node* next;   

    Node(string value) {
        ip = value;
        prev = nullptr;
        next = nullptr;
    }
};

void insertNode(Node*& head, Node*& tail, const string& ip) {
    Node* newNode = new Node(ip);

    if (head == nullptr) {
        // First node
        head = tail = newNode;
    } else {
        // Attach new node at the end
        tail->next = newNode;
        newNode->prev = tail;
        tail = newNode;
    }
}
void displayForward(Node* head) {
    Node* current = head;
    while (current != nullptr) {
        cout << current->ip;
        if (current->next != nullptr)
            cout << " -> ";
        current = current->next;
    }
    cout << endl;
}
void displayBackward(Node* tail) {
    Node* current = tail;
    while (current != nullptr) {
        cout << current->ip;
        if (current->prev != nullptr)
            cout << " -> ";
        current = current->prev;
    }
    cout << endl;
}

void freeList(Node*& head) {
    Node* current = head;
    while (current != nullptr) {
        Node* temp = current;
        current = current->next;
        delete temp;
    }
    head = nullptr;
}

int main() {
    ifstream file("ips.txt");
    if (!file.is_open()) {
        cerr << "Error: Could not open ips.txt" << endl;
        return 1;
    }

    string line;
    getline(file, line); 
    file.close();

    Node* head = nullptr;
    Node* tail = nullptr;

    stringstream ss(line);
    string ip;
    while (getline(ss, ip, ',')) {
        while (!ip.empty() && (ip.front() == ' ')) ip.erase(ip.begin());
        while (!ip.empty() && (ip.back() == ' ')) ip.pop_back();

        insertNode(head, tail, ip);
    }

    cout << "Forward traversal:\n";
    displayForward(head);

    cout << "\nBackward traversal:\n";
    displayBackward(tail);

    freeList(head);

    return 0;
}
