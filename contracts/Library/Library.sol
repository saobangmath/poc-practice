// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ILibrary } from "./ILibrary.sol";
import { ISolution } from "../ISolution.sol";

contract Library is ILibrary, ISolution { 
    function solve(uint256[] memory a, uint256[] memory u, uint256[] memory v) external pure returns (uint256) {        
        uint256 n = a.length; 
        uint256 m = u.length;
        uint256[] memory dad = new uint256[](n); 
        uint256[] memory val = new uint256[](n); 
        for (uint256 i = 0; i < n; i++){
            dad[i] = i;
            val[i] = a[i]; 
        }

        for (uint256 i = 0; i < m; i++){
            uint256 x = u[i];
            uint256 y = v[i]; 
            while (x != dad[x]){
                x = dad[x]; 
            }
            
            while (y != dad[y]){
                y = dad[y]; 
            }

            if (x == y){
                continue; 
            }

            dad[x] = y; 
            if (val[y] > val[x]){
                val[y] = val[x]; 
            }
        }

        uint256 tot = 0;
        for (uint256 i = 0; i < n; i++){
            if (dad[i] == i){
                tot += val[i];
            }
        }

        return tot; 
    }

    function getProblemName() external view returns (string memory){
        return "Library";
    }

    function getProblemID() external view returns (string memory){
        return "3";
    }
}
