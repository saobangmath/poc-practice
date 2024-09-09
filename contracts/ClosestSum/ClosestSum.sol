// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IClosestSum} from "./IClosestSum.sol";
import {ISolution} from "../ISolution.sol";

contract ClosestSum is IClosestSum, ISolution {
    function abs(int256 v) private returns (uint256){
        if (v < 0) v = -v;
        return uint256(v); 
    }

    function min(uint256 u, uint256 v) private returns (uint256){
        if (u > v){
            u = v;
        }

        return u; 
    }
    function max(uint256 u, uint256 v) private returns (uint256){
        if (u < v){
            u = v;
        }

        return u; 
    }
    function solve(int256[] calldata input, int256 target) external returns (uint256) {
        uint256 n = input.length;
        if (n <= 3){
            int256 tot = 0;
            for (uint256 i = 0; i < n; i++){
                tot += input[i];
            }

            return abs(tot - target);
        }


        uint256 ans = 2000000000;
        for (uint256 p3 = 2; p3 < n; p3++){
            uint256 p2 = p3 - 1;
            for (uint256 p1 = 0; p1 < p3 - 1; p1++){
                int _tot = input[p1] + input[p3];
                p2 = max(p2, p1 + 1);
                while (p2 > p1){
                    int256 tot = _tot + input[p2];
                    if (tot <= target) break; 
                    else p2--; 
                }

                if (p2 > p1){
                    ans = min(ans, abs(_tot + input[p2] - target));
                }
                if (p2 + 1 < p3){
                    ans = min(ans, abs(_tot + input[p2 + 1] - target)); 
                }
            }
        }
        return uint256(ans); 
    }

    function getProblemName() external view returns (string memory){
        return "ClosestSum";
    }

    function getProblemID() external view returns (string memory){
        return "13";
    }
}
