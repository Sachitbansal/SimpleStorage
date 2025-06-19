// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

// uint and uint256 are same
contract SimpleStorage {
    // storage variable
    uint256 myFavoriteNUmber;

    // creates a list which can only store uint256 values
    // within the square brackets we mention the size of the of array
    // empty means custom size
    uint256[] listOfFavouriteNumbers;

    // we can create our own datatype using struct
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    // creating a person
    Person public sachit = Person(7, "Sachit");
    // this will be default set to 0 since no value is given

    // private variables are only visible in current contract
    // external varibales are only visible externally means can only be called by message(this.func)
    // internal are only visivle internally

    // not writting antthing before the variable name is same as keeping tha variabel internal

    // this function takes external input and assigned it to some internal variable
    function store(uint256 _favoriteNumber) public  {
        myFavoriteNUmber = _favoriteNumber;
    }

    // adding view function disallows any modification of the state
    // changing view to pure will disallow returning any storage variable and will only allow some const value

    function retrieve() public view returns(uint256) {
        return myFavoriteNUmber;
    }

    // Creating a function to add person to the array
    function addPerson(string memory name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, name));
    }


}