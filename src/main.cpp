#include "raylib.h"

int main() {
    const int screenWidth = 800;
    const int screenHeigth = 600;
    
    InitWindow(screenWidth, screenHeigth, "First Raylib Game");
    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
        DrawText("Hello, Raylib!", 10, 10, 20, DARKGRAY);
        EndDrawing();
    }
    CloseWindow();
    return 0;
}
