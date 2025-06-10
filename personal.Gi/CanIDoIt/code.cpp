#include <bits/stdc++.h>
using namespace std;
#define int long long int
typedef vector<int> vi;
void solve() {
  int x;
  cin >> x;
  int a = 0, b = 0, c = 0;
  int ans = 0;
  while (a < x) {
    a = min(x, 2 * b + 1);
    swap(a, b);
    swap(b, c);
    ans += 1;
  }
  cout << ans << '\n';
}
int32_t main() {
  ios::sync_with_stdio(false);
  cin.tie(NULL);
  int t = 1;
  cin >> t;
  while (t--)
    solve();
}
