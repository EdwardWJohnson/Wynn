org 0x7C00
bits 16 ; <--- How much patience I have now, which I'm guessing will be lost. (March 23, 2025)
%define ENDL 0x0D, 0x0A
jmp short start
nop
bdb_oem:db "MSWIN4.1"
bdb_bytes_per_sector:dw 512
bdb_sectors_per_cluster:dw 1
bdb_reserved_sectors:dw 1
bdb_fat_count:dw 2
bdb_dir_entries_count:dw 0E0h
bdb_total_sectors:dw 2880
bdb_media_descriptor_type:db 0F0h
bdb_sectors_per_fat:dw 9
bdb_sectors_per_track:dw 18
bdb_heads:dw 2
bdb_hidden_sectors:dd 0
bdb_large_sector_count:dd 0
ebr_drive_number:db 0
db 0
ebr_signature:db 29h
ebr_volume_id:db 69h,69h,69h,69h
ebr_volume_label:db "ihatemyself"
ebr_system_id: db "FAT12   "
start:
    jmp main
puts:
    push si
    push ax
.loop:
    lodsb
    or al,al
    jz .done
    mov ah,0x0e
    mov bh,0
    int 0x10
    jmp .loop
.done:
    pop ax
    pop si
    ret
main:
    mov ax,0
    mov ds,ax 
    mov es,ax
    mov ss,ax
    mov sp,0x7C00
    mov si,msg_welcome
    call puts
    hlt
.halt:
    jmp .halt
msg_welcome: db "Welcome to WynnOS! [Version: a0.0.3]",ENDL,0
times 510-($-$$)db 0
dw 0AA55h