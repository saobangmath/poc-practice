// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { INoRepeat } from "./INoRepeat.sol";
import { ISolution } from "../ISolution.sol";


contract NoRepeat is INoRepeat, ISolution {
    function toInt(bytes1 ch) internal pure returns (uint256){
        return uint256(uint8(ch)) - uint256(uint8(bytes1("a")));
    }
    function solve(string calldata s) external pure returns (uint256) {
        bytes memory chrs = bytes(s);
        uint256 n = chrs.length;
        uint256 p2 = 0;
        uint256 ans = 0;
        bool[] memory seen = new bool[](26);
        for (uint256 p1 = 0; p1 < n; p1++){
            if (p1 > 0){
                seen[toInt(chrs[p1 - 1])] = false;
            }
            while (p2 < n){
                uint256 v = toInt(chrs[p2]); 
                if (seen[v]){
                    break; 
                }

                seen[v] = true; 
                p2++; 
            }

            if (ans < p2 - p1) ans = p2 - p1; 
        }

        return ans; 
    }

    function getProblemName() external view returns (string memory){
        return "NoRepeat";
    }

    function getProblemID() external view returns (string memory){
        return "15";
    }
}
