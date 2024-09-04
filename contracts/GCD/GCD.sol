// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IGCD} from "./IGCD.sol";
import { ISolution } from "../ISolution.sol";


contract GCD is IGCD, ISolution {
    function solve(uint256 a, uint256 b) external pure returns (uint256) {
        if (a > b){
            uint256 u = a;
            a = b; b = u; 
        }

        while (a > 0){   
            b %= a;
            uint256 u = a;
            a = b; b = u; 
        }

        return b; 
    }

    function getProblemName() external view returns (string memory){
        return "GCD";
    }

    function getProblemID() external view returns (string memory){
        return "1";
    }
}
