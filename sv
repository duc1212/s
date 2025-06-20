#include <iostream>
#include <string>
using namespace std;

typedef struct SinhVien* sv;

struct SinhVien {
    string maSV;
    string hoTen;
    int tuoi;
    SinhVien* next;
};

class DanhSachSinhVien {
private:
    SinhVien* head;

public:
    DanhSachSinhVien() {
        head = nullptr;
    }

    void themSinhVien(string maSV, string hoTen, int tuoi) {
        sv sv = new SinhVien{maSV, hoTen, tuoi, nullptr};
        if (head == nullptr) {
            head = sv;
        } else {
            SinhVien* temp = head;
            while (temp->next != nullptr)
                temp = temp->next;
            temp->next = sv;
        }
    }

    void hienThiDanhSach() {
        SinhVien* temp = head;
        while (temp != nullptr) {
            cout << "Ma SV: " << temp->maSV << ", Ho ten: " << temp->hoTen << ", Tuoi: " << temp->tuoi << endl;
            temp = temp->next;
        }
    }

    void timKiemSinhVien(string maSV) {
        SinhVien* temp = head;
        while (temp != nullptr) {
            if (temp->maSV == maSV) {
                cout << "Tim thay: " << temp->hoTen << ", Tuoi: " << temp->tuoi << endl;
                return;
            }
            temp = temp->next;
        }
        cout << "Khong tim thay sinh vien!" << endl;
    }

    void xoaSinhVien(string maSV) {
        if (head == nullptr) return;

        if (head->maSV == maSV) {
            SinhVien* temp = head;
            head = head->next;
            delete temp;
            cout << "Da xoa sinh vien co ma: " << maSV << endl;
            return;
        }

        SinhVien* prev = head;
        SinhVien* curr = head->next;
        while (curr != nullptr && curr->maSV != maSV) {
            prev = curr;
            curr = curr->next;
        }

        if (curr != nullptr) {
            prev->next = curr->next;
            delete curr;
            cout << "Da xoa sinh vien co ma: " << maSV << endl;
        } else {
            cout << "Khong tim thay sinh vien de xoa!" << endl;
        }
    }

    ~DanhSachSinhVien() {
        while (head != nullptr) {
            SinhVien* temp = head;
            head = head->next;
            delete temp;
        }
    }
};

int main() {
    DanhSachSinhVien dssv;

    dssv.themSinhVien("SV001", "Nguyen Van A", 20);
    dssv.themSinhVien("SV002", "Le Thi B", 21);
    dssv.themSinhVien("SV003", "Tran Van C", 19);

    
    dssv.hienThiDanhSach();

   
    dssv.timKiemSinhVien("SV002");

    
    dssv.xoaSinhVien("SV002");

    
    dssv.hienThiDanhSach();

    return 0;
}


