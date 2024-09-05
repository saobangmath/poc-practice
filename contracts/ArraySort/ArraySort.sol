// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IArraySort} from "./IArraySort.sol";
import {ISolution} from "../ISolution.sol";

contract ArraySort is IArraySort, ISolution {
    function swap(uint256[] memory a, uint256 i, uint256 j) private {
        uint256 t = a[i];
        a[i] = a[j];
        a[j] = t; 
    }
    function solve(uint256[] memory a) external pure returns (uint256[] memory) {
        uint256 n = a.length;
        for (uint256 i = 0; i < n - 1; i++){
            uint256 index = i;
            for (uint256 j = i + 1; j < n; j++){
                if (a[index] > a[j]){
                    index = j;
                }
            }

            if (index == i){
                continue; 
            }
        }

        return a;
    }
    function getProblemName() external view returns (string memory){
        return "ArraySort";
    }

    function getProblemID() external view returns (string memory){
        return "2";
    }
}
