// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ILibrary } from "./ILibrary.sol";
import { ISolution } from "../ISolution.sol";

contract Library is ILibrary, ISolution { 
    function solve(uint256[] memory a, uint256[] memory u, uint256[] memory v) external pure returns (uint256) {        
        uint256 n = a.length; 
        uint256[] memory dad = new uint256[](n); 
        uint256[] memory sz = new uint256[](n); 
        uint256 tot = 0;
        for (uint256 i = 0; i < n; i++){
            dad[i] = i;
            sz[i] = 1; 
            tot += a[i];
        }

        for (uint256 i = 0; i < u.length; i++){
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

            if (sz[x] > sz[y]){
                (x, y) = (y, x); 
            }

            dad[x] = y; 
            sz[y] += sz[x]; 
            if (a[y] > a[x]){
                tot -= a[y];
                a[y] = a[x]; 
            }
            else{
                tot -= a[x]; 
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
