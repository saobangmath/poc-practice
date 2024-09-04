// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IATimesBPlusC} from "./IATimesBPlusC.sol";
import {ISolution} from "../ISolution.sol";

contract ATimesBPlusC is IATimesBPlusC, ISolution {
    function solve(uint256 n) external returns (uint256) {
        uint256 ans = 0;
        for (uint256 a = 1; a < n; a++){
            uint256 add = n / a;
            if (n % a == 0){
                add--;
            } 

            ans += add; 
        }
        return ans; 
    }

    function getProblemName() external view returns (string memory){
        return "ATimesBPlusC";
    }

    function getProblemID() external view returns (string memory){
        return "21";
    }
}