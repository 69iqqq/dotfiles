use std::collections::VecDeque;
struct Solution;
impl Solution {
    fn dfs(src: usize, vis: &Vec<Vec<i32>>, path_vis: &Vec<Vec<i32>>, adj: &Vec<Vec<i32>>) -> bool {
        vis[src] = true;
        path_vis[src] = true;
        for &v in &adj[src] {
            if !vis[v as usize] {
                if Self::dfs(v as usize, vis, path_vis, adj) {
                    return true;
                }
            } else if path_vis[v as usize] {
                return true;
            }
        }
        path_vis[src] = false;
        false
    }
    pub fn find_order(num_courses: i32, prerequisites: Vec<Vec<i32>>) -> Vec<i32> {
        let n = prerequisites.len();
        let m = prerequisites[0].len();
        for i in 0..n {
            let mut adj = vec![vec![]; num_courses as usize];
            for j in 0..prerequisites[i].len() {
                if adj[i][j] == 1 {
                    adj[i + 1].push(j + 1);
                }
            }
        }
        let mut vis = vec![false; num_courses as usize];
        let path_vis = vec![false; num_courses as usize];
        for i in 0..num_courses as usize {
            if !vis[i] {
                if Self::dfs(i, &mut vis, &mut path_vis, &adj) {
                    return vec![];
                }
            }
        }
        vis.into_iter()
            .enumerate()
            .filter_map(|(i, &v)| if v { Some(i as i32) } else { None })
            .collect()
    }
}
fn main() {}
