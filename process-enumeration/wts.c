// Using UNICODE macro to set all functions to use the "W" version
#define UNICODE

#include <Windows.h>
#include <WtsApi32.h>
#include <stdio.h>
#include <stdlib.h>

// Adding WtsApi32 library to linker
#pragma comment(lib, "wtsapi32.lib")

// Error wrapper that shows a string and an error code using GetLastError()
int Error(const char *msg) {
    printf("%s (%lu)", msg, GetLastError());
    return EXIT_FAILURE;
}

int main(void) {
    DWORD level = 1;
    // (PWTS_PROCESS_INFO_EX) == (WTS_PROCESS_INFO_EX*)
    PWTS_PROCESS_INFO_EX info;
    DWORD count;

    // Enumerating processes and saving info in PWTS_PROCESS_INFO_EX structure
    if (!WTSEnumerateProcessesEx(WTS_CURRENT_SERVER_HANDLE, &level, WTS_ANY_SESSION, (LPWSTR *) &info, &count)) {
        return Error("Failed to enumerate processes!\n");
    }

    // Printing processes
    for (DWORD i = 0; i < count; i++) {
        PWTS_PROCESS_INFO_EX p = info + i;
        printf("PID: %lu, Thread: %lu, Session: %lu, Name: %ws\n",
               p->ProcessId, p->NumberOfThreads, p->SessionId, p->pProcessName);
    }

    // Freeing the memory
    WTSFreeMemoryEx(WTSTypeProcessInfoLevel1, info, count);

    return EXIT_SUCCESS;
}