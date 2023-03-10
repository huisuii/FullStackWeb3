// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // versions above 0.8.7 
// pragma solidity >=0.8.7 <0.9.0 // versions above 0.8.7 below 0.9.0

contract SimpleStorage {
    // boolean, uint, int, address, bytes
    bool hasFavoriteNumber = true;
    uint256 favoriteNumbert = 5;
    string favoriteNumberInText = "Five";
    int256 favoriteInt = -5;
    address myAddress = 0x0ace03d49F34f80921A54bB65FB5C11330730d0D;
    bytes32 favoriteBytes = "cat"; // 0x12345jgh, bytes <=32

    uint256 favoriteNumber; 
    // default uint256 internal favoriteNumber = 0;
    // default visibility is internal; public, private, external, internal

	// virtual: to be overrided
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
        // retrieve(); // cost gas
    }

    // view and pure functions disallow modification of state
    // Cost of view and pure functions only applies when called by a contract
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    function add() public pure returns(uint256){
        return (1 + 1);
    }


    People public person = People({favoriteNumber:2 , name: "Nick"});
    mapping(string => uint256) public nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    uint256[] public favoriteNumberList;
    People[] public people;


    // calldata, memory, storage: arrays, structs, mappings
    // calldata: temporary variables that cannot be modified
    // memory: temporary variables that can be modified
    // sotrage: permanent variables that can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // people.push(People(_favoriteNumber, _name));
        People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        people.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}