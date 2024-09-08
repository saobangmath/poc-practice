// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ITriangles } from "./ITriangles.sol";
import { ISolution } from "../ISolution.sol";


contract Triangles is ITriangles, ISolution {
    function _max(uint256 a, uint256 b, uint256 c) private pure returns (uint256){
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
        uint256[] memory data = new uint256[](n); 
        for (uint256 i = 0; i < n; i++){
            data[i] = a[i];
        }

        for (uint256 i = 0; i < n-1; i++){
            uint256 index = i; 
            for (uint256 j = i+1; j < n; j++){
                if (data[j] < data[index]){
                    index = j;
                }
            }

            uint256 tmp = data[index];
            data[index] = data[i];
            data[i] = tmp; 
        }

        for (uint256 k = 2; k < n; k++){
            uint256 j = k - 1;
            for (uint256 i = 0; i < k - 1; i++){
                while (i < j){
                    if (data[i] + data[j] > data[k]){
                        j--; 
                    }
                    else{
                        break; 
                    }
                }

                uint256 start = i;
                if (j > start){
                    start = j;
                }

                tot += k - 1 - start;
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
