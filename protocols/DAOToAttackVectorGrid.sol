// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToAttackVectorGrid {
    string public batchID = "1321.9.161";
    string public steward = "Vinvin";

    address public admin;

    struct AttackVector {
        string package;     // npm, GitHub repo, etc.
        string vulnerability; // e.g., credential theft, injection
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    AttackVector[] public vectors;

    event VectorLogged(string package, string vulnerability, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logVector(string memory package, string memory vulnerability, uint256 severity) public onlyAdmin {
        vectors.push(AttackVector(package, vulnerability, severity, block.timestamp));
        emit VectorLogged(package, vulnerability, severity);
    }

    function getVector(uint256 index) public view returns (string memory package, string memory vulnerability, uint256 severity, uint256 timestamp) {
        AttackVector memory v = vectors[index];
        return (v.package, v.vulnerability, v.severity, v.timestamp);
    }
}
