// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IFavoriteNumbers} from "./IFavoriteNumbers.sol";
import {ISolution} from "../../ISolution.sol";

contract FavoriteNumbers is IFavoriteNumbers, ISolution {
    function solve(uint256[] calldata a) external returns (uint256) {
         uint256[] memory cnt = new uint256[](200);
         uint256 ans = 0;
         for (uint256 i = 0; i < a.length; i++){
            uint256 d = a[i] % 200; 
            ans += cnt[d]; 
            cnt[d]++; 
         }

         return ans; 
    }

    function getProblemName() external view returns (string memory){
        return "FavoriteNumbers";
    }

    function getProblemID() external view returns (string memory){
        return "28";
    }
}
