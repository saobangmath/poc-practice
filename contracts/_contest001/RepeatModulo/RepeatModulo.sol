// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IRepeatModulo} from "./IRepeatModulo.sol";
import {ISolution} from "../../ISolution.sol";

contract RepeatModulo is IRepeatModulo, ISolution {
      function solve(uint256 x, uint256 n, uint256 m) external returns (uint256) {
        uint256 no_digits = 0;
        uint256 _x = x;
        while (_x > 0){
            no_digits++;
            _x /= 10; 
        }

        x = x % m; 
        return x * solve1(power(10, no_digits, m), n - 1, m) % m;
    }


    // 1 + x^1 + .. + x^n % m; 
    function solve1(uint256 x, uint256 n, uint256 m)public  returns (uint256){
        if (n == 0){
            return 1 % m;
        }

        if (n % 2 == 0){
            return (solve1(x, n - 1, m) + power(x, n, m)) % m;
        }

        uint256 left = solve1(x, n / 2, m);
        uint256 right = left * power(x, (n + 1) / 2, m) % m;
        return (left + right) % m; 
    }

    function power(uint256 x, uint256 y, uint256 m) public returns (uint256){
        uint256 res = 1;
        while (y > 0){
            if (y % 2 == 1){
                res = res * x % m; 
            }

            y = y / 2;
            x = x * x % m; 
        }
        return res % m; 
    }

    function getProblemName() external view returns (string memory){
        return "RepeatModulo";
    }

    function getProblemID() external view returns (string memory){
        return "22";
    }
}
