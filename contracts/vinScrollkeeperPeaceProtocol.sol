// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinScrollkeeperPeaceProtocol
/// @notice Treaty-grade validator system for humanitarian and conflict-free operations
contract vinScrollkeeperPeaceProtocol {
    address public scrollkeeper;
    mapping(address => bool) public diplomats;
    mapping(bytes32 => bool) public signedTreaties;

    event TreatySigned(bytes32 indexed treatyHash, address indexed diplomat);
    event DiplomatVerified(address indexed diplomat);

    modifier onlyDiplomat() {
        require(diplomats[msg.sender], "Not a verified peacekeeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function verifyDiplomat(address diplomat) external {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can verify");
        diplomats[diplomat] = true;
        emit DiplomatVerified(diplomat);
    }

    function signTreaty(string memory treatyText) external onlyDiplomat {
        bytes32 treatyHash = keccak256(abi.encodePacked(treatyText));
        signedTreaties[treatyHash] = true;
        emit TreatySigned(treatyHash, msg.sender);
    }

    function checkTreaty(string memory treatyText) external view returns (bool) {
        return signedTreaties[keccak256(abi.encodePacked(treatyText))];
    }
}
