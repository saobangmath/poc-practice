// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IHouseRobber } from "./IHouseRobber.sol";
import { ISolution } from "../ISolution.sol";


contract HouseRobber is IHouseRobber, ISolution {
    function solve(uint256[] calldata a) external returns (uint256) {
        uint256 n = a.length;
        if (n == 1){
            return a[0];
        }

        uint256 u = a[0];
        uint256 v = a[1];
        if (v < u){
            v = u;
        }
        
        for (uint256 i = 2; i < n; i++){
            uint256 nv = v;
            uint256 tt = u + a[i];
            if (tt > nv) nv = tt;
            u = v;
            v = nv; 
        }

        return v;
    }
    function getProblemName() external view returns (string memory){
        return "HouseRobber";
    }

    function getProblemID() external view returns (string memory){
        return "11";
    }
}
