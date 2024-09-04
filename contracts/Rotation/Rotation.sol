pragma solidity ^0.8.0;

import {IRotation} from "./IRotation.sol";
import { ISolution } from "../ISolution.sol";


contract Rotation is IRotation, ISolution {
    function solve(uint256[] calldata nums) external returns (uint256) {
        uint256 n = nums.length;
        uint256 ans = nums[0]; 

        if (n == 1){
            return ans; 
        }

        uint256 lo = 1; 
        uint256 hi = n - 1;
        while (lo < hi){
            uint256 m = (lo + hi) / 2;
            if (nums[m] >= nums[0]) lo = m + 1;
            else hi = m; 
        }

        if (nums[lo] < ans){
            ans = nums[lo]; 
        }

        return ans;
    }
    function getProblemName() external view returns (string memory){
        return "Rotation";
    }
    function getProblemID() external view returns (string memory){
        return "6";
    }
}
