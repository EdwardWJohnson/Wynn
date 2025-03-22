void _start() {
    const char* str = "Welcome to WynnOS!";
    char* video = (char*) 0xB8000; 
    while (*str) {
        *video = *str;
        video += 2;
        str++;
    }
    while (1);
}
