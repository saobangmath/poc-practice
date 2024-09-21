// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IDistinctQuery} from "./IDistinctQuery.sol";
import {ISolution} from "../../ISolution.sol";

contract DistinctQuery is IDistinctQuery, ISolution {

    function solve(uint[] calldata a, uint[] calldata l, uint[] calldata r) external returns (uint[] memory) {
        uint[] memory res = new uint[](l.length);
        uint[] memory cnt = new uint[](5001);
        for (uint256 i = 0; i < l.length; i++){
            uint left = l[i];
            uint right = r[i]; 
            for (uint idx = left; idx <= right; idx++){
                cnt[a[idx]]++;
                if (cnt[a[idx]] == 1){
                    res[i]++; 
                    if (res[i] == r[i] - l[i] + 1){
                        break;
                    }
                }
            }
            for (uint idx = left; idx <= right; idx++){
                cnt[a[idx]]--;
            }
        }


        return res;
    }

    function getProblemName() external view returns (string memory){
        return "DistinctQuery";
    }

    function getProblemID() external view returns (string memory){
        return "25";
    }
}
