#!/bin/bash

# Matn ni shifrlash uchun funksiya
encrypt() {
    echo "Shifrlash metodini tanlang:"
    echo "1) Base64"
    echo "2) Hex (16-lik)"
    read -p "Quyidagi raqamlardan birini kiriting: " choice

    read -p "Shifrlash uchun matn ni kiriting: " input_text

    case $choice in
        1)
            # Base64 shifrlash
            encrypted_text=$(echo -n "$input_text" | base64)
            ;;
        2)
            # Hex (16-lik) shifrlash

            encrypted_text=$(echo -n "$input_text" | xxd -p | tr -d '\n')
            ;;
        *)
            echo "Noto'g'ri tanlov!"
            exit 1
            ;;
    esac

    echo "Shifrlangan matn: $encrypted_text"
}

# Shifrlangan kodni matnga aylantirish uchun funksiya
decrypt() {
    echo "Shifrlash metodini tanlang:"
    echo "1) Base64"
    echo "2) Hex (16-lik)"
    read -p "Quyidagi raqamnlardan birini kiriting: " choice

    read -p "Shifrlangan matn ni kiriting: " encrypted_text

    case $choice in
        1)
            # Base64 shifrdan chiqarish
            decrypted_text=$(echo -n "$encrypted_text" | base64 --decode)
            ;;
        2)
            # (16-lik) hex shifrdan chiqarish
            decrypted_text=$(echo -n "$encrypted_text" | xxd -r -p)
            ;;
        *)
            echo "Noto'g'ri tanlov!"
            exit 1
            ;;
    esac

    echo "Shifrdan chiqarilgan matn: $decrypted_text"
}

# Asosiy dastur
echo "Quyidagilardan birini tanlang:"
echo "1) Shifrlash"
echo "2) Shifrdan chiqarish"
read -p "Raqamni kiriting: " action

case $action in
    1)
        encrypt
        ;;
    2)
        decrypt
        ;;
    *)
        echo "Noto'g'ri tanlov!"
        exit 1
        ;;
esac
