// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IClosestSum} from "./IClosestSum.sol";
import {ISolution} from "../ISolution.sol";

contract ClosestSum is IClosestSum, ISolution {
    function solve(int256[] calldata input, int256 target) external returns (uint256) {
        uint256 n = input.length;
        int256 ans = 2000000000;
        for (uint256 i = 0; i < n; i++){
            for (uint256 j = i+1; j < n; j++){
                for (uint256 k = j+1; k < n; k++){
                    int256 tot = input[i] + input[j] + input[k];
                    if (tot >= target && tot - target < ans){
                        ans = tot - target; 
                        continue; 
                    }
                    if (tot < target && target - tot < ans){
                        ans = target - tot; 
                        continue; 
                    }
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
