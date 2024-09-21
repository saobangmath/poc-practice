// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IGridPower} from "./IGridPower.sol";
import {ISolution} from "../../ISolution.sol";

/**
    take aways: 2D pref sum; 
 */
contract GridPower is IGridPower, ISolution {
    function _max(uint256 u, uint256 v) public returns (uint256) {
        if (u > v){
            return u;
        }

        return v; 
    } 

    function solve(uint256 n, uint256[] calldata x, uint256[] calldata y, uint256[] calldata c) external returns (uint256) {
        int256[][] memory prefSum = new int256[][](n + 51);
        for (uint256 r = 0; r < n + 51; r++){
            prefSum[r] = new int256[](n + 51); 
        }

        for (uint256 i = 0; i < x.length; i++){
            uint256 topLeftX = x[i] + 50 - c[i] + 1;
            uint256 topLeftY = y[i] + 50 - c[i] + 1;
            uint256 botRightX = x[i] + 50 + c[i] - 1;
            uint256 botRightY = y[i] + 50 + c[i] - 1;
            while (topLeftX <= botRightX){
                prefSum[topLeftX][topLeftY]++; 
                if (botRightX + 1 <= 50 + n){
                    prefSum[botRightX + 1][topLeftY]--;
                }
                if (botRightY + 1 <= 50 + n){
                    prefSum[topLeftX][botRightY + 1]--;
                }
                if (botRightX + 1 <= 50 + n && botRightY + 1 <= 50 + n){
                    prefSum[botRightX + 1][botRightY + 1]++; 
                }

                topLeftX++; 
                topLeftY++; 
                botRightX--;
                botRightY--; 
            }
        }

        uint256 ans = 0;
        for (uint256 r = 0; r < 50 + n; r++){
            for (uint256 _c = 0; _c < 50 + n; _c++){
                if (r > 0){
                    prefSum[r][_c] += prefSum[r - 1][_c]; 
                }
                if (_c > 0){
                    prefSum[r][_c] += prefSum[r][_c - 1]; 
                }
                if (r > 0 && _c > 0){
                    prefSum[r][_c] -= prefSum[r - 1][_c - 1]; 
                }

                if (r >= 50 && _c >= 50){
                    ans = _max(ans, uint256(prefSum[r][_c]));
                }
            }
        }

        return ans; 
    }

    function getProblemName() external view returns (string memory){
        return "GridPower";
    }

    function getProblemID() external view returns (string memory){
        return "24";
    }
}
