// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage {
    address public owner;
    mapping(string => string) private data;

    event DataStored(string key, string value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function storeData(string memory _key, string memory _value) public onlyOwner {
        data[_key] = _value;
        emit DataStored(_key, _value);
    }

    function getData(string memory _key) public view returns (string memory) {
        return data[_key];
    }
}

