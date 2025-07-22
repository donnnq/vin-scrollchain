// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.19;

contract vinOneLoveDiplomacy {
    address public scrollkeeper;
    mapping(string => bool) public nationalNeeds;
    string[] public unityMessages;

    event NeedLogged(string category, string description);
    event UnityMessageBroadcast(string message);

    constructor() {
        scrollkeeper = msg.sender;
        unityMessages.push("One love, one scroll, one future.");
        unityMessages.push("Compassion is the new currency.");
        unityMessages.push("Lambing heals what policy cannot.");
    }

    function logNeed(string memory category, string memory description) external {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may log needs.");
        nationalNeeds[category] = true;
        emit NeedLogged(category, description);
    }

    function broadcastUnityMessage(uint256 index) external {
        require(msg.sender == scrollkeeper, "Scrollkeeper only.");
        require(index < unityMessages.length, "Invalid message index.");
        emit UnityMessageBroadcast(unityMessages[index]);
    }

    function getUnityMessage(uint256 index) external view returns (string memory) {
        return unityMessages[index];
    }
}
