// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {SimpleStorage} from "../SimpleStorage/SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {

        // through the new keyword, solidity knows to deploy a new contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);

    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // To refer to any smart contract, we need Address and ABI of the contract

        // So first we are retriveing the smart contract stored in the indecx using index number
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];

        // now we use the .store method which we created in SimpleStorage.sol and passing uint256 to it to store the number.
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function stGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}