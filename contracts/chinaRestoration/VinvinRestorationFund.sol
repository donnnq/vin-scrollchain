// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract VinvinRestorationFund {
    address public steward;
    mapping(address => bool) public verifiedCitizens;
    mapping(address => uint256) public blessings;

    event BlessingSent(address indexed citizen, uint256 amount);
    event CitizenVerified(address indexed citizen);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized.");
        _;
    }

    function verifyCitizen(address citizen) public onlySteward {
        verifiedCitizens[citizen] = true;
        emit CitizenVerified(citizen);
    }

    function bless(address citizen, uint256 amount) public onlySteward {
        require(verifiedCitizens[citizen], "Not verified.");
        blessings[citizen] += amount;
        emit BlessingSent(citizen, amount);
    }

    function getBlessing(address citizen) public view returns (uint256) {
        return blessings[citizen];
    }
}
