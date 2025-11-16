// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WeakCipherRetirementProtocol {
    address public validator;

    struct Cipher {
        string bank;
        string cipherName;
        bool retired;
        uint256 timestamp;
    }

    Cipher[] public ciphers;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function retireCipher(string memory _bank, string memory _cipherName) public onlyValidator {
        ciphers.push(Cipher(_bank, _cipherName, true, block.timestamp));
    }

    function getCipher(uint256 index) public view returns (Cipher memory) {
        return ciphers[index];
    }

    function totalCiphers() public view returns (uint256) {
        return ciphers.length;
    }
}
