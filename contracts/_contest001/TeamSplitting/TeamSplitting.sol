// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import {ITeamSplitting} from "./ITeamSplitting.sol";
import {ISolution} from "../../ISolution.sol";

contract TeamSplitting is ITeamSplitting, ISolution {
    uint256 constant mod = 1000000007;
    function _power(uint256 u, uint256 v) internal returns (uint256) {
        uint256 ans = 1;
        while (v > 0){
            if (v % 2 == 1){
                ans = ans * u % mod;
            }

            v >>= 1;
            u = u * u % mod; 
        }

        return ans; 
    }
    function C(uint256 k, uint256 n) internal returns (uint256){
        uint256 num = 1;
        uint256 det = 1;
        for (uint256 i = 1; i <= k; i++){
            det = det * i % mod; 
            num = num * (n + 1 - i) % mod;
        }

        return num * _power(det, mod - 2) % mod;
    }
    function solve(uint256 n, uint256 k) external returns (uint256, uint256) {
        if (n % k == 0){
            return (n / k, 1); 
        }

        uint256 teams = n / k + 1;
        // a[1] + a[2] + .. + a[n / k] <= k - n % k; 
        (uint256 t, uint256 lim) = (n / k, k - n % k); 
        // C(t - 1, t - 1) + C(t - 1, t) + ... + C(t - 1, lim + t - 1);
        // using some math -> ans = C(t, lim + t) 
        uint256 k = t;
        if (k >= lim){
            k = lim;
        }

        return (teams, C(k, lim + t));
    }

    function getProblemName() external view returns (string memory){
        return "TeamSplitting";
    }

    function getProblemID() external view returns (string memory){
        return "26";
    }
}
