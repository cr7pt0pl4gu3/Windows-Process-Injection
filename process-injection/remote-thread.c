// Using UNICODE macro to set all functions to use the "W" version
#define UNICODE

#include <Windows.h>
#include <stdio.h>
#include <stdlib.h>

// Error wrapper that shows a string and an error code using GetLastError()
int Error(const char *msg) {
    printf("%s (%lu)", msg, GetLastError());
    return EXIT_FAILURE;
}

int main(int argc, const char *argv[]) {
    // Simple char pointer for strtol function
    char *p;

    // Explaining user how to run the program
    if (argc < 3) {
        printf("Usage: remote-thread <pid> <dllpath>\n");
        return EXIT_SUCCESS;
    }

    // Getting process id
    int pid = strtol(argv[1], &p, 10);

    // Opening a handle to the process
    HANDLE hProcess = OpenProcess(PROCESS_VM_WRITE | PROCESS_VM_OPERATION | PROCESS_CREATE_THREAD, FALSE, pid);
    if (!hProcess) {
        return Error("Unable to open a handle to the target process!\n");
    }

    // Allocating memory in the target process for future .dll injection
    void *buffer = VirtualAllocEx(hProcess, NULL, 1 << 12, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if(!buffer) {
        return Error("Failed to allocate memory in the target process!\n");
    }

    // Writing .dll to the target process memory
    if(!WriteProcessMemory(hProcess, buffer, argv[2], strlen(argv[2]), NULL)) {
        return Error("Failed to write .dll in the target process memory!\n");
    }
    printf("%d", pid);
    HANDLE hThread = CreateRemoteThread(hProcess, NULL, 0,
                                        (LPTHREAD_START_ROUTINE)
                                        GetProcAddress(GetModuleHandle(L"kernel32"),"LoadLibraryA"),
                                        buffer, 0, NULL);

    if (!hThread) {
        return Error("Failed to create remote thread!\n");
    }

    return EXIT_SUCCESS;
}