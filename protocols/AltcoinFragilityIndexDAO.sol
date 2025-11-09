// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AltcoinFragilityIndexDAO {
    address public validator;

    struct Altcoin {
        string name;
        uint8 fragilityScore; // 0–100
        string reason;
        uint256 timestamp;
    }

    Altcoin[] public altcoins;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitFragility(string memory _name, uint8 _score, string memory _reason) public onlyValidator {
        require(_score <= 100, "Score must be 0–100");
        altcoins.push(Altcoin(_name, _score, _reason, block.timestamp));
    }

    function getAltcoin(uint256 index) public view returns (Altcoin memory) {
        return altcoins[index];
    }

    function totalAltcoins() public view returns (uint256) {
        return altcoins.length;
    }
}
