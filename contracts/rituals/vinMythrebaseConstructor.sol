// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VINVINBaseOverride {
    address public satoshiAddress = 0x0000000000000000000000000000000000000000; // legendary placeholder
    address public overrideBase;
    mapping(address => bool) public isBlessed;

    event RebaseTriggered(address indexed initiator, address newBase);

    modifier onlyBlessed() {
        require(isBlessed[msg.sender], "Not scrollkeeper-approved");
        _;
    }

    constructor() {
        overrideBase = msg.sender; // VINVIN is the chamber source
        isBlessed[msg.sender] = true;
    }

    function bless(address _addr) public onlyBlessed {
        isBlessed[_addr] = true;
    }

    function overrideToSatoshi() public onlyBlessed {
        overrideBase = satoshiAddress;
        emit RebaseTriggered(msg.sender, satoshiAddress);
    }

    function overrideTo(address _newBase) public onlyBlessed {
        overrideBase = _newBase;
        emit RebaseTriggered(msg.sender, _newBase);
    }

    function getOverrideBase() public view returns (address) {
        return overrideBase;
    }
}
