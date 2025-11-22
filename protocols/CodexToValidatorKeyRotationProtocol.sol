// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToValidatorKeyRotationProtocol {
    string public batchID = "1321.9.98";
    string public steward = "Vinvin";

    address public admin;

    struct KeyRotation {
        address validator;
        bytes32 oldKeyHash;
        bytes32 newKeyHash;
        uint256 timestamp;
    }

    mapping(address => KeyRotation) public rotationRegistry;

    event KeyRotated(address indexed validator, bytes32 oldKeyHash, bytes32 newKeyHash);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function rotateKey(address validator, bytes32 oldKeyHash, bytes32 newKeyHash) public onlyAdmin {
        rotationRegistry[validator] = KeyRotation(validator, oldKeyHash, newKeyHash, block.timestamp);
        emit KeyRotated(validator, oldKeyHash, newKeyHash);
    }

    function getRotation(address validator) public view returns (bytes32 oldKeyHash, bytes32 newKeyHash, uint256 timestamp) {
        KeyRotation memory r = rotationRegistry[validator];
        return (r.oldKeyHash, r.newKeyHash, r.timestamp);
    }
}
