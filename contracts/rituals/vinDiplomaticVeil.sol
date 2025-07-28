// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract vinDiplomaticVeil {
    address public veilMaster;
    mapping(bytes32 => string) public scrollReads;
    mapping(address => bool) public flaggedEntities;

    event ScrollDecoded(bytes32 indexed scrollHash, string revealedIntent);
    event EntityFlagged(address indexed entity, string reason);

    modifier onlyVeilMaster() {
        require(msg.sender == veilMaster, "Veil access denied.");
        _;
    }

    constructor() {
        veilMaster = msg.sender;
        scrollReads[keccak256(abi.encodePacked("default"))] = "Veil shimmers, intent obscured.";
    }

    function decodeScroll(string memory encodedGesture) external onlyVeilMaster returns (string memory intent) {
        bytes32 scrollHash = keccak256(abi.encodePacked(encodedGesture));
        intent = scrollReads[scrollHash];

        if (bytes(intent).length == 0) {
            intent = "Scroll unreadable. Possible manipulation detected.";
        }

        emit ScrollDecoded(scrollHash, intent);
    }

    function inscribeScroll(bytes32 scrollHash, string memory intent) external onlyVeilMaster {
        scrollReads[scrollHash] = intent;
    }

    function flagEntity(address entity, string memory reason) external onlyVeilMaster {
        flaggedEntities[entity] = true;
        emit EntityFlagged(entity, reason);
    }

    function checkEntity(address entity) external view returns (bool flagged) {
        return flaggedEntities[entity];
    }
}
