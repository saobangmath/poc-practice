// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ISplitArray } from "./ISplitArray.sol";
import { ISolution } from "../ISolution.sol";

contract SplitArray is ISplitArray, ISolution {
    function solve(uint[] calldata a, uint k) external returns (uint) {
        uint256 n = a.length; 
        uint lo = 0; 
        uint hi = 2000000000;
        while (lo < hi){
            uint m = (lo + hi) >> 1;
            uint curSum = 0;
            uint cnt = 1;
            for (uint256 i = 0; i < n; i++){
                curSum += a[i];
                if (a[i] > m){
                    cnt = k + 1;
                    break; 
                }

                if (curSum > m){
                    cnt++; 
                    curSum = a[i];
                }

                if (cnt > k){
                    break; 
                }
            }

            if (cnt <= k){
                hi = m;
            }
            else{
                lo = m + 1;
            }
        }

        return lo; 
    }
    function getProblemName() external view returns (string memory){
        return "SplitArray";
    }
    function getProblemID() external view returns (string memory){
        return "14";
    }
}
