// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { IXorQuery } from "./IXorQuery.sol";
import { ISolution } from "../ISolution.sol";


contract XorQuery is IXorQuery, ISolution {
    function solve(uint[] calldata a, uint[] calldata l, uint[] calldata r) external returns (uint[] memory) {
        uint[] memory res = new uint[](l.length);
        
        uint256 n = a.length;
        uint[] memory f =  new uint[](n);
        for (uint256 i =0; i < n; i++){
            f[i] = a[i];
            if (i > 0) f[i] ^= f[i-1];
        }
        for (uint256 i = 0; i < l.length; i++){
            res[i] = f[r[i]];
            if (l[i] > 0) res[i] ^= f[l[i]-1];
        }
        return res;
    }
    function getProblemName() external view returns (string memory){
        return "XorQuery";
    }
    function getProblemID() external view returns (string memory){
        return "10";
    }
}
