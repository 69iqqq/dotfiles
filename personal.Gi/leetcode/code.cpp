#include <bits/stdc++.h>
#include <vector>
using namespace std;

bool dp[201][10001];

class Solution {
public:
  void dfs(int row, int col, vector<vector<int>> &vis,
           vector<pair<int, int>> &vec, vector<vector<int>> &grid, int row0,
           int col0) {
    vector<pair<int, int>> directions = {{1, 0}, {0, 1}, {-1, 0}, {0, -1}};
    vis[row][col] = 1;
    vec.push_back({row - row0, col - col0});
    for (const auto &dir : directions) {
      int dx = dir.first;
      int dy = dir.second;
      int newRow = row + dx;
      int newCol = col + dy;
      if (newRow >= 0 && newRow < grid.size() && newCol >= 0 &&
          newCol < grid[0].size() && !vis[newRow][newCol] &&
          grid[newRow][newCol] == 1) {
        dfs(newRow, newCol, vis, vec, grid, row0, col0);
      }
    }
  }
  int countDistinctIslands(vector<vector<int>> &grid) {
    int n = grid.size();
    int m = grid[0].size();
    vector<vector<int>> visited(n, vector<int>(m, 0));
    set<vector<pair<int, int>>> st;

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (!visited[i][j] && grid[i][j] == 1) {
          vector<pair<int, int>> vec;
          dfs(i, j, visited, vec, grid, i, j);
          st.insert(vec);
        }
      }
    }
    return st.size();
  }
};
