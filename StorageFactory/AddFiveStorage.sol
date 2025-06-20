// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import {SimpleStorage} from "../SimpleStorage/SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // Since it is an extension, we also have access to the varibles defined in the previous contract

    // Overrides hacve 2 keywords - virtual and override

    // If we have a function defined in SimpleStorage contract and we wish to override it(redefine it), 
    // then we need to add virtual keyword to the fnction where it was orrginialy defined and 
    // redefine the function here with override keyword
    function store(uint256 _newNumber) public override{
        myFavoriteNUmber = _newNumber + 5;
    }

}