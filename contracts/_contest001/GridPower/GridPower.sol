// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IGridPower} from "./IGridPower.sol";
import {ISolution} from "../../ISolution.sol";

contract GridPower is IGridPower, ISolution {
    function _max(int256 u, int256 v) public returns (int256) {
        if (u > v){
            return u;
        }

        return v; 
    } 

    function _abs(int256 u) public returns (int256){
        if (u >= 0) return u;
        return -u; 
    }

    function solve(uint256 n, uint256[] calldata x, uint256[] calldata y, uint256[] calldata c) external returns (uint256) {
        uint256 l = c.length;
        uint256 ans = 0; 
        for (uint256 _r = 0; _r < n; _r++){
            for (uint256 _c = 0; _c < n; _c++){
                uint256 add = 0; 
                for (uint256 i = 0; i < l; i++){
                    int256 f1 = _abs(int256(x[i]) - int256(_r));
                    int256 f2 = _abs(int256(y[i]) - int256(_c));
                    int256 v = _max(0, int256(c[i]) - _max(f1, f2));
                    add += uint256(v);
                }

                if (add > ans){
                    ans = add; 
                }
            }
        }

        return uint256(ans); 
    }

    function getProblemName() external view returns (string memory){
        return "GridPower";
    }

    function getProblemID() external view returns (string memory){
        return "24";
    }
}
