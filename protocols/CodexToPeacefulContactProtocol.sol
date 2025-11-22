// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToPeacefulContactProtocol {
    string public batchID = "1321.9.109";
    string public steward = "Vinvin";

    address public admin;

    struct Principle {
        string value;
        string description;
        uint256 timestamp;
    }

    Principle[] public principles;

    event PrincipleCodified(string value, string description);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyPrinciple(string memory value, string memory description) public onlyAdmin {
        principles.push(Principle(value, description, block.timestamp));
        emit PrincipleCodified(value, description);
    }

    function getPrinciple(uint256 index) public view returns (string memory value, string memory description, uint256 timestamp) {
        Principle memory p = principles[index];
        return (p.value, p.description, p.timestamp);
    }
}
