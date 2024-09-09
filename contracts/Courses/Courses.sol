// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ICourses } from "./ICourses.sol";
import { ISolution } from "../ISolution.sol";

contract Courses is ICourses, ISolution  {
    function solve(uint n, uint[] calldata a, uint[] calldata b) external returns (bool) {
        bool[][] memory g = new bool[][](n); 
        uint[] memory inDeg = new uint[](n); 
        bool[] memory seen = new bool[](n); 
        for (uint i = 0; i < n; i++){
            g[i] = new bool[](n); 
        }

        for (uint i = 0; i < a.length; i++){
            g[b[i]][a[i]] = true;  
            inDeg[a[i]]++; 
        }

        uint[] memory que = new uint[](n);
        uint256 ptr = 0;  
        for (uint i = 0; i < n; i++){
            if (inDeg[i] == 0){
                que[ptr++] = i;  
            }
        }

        while (ptr > 0){
            uint u = que[--ptr];
            seen[u] = true;
            for (uint v = 0; v < n; v++){
                if (g[u][v]){
                    inDeg[v]--;
                    if (inDeg[v] == 0){
                        que[ptr++] = v; 
                    }
                }
            }
        }

        bool hasCycle = false;
        for (uint i = 0; i < n; i++){
            if (!seen[i]){
                hasCycle = true;
                break; 
            }
        }
        
        return !hasCycle; 
    }

    function getProblemName() external view returns (string memory){
        return "Courses";
    }

    function getProblemID() external view returns (string memory){
        return "8";
    }
}
