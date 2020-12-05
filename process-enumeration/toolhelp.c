// Using UNICODE macro to set all functions to use the "W" version
#define UNICODE

#include <Windows.h>
#include <TlHelp32.h>
#include <stdio.h>
#include <stdlib.h>

// Error wrapper that shows a string and an error code using GetLastError()
int Error(const char *msg) {
    printf("%s (%lu)", msg, GetLastError());
    return EXIT_FAILURE;
}

int main(void) {
    // Getting ToolHelp32 snapshot handle
    HANDLE hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    if (hSnapshot == INVALID_HANDLE_VALUE) {
        return Error("Failed to create a snapshot!\n");
    }

    // Initializing main structure of our process
    PROCESSENTRY32 pe = { sizeof(pe) };

    // Getting the first process
    if(!Process32First(hSnapshot, &pe)) {
        return Error("Failed in Process32First!\n");
    }

    // Getting other processes using a loop until there are no more to show
    do {
        printf("PID: %lu, PPID: %lu, Threads: %lu, Name: %ws\n",
               pe.th32ProcessID, pe.th32ParentProcessID, pe.cntThreads, pe.szExeFile);
    } while (Process32Next(hSnapshot, &pe));

    // Politely closing the handle
    CloseHandle(hSnapshot);

    return EXIT_SUCCESS;
}
