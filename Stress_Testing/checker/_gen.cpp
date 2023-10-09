#include <bits/stdc++.h>
#include <ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace std;
using namespace __gnu_pbds;
typedef long long ll;
template <class T>
using ordered_set = tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;
#define inputeh freopen("C:\\Users\\Rayat\\Documents\\master\\temp\\_input.txt", "w", stdout);
#define all(x) (x).begin(), (x).end()

ll rnd(ll l, ll r);
string rnd_string(ll n);
vector<pair<ll, ll>> generate_tree(ll n, bool bin);
vector<ll> permu(ll n);

int main()
{
    //
    
        

    //
}

/*










 */
ll rnd(ll l, ll r)
{
    random_device rd;
    mt19937_64 gen(rd());
    uniform_int_distribution<ll> dist(l, r);
    return dist(gen);
}
string alphabet = "abcdefghijklmnopqrstuvwxyz";
string rnd_string(ll n)
{
    string s;
    while (n--)
        s += alphabet[rnd(0, alphabet.size() - 1)];
    return s;
}
vector<pair<ll, ll>> generate_tree(ll n, bool bin = false)
{
    vector<pair<ll, ll>> edges;
    if (bin)
    {
        ordered_set<ll> nodes;
        for (ll i = 1; i <= n; i++)
            nodes.insert(i);
        queue<ll> q;
        q.push(rnd(1, n));
        nodes.erase(q.front());
        while (!q.empty() and nodes.size())
        {
            ll u = q.front();
            q.pop();
            ll k = rnd(1, min(2LL, (ll)nodes.size()));
            while (k--)
            {
                ll v = *nodes.find_by_order(rnd(0, nodes.size() - 1));
                edges.push_back({u, v});
                nodes.erase(v);
                q.push(v);
            }
        }
    }
    else
    {
        vector<ll> rem(n);
        iota(all(rem), 1);
        shuffle(next(rem.begin()), rem.end(), mt19937_64(random_device()()));
        for (ll i = 1; i < n; i++)
            edges.emplace_back(rem[i], rem[rnd(0, i - 1)]);
    }
    return edges;
}
vector<ll> permu(ll n)
{
    vector<ll> p(n);
    iota(all(p), 1);
    shuffle(all(p), mt19937_64(random_device()()));
    return p;
}
