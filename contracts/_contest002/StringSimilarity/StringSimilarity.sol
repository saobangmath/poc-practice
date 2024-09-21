// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IStringSimilarity} from "./IStringSimilarity.sol";
import {ISolution} from "../../ISolution.sol";


contract StringSimilarity is IStringSimilarity, ISolution {
    function solve(string calldata s) external returns (string memory) {
        bytes memory chars = bytes(s);
        uint256 n = (chars.length + 1) / 2;
        bytes memory a = new bytes(n);

        for (uint256 iter = 1; iter <= 100; iter++){
            for (uint256 i = n+1; i <= 2 * n; i++){
               if ((i / iter) % 2 == 0){
                 a[i-n-1] = "0";
               }
               else{
                 a[i-n-1] = "1";
               }
            }

            bool ok = true;
            for (uint256 i = 0; i < n; i++){
                bool found = false;
                for (uint256 j = i; j < i + n; j++){
                    if (chars[j] == a[j - i]){
                        found = true; break; 
                    }
                }

                if (found){
                    continue; 
                }
                else{
                    ok = false; break; 
                }
            }

            if (ok){
                return string(a); 
            }
        }
        
        return ""; 
    }

    function getProblemName() external view returns (string memory){
        return "StringSimilarity";
    }

    function getProblemID() external view returns (string memory){
        return "27";
    }
}
