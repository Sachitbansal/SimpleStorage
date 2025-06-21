// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract FallbackExample {
    uint256 public result;

    // if no data sent, only eth sent without any reference and directly sent then recieve gets triggered

    receive() external payable {
        result = 1;
    }

    // triggered when contract called with invalid function which does not exist in the contract

    fallback() external payable { 
        result = 2;
    }
}