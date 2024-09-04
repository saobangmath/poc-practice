// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ITriangles } from "./ITriangles.sol";
import { ISolution } from "../ISolution.sol";


contract Triangles is ITriangles, ISolution {
    function _max(uint a, uint b, uint c) private pure returns (uint){
        if (a >= b && a >= c){
            return a;
        }

        if (b >= a && b >= c){
            return b;
        }
        
        return c;     
    }

    function solve(uint256[] calldata a) external pure returns (uint256) {
        uint256 n = a.length;
        uint256 tot = 0;
        for (uint256 i = 0; i < n; i++){
            for (uint256 j = i+1; j < n; j++){
                for (uint256 k = j + 1; k < n; k++){
                    if (a[i] + a[j] + a[k] > _max(a[i], a[j], a[k]) * 2) {
                        tot++; 
                    }
                }
            }
        }

        return tot; 
    }
    function getProblemName() external view returns (string memory){
        return "Triangles";
    }
    function getProblemID() external view returns (string memory){
        return "5";
    }
}
