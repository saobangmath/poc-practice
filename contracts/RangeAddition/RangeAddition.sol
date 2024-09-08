// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IRangeAddition} from "./IRangeAddition.sol";
import { ISolution } from "../ISolution.sol";


contract RangeAddition is IRangeAddition, ISolution {
    function solve(uint256 m, uint256 n, uint256[][] calldata ops) external pure returns (uint256) {
       uint256 mu = m;
       uint256 mv = n;
       for (uint256 i = 0; i < ops.length; i++){
        uint256 u = ops[i][0];
        uint256 v = ops[i][1];
        if (mu > u) mu = u;
        if (mv > v) mv = v;
       } 

       return mu * mv;
    }
    function getProblemName() external view returns (string memory){
        return "RangeAddition";
    }

    function getProblemID() external view returns (string memory){
        return "7";
    }
}
