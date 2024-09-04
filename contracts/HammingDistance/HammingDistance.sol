// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IHammingDistance } from "./IHammingDistance.sol";
import { ISolution } from "../ISolution.sol";


contract HammingDistance is IHammingDistance, ISolution {
    function solve(uint[] calldata a) external returns (uint) {
        uint tot = 0;
        for (uint b = 0; b < 30; b++){
            uint c0 = 0;
            uint c1 = 0; 
            for (uint256 i = 0; i < a.length; i++){
                if ((a[i] & (uint256(1) << b)) > 0){
                    c1++;
                }
                else{
                    c0++;
                }
            }

            tot += c0 * c1;
        }

        return tot; 
    }

    function getProblemName() external view returns (string memory){
        return "HammingDistance";
    }

    function getProblemID() external view returns (string memory){
        return "12";
    }
}
