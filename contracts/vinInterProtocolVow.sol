// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IRemoteProtocolBridge {
    function broadcastVow(bytes32 vowHash, address originator, string calldata purpose) external;
}

contract vinInterProtocolVow {
    address public vowCurator;
    IRemoteProtocolBridge public remoteBridge;
    mapping(bytes32 => bool) public vowRegistry;

    event VowDeclared(bytes32 indexed vowHash, string purpose);
    event VowBroadcasted(bytes32 indexed vowHash, string purpose, string destinationProtocol);

    modifier onlyCurator() {
        require(msg.sender == vowCurator, "Not vow curator");
        _;
    }

    constructor(address _remoteBridge) {
        vowCurator = msg.sender;
        remoteBridge = IRemoteProtocolBridge(_remoteBridge);
    }

    function declareVow(string calldata purpose) external onlyCurator returns (bytes32) {
        bytes32 vowHash = keccak256(abi.encodePacked(purpose, block.timestamp, msg.sender));
        vowRegistry[vowHash] = true;
        emit VowDeclared(vowHash, purpose);
        return vowHash;
    }

    function broadcastToProtocol(bytes32 vowHash, string calldata destinationProtocol) external onlyCurator {
        require(vowRegistry[vowHash], "Vow not registered");
        remoteBridge.broadcastVow(vowHash, msg.sender, destinationProtocol);
        emit VowBroadcasted(vowHash, destinationProtocol, destinationProtocol);
    }

    function isVowRegistered(bytes32 vowHash) external view returns (bool) {
        return vowRegistry[vowHash];
    }
}
